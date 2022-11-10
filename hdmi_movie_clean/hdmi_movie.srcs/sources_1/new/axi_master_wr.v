
module axi_master_wr(
         mclk       ,
         mreset_n   ,
                              //axi ports
     awid       ,
     awaddr     ,
     awlen      ,
     awsize     ,
     awburst    ,
     awvalid    ,
     awready    ,
     wid        ,
     wdata      ,
     wstrb      ,
     wlast      ,
     wvalid     ,
     wready     ,
     bid        ,
     bresp      , 
     bvalid     ,
     bready     ,
               // config ports
     mode       ,
     bstate_out ,
               // axis ports
     wr_en      ,
     wr_addr    ,
     wr_length  ,
     wr_ready   ,
     svalid     ,
     sdata      ,
     slast      ,
     sready     
		) ;
parameter    ADDR_WIDTH      = 32   ;
parameter    DATA_WIDTH      = 32   ;
parameter    ID_WIDTH        = 4    ;
parameter    AWLEN_WIDTH     = 4    ;
parameter    WSTRB_WIDTH     = 4    ;
parameter    AWSIZE_WIDTH    = 3    ;
parameter    AWBURST_WIDTH   = 2    ;
parameter    BRESP_WIDTH     = 2    ;
parameter    WR_LENGTH_WIDTH = 16   ;
parameter    AWSIZE          = 3    ;
parameter    WID             = 4    ;
input              mclk       ;
input              mreset_n   ;
                              //axi ports
output   [ID_WIDTH-1      :0]     awid       ;
output   [ADDR_WIDTH-1    :0]     awaddr     ;
output   [AWLEN_WIDTH-1   :0]     awlen      ;
output   [AWSIZE_WIDTH-1  :0]     awsize     ;
output   [1 :0]                   awburst    ;
output                            awvalid    ;
input                             awready    ;
output   [ID_WIDTH-1      :0]     wid        ;
output   [DATA_WIDTH-1    :0]     wdata      ;
output   [WSTRB_WIDTH-1   :0]     wstrb      ;
output                            wlast      ;
output                            wvalid     ;
input                             wready     ;
input  [ID_WIDTH-1        :0]     bid        ;
input  [BRESP_WIDTH-1     :0]     bresp      ; 
input                             bvalid     ;
output                            bready     ;
                              // config ports;
input  [15:0]                     mode       ;
output                      			bstate_out     ;
                              // axis ports
input                             wr_en      ;
input  [ADDR_WIDTH-1      :0]     wr_addr    ;
input  [WR_LENGTH_WIDTH-1 :0]     wr_length  ;
output                            wr_ready   ;
input                             svalid     ;
input  [DATA_WIDTH-1      :0]     sdata      ;
input                             slast      ;
output                            sready     ;

parameter        IDLE   = 3'b001 ;
parameter        TRANS  = 3'b010 ;
parameter        DONE   = 3'b100 ;

parameter        BIDLE  = 4'b0001 ;
parameter        AWADDR = 4'b0010 ;
parameter        WDATA  = 4'b0100 ;
parameter        WRESP  = 4'b1000 ;

reg [2 :0]       mstate      ; //main state machine
reg [2 :0]       mstate_next ; 
reg [3 :0]       bstate      ; //burst trans state machine OB
reg [3 :0]       bstate_next ;
reg [WR_LENGTH_WIDTH-AWLEN_WIDTH-AWSIZE-1 : 0]    burst_cnt   ;
reg [AWLEN_WIDTH-1 :0]                            btrans_cnt  ;
wire             btrans_done                                  ;
reg              wresp_flag                                   ;
wire             btrans_en                                    ;
reg [ADDR_WIDTH-1      :0]                        wr_addr_d   ;
reg [WR_LENGTH_WIDTH-1 :0]                        wr_length_d ;
reg [ADDR_WIDTH-1      :0]                        awaddr      ;
wire                                              awaddr_en   ;
//-------------------------------------------------------------------
wire [1:0]    awburst_mode  = mode[1:0]                       ;
//----------------write addr ch--------------------------------------
assign   awaddr_en = (awvalid&&awready)? 1'b1:1'b0            ;
assign   awlen     = ((burst_cnt== {{WR_LENGTH_WIDTH-AWLEN_WIDTH-1{1'b0}},1'b1}))? wr_length_d[AWSIZE_WIDTH+AWLEN_WIDTH-1 : AWSIZE_WIDTH] - {{AWLEN_WIDTH-1{1'b0}},1'b1} : {AWLEN_WIDTH{1'b1}} ;
assign   awsize    = AWSIZE  ;
assign   awburst   = awburst_mode                             ;
//----------------write addr ch--------------------------------------
assign awvalid = (bstate==AWADDR)? 1'b1 : 1'b0                    ; 

always@(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	awaddr <=#1 {WSTRB_WIDTH{1'b0}} ;
      end
    else if(wr_en&&wr_ready)
      begin
	awaddr <=#1 wr_addr ;
      end
    else if((awaddr_en == 1'b1)&&((burst_cnt== {{WR_LENGTH_WIDTH-AWLEN_WIDTH-1{1'b0}},1'b1}))&&(wr_length_d[AWLEN_WIDTH-1:0]!={AWLEN_WIDTH{1'b0}}))
      begin
        awaddr <=#1 awaddr + {{ADDR_WIDTH-AWLEN_WIDTH{1'b0}}, wr_length_d[AWLEN_WIDTH-1:0]} ;
      end
    else if(awaddr_en == 1'b1)
      begin
        awaddr <=#1 awaddr + {{ADDR_WIDTH-AWLEN_WIDTH-AWSIZE{1'b0}},1'b1,{AWSIZE+AWLEN_WIDTH{1'b0}}} ;
      end
    else
      begin
	awaddr <=#1 awaddr ;
      end
  end
//-----------------write data ch ------------------------------------
assign wdata     = sdata                                          ;
assign wvalid    = (bstate==WDATA)? svalid : 1'b0                 ;
//assign wlast     = slast                                          ;
assign sready    = (bstate==WDATA)? wready : 1'b0                 ;
assign wid       = WID                                            ;
assign wstrb     = {WSTRB_WIDTH{1'b1}}                            ;
//---------------------for wlast --------------------------------
 
assign  wlast = ((btrans_cnt=={AWLEN_WIDTH{1'b0}})&&((wready&&wvalid)==1'b1)) ? 1'b1 : 1'b0 ;
///////////////////////////////////////////////////////////////////// 
//----------------wr cmd --------------------------------------------
assign wr_ready = (mstate==IDLE)? 1'b1:1'b0 ;
//---------------get wr_length --------------------------------------
always@(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	wr_length_d <=#1 {WR_LENGTH_WIDTH{1'b0}} ;
      end
    else if(wr_en && wr_ready)
      begin
	wr_length_d <=#1 wr_length ;
      end
    else
      begin
	wr_length_d <=#1 wr_length_d ;
      end
  end

//---------------get wr_addr --------------------------------------
always@(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	wr_addr_d <=#1 {ADDR_WIDTH{1'b0}} ;
      end
    else if(wr_en && wr_ready)
      begin
	wr_addr_d <=#1 wr_addr ;
      end
    else
      begin
	wr_addr_d <=#1 wr_addr_d ;
      end
  end
//------------------fot btrans_en ----------------------------------
assign  btrans_en = (mstate==TRANS)? 1'b1 : 1'b0 ;
//---------------btrans data counter ****---------------------------
always@(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	btrans_cnt <=#1 {AWLEN_WIDTH{1'b0}} ;
      end
    else if((burst_cnt== {{WR_LENGTH_WIDTH-AWLEN_WIDTH-AWSIZE-1{1'b0}},1'b1})&&(bstate==BIDLE)&&(btrans_en==1'b1))
      begin
	btrans_cnt <=#1 wr_length_d[AWSIZE+AWLEN_WIDTH : AWSIZE] - {{AWLEN_WIDTH-1{1'b0}},1'b1} ;
      end
    else if((bstate==BIDLE)&&(btrans_en==1'b1))
      begin
	btrans_cnt <=#1 {AWLEN_WIDTH{1'b1}} ;
      end
    else if((bstate==WDATA)&&wready&&wvalid)
      begin
	btrans_cnt <=#1 btrans_cnt - {{AWLEN_WIDTH-1{1'b0}},1'b1} ;
      end
    else
      begin
        btrans_cnt <=#1 btrans_cnt ;
      end
  end
//--------burst counter -------------------------------------------
always@(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	burst_cnt <=#1 {{WR_LENGTH_WIDTH-AWLEN_WIDTH-AWSIZE-4{1'b0}},4'hf} ;
      end
    else if(wr_en&&wr_ready)
      begin
        if((wr_length[AWLEN_WIDTH+AWSIZE-1:0]=={AWLEN_WIDTH+AWSIZE{1'b0}}))
          begin
	    burst_cnt <=#1 wr_length[WR_LENGTH_WIDTH-1 : AWLEN_WIDTH+AWSIZE ];
          end
        else
          begin
	    burst_cnt <=#1 wr_length[WR_LENGTH_WIDTH-1 : AWLEN_WIDTH+AWSIZE ] + {{WR_LENGTH_WIDTH-AWLEN_WIDTH-AWSIZE-1{1'b0}},1'b1} ;
          end
      end
    else if(btrans_done==1'b1)
      begin
	burst_cnt <=#1 burst_cnt - {{WR_LENGTH_WIDTH-AWLEN_WIDTH-AWSIZE-1{1'b0}},1'b1} ;
      end
    else
      begin
	burst_cnt <=#1 burst_cnt ;
      end
  end
//---------------btrans_done--------------------------------------
assign btrans_done = ((wresp_flag==1'b1)&&(bstate == WRESP)) ? 1'b1 : 1'b0 ;
//---------------- product bready -------------------------------------------
assign bready = (wresp_flag==1'b1)? 1'b0 : 1'b1                            ;
//---------------- get wresp wresp_flag--------------------------------------
always@(posedge mclk ,negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	wresp_flag <=#1 1'b0 ;
      end
    else if(bstate==BIDLE)
      begin
	wresp_flag <=#1 1'b0 ;
      end
    else if(bready&&bvalid)
      begin
	wresp_flag <=#1 1'b1 ;
      end
    else
      begin
	wresp_flag <=#1 wresp_flag ;
      end
  end

always@(posedge mclk , negedge mreset_n)
  begin 
    if(mreset_n==1'b0)
      begin
	mstate <=#1 IDLE ;
      end
    else
      begin
	mstate <=#1 mstate_next ;
      end
  end
always@(*)
  begin
    if(mreset_n==1'b0)
      begin
	mstate_next = IDLE ;
      end
    else
      begin
	case(mstate)
          IDLE   : begin
	             if((wr_en&&wr_ready) == 1'b1)
                       begin
		         mstate_next = TRANS ;
                       end
                     else
                       begin
		         mstate_next = IDLE  ;
                       end
                   end
          TRANS  : begin
		     if((burst_cnt == {{WR_LENGTH_WIDTH-AWLEN_WIDTH-AWSIZE-1{1'b0}},1'b1})&&btrans_done)
                       begin
		         mstate_next = DONE ;
                       end
                     else
                       begin
		         mstate_next = TRANS ;
                       end
                   end
          DONE   : begin
		     mstate_next = IDLE ;
                   end
          default: begin
                     mstate_next = IDLE ;
                   end
       endcase
      end
  end
always@(posedge mclk ,negedge mreset_n)
  begin 
    if(mreset_n==1'b0)
      begin
	bstate <=#1 BIDLE ;
      end
    else
      begin
	bstate <=#1 bstate_next ;
      end
  end
always@(*)
  begin
    if(mreset_n==1'b0)
      begin
	bstate_next = BIDLE ;
      end
    else
      begin
	case (bstate)
          BIDLE  : begin
		     if(btrans_en==1'b1)
                       begin
			 bstate_next = AWADDR  ;
                       end
                     else
                       begin
	                 bstate_next = BIDLE   ;
                       end
                   end
          AWADDR : begin
                     if(awaddr_en==1'b1)
                       begin
                         bstate_next = WDATA   ;
                       end
                     else 
                       begin
			 bstate_next = AWADDR  ;
                       end
                   end
          WDATA  : begin
		     if((btrans_cnt=={AWLEN_WIDTH{1'b0}})&&((wready&&wvalid)==1'b1))

                       begin
			 bstate_next = WRESP   ;
                       end
                     else
                       begin
	                 bstate_next = WDATA   ;
                       end
                   end
          WRESP  : begin
		     if(wresp_flag==1'b1)
                       begin
			 bstate_next = BIDLE   ;
                       end
                     else
                       begin
			 bstate_next = WRESP   ;
                       end
                   end
          default: begin
		     bstate_next = BIDLE       ;
                   end
        endcase
      end
  end

assign bstate_out = mstate[2];

endmodule
