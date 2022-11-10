
module axi_master_rd(
         mclk       ,
         mreset_n   ,
                              //axi ports
     arid       ,
     araddr     ,
     arlen      ,
     arsize     ,
     arburst    ,
     arvalid    ,
     arready    ,
     rid        ,
     rdata      ,
     rlast      ,
     rvalid     ,
     rready     ,
               // config ports
     mode       ,
     status     ,
               // axis ports
     rd_en      ,
     rd_addr    ,
     rd_length  ,
     rd_ready   ,
     mvalid     ,
     mdata      ,
     mlast      ,
     mready     
		) ;

parameter    ADDR_WIDTH      = 32   ;
parameter    DATA_WIDTH      = 32   ;
parameter    ID_WIDTH        = 4    ;
parameter    ARLEN_WIDTH     = 4    ;
parameter    ARSIZE_WIDTH    = 3    ;
parameter    ARBURST_WIDTH   = 2    ;
parameter    RD_LENGTH_WIDTH = 16   ;
parameter    ARSIZE          = 3    ;
parameter    RID             = 0    ;
input              mclk       ;
input              mreset_n   ;
                              //axi ports
output   [ID_WIDTH-1      :0]     arid       ;
output   [ADDR_WIDTH-1    :0]     araddr     ;
output   [ARLEN_WIDTH-1   :0]     arlen      ;
output   [ARSIZE_WIDTH-1  :0]     arsize     ;
output   [1 :0]                   arburst    ;
output                            arvalid    ;
input                             arready    ;
input   [ID_WIDTH-1      :0]     rid        ;
input   [DATA_WIDTH-1    :0]     rdata      ;
input                            rlast      ;
input                            rvalid     ;
output                           rready     ;
                              // config ports;
input  [15:0]                     mode       ;
output                      			status     ;
                              // axis ports
input                             rd_en      ;
input  [ADDR_WIDTH-1      :0]     rd_addr    ;
input  [RD_LENGTH_WIDTH-1 :0]     rd_length  ;
output                            rd_ready   ;
output                             mvalid     ;
output  [DATA_WIDTH-1      :0]     mdata      ;
output                             mlast      ;
input                              mready     ;

parameter        IDLE   = 3'b001 ;
parameter        TRANS  = 3'b010 ;
parameter        DONE   = 3'b100 ;

parameter        RIDLE  = 3'b001 ;
parameter        RADDR = 3'b010 ;
parameter        RDATA  = 3'b100 ;

reg [2 :0]       mstate      ; //main state machine
reg [2 :0]       mstate_next ; 
reg [2 :0]       rstate      ; //burst read state machine 
reg [2 :0]       rstate_next ;
wire             rd_ready    ;
reg [ADDR_WIDTH-1      :0]     rd_addr_d    ;
reg [RD_LENGTH_WIDTH-1 :0]     rd_length_d  ;
reg [ADDR_WIDTH- ARLEN_WIDTH-ARSIZE-1 : 0]                aburst_cnt        ;
reg [ADDR_WIDTH- ARLEN_WIDTH-ARSIZE-1 : 0]                rburst_cnt        ;
wire              rd_cmd_done                ;
reg [ADDR_WIDTH-1      :0]     araddr       ;
//-----------for aread ch----------------------------
assign     arvalid = (rstate==RADDR) ? 1'b1 : 1'b0 ;
assign     arid    = RID                           ;
assign     arsize  = ARSIZE                        ;
/////////////for araddr /////////////////////////////
always@(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	araddr <=#1 {ADDR_WIDTH{1'b0}} ;
      end
    else if(rd_en&&rd_ready)
      begin
	araddr <=#1 rd_addr   ;
      end
    else if(rd_cmd_done)
      begin
	araddr <=#1 araddr + {{ADDR_WIDTH-ARLEN_WIDTH-ARSIZE{1'b0}} , arlen , {ARSIZE{1'b0}}} + {{ADDR_WIDTH-ARSIZE-1{1'b0}}, 1'b1, {ARSIZE{1'b0}}};
      end
    else
      begin
	araddr <=#1 araddr ;
      end
  end
///////////for arlen ///////////////////////////////////////
assign  arlen = ((aburst_cnt=={{ADDR_WIDTH- ARLEN_WIDTH-ARSIZE-1{1'b0}},1'b1})&&(rd_length_d[ARLEN_WIDTH+ARSIZE-1 : ARSIZE]!={ARLEN_WIDTH{1'b0}})) ? 
                rd_length_d[ARLEN_WIDTH+ARSIZE-1 : ARSIZE] - {{ARLEN_WIDTH-1{1'b0}},1'b1}                    :
                {ARLEN_WIDTH{1'b1}}; 

always@(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	rstate <=#1 RIDLE ;
      end
    else
      begin
	rstate <=#1 rstate_next ;
      end
  end

always@(*)
  begin
    if(mreset_n==1'b0)
      begin
	rstate_next = RIDLE ;
      end
    else
      begin
	case(rstate)
          RIDLE : begin
		    if(mstate==TRANS)
                      begin
	                rstate_next = RADDR ;
                      end
                    else 
                      begin	
	                rstate_next = RIDLE ;
                      end
                  end
          RADDR : begin
		    if(arready)
                      begin
			rstate_next = RDATA ;
                      end
                    else
                      begin
			rstate_next = RADDR ;
                      end
                  end
          RDATA : begin
		    if(rready&&rvalid&&rlast)
                      begin
			rstate_next = RIDLE ;
                      end
                    else
                      begin
			rstate_next = RDATA ;
                      end
                  end
          default:begin
		    rstate_next = RIDLE ;
                  end
        endcase
      end
  end
/////////////////////////////////////////////////////
assign   arburst  = 2'b01 ;
/////for rd_ready ///////////////////
assign   rd_ready = (mstate==IDLE)? arready : 1'b0 ;
///////////for rd_cmd_done  /////////
assign   rd_cmd_done = (mode[0]==1'b1) ? (arready&&arvalid) : (rready&&rvalid&&rlast) ;
//////////for rready ////////////////
assign   rready = (mstate!=IDLE)? mready : 1'b0    ;
assign   mdata  = rdata                            ;
assign   mvalid = rvalid                           ;
assign   mlast  = rlast                            ;
/////////for aburst_num /////////////
always @(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	aburst_cnt <=#1 {ADDR_WIDTH-ARLEN_WIDTH{1'b0}};
      end
    else if(rd_ready&&rd_en)
      begin 
       if((rd_length[ARLEN_WIDTH+ARSIZE-1:0]=={ARLEN_WIDTH+ARSIZE{1'b0}}))
         begin
           aburst_cnt <=#1 rd_length[RD_LENGTH_WIDTH-1 : ARLEN_WIDTH+ARSIZE] ;
         end
       else 
         begin
           aburst_cnt <=#1 rd_length[RD_LENGTH_WIDTH-1: ARLEN_WIDTH+ARSIZE] + {{ADDR_WIDTH- ARLEN_WIDTH-ARSIZE-1{1'b0}},1'b1} ; 
         end
       end
     else if(rd_cmd_done)
       begin
          aburst_cnt <=#1 aburst_cnt  - {{ADDR_WIDTH- ARLEN_WIDTH-ARSIZE-1{1'b0}},1'b1} ;
       end
     else
       begin
	  aburst_cnt <=#1 aburst_cnt ;
       end
  end 
/////////for rburst_num /////////////
always @(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	rburst_cnt <=#1 {ADDR_WIDTH-ARLEN_WIDTH{1'b0}};
      end
    else if(rd_ready&&rd_en)
      begin 
       if((rd_length[ARLEN_WIDTH+ARSIZE-1:0]=={ARLEN_WIDTH+ARSIZE{1'b0}}))
         begin
           rburst_cnt <=#1 rd_length[RD_LENGTH_WIDTH-1 : ARLEN_WIDTH+ARSIZE] ;
         end
       else 
         begin
           rburst_cnt <=#1 rd_length[RD_LENGTH_WIDTH-1 : ARLEN_WIDTH+ARSIZE] +{{ADDR_WIDTH- ARLEN_WIDTH-ARSIZE-1{1'b0}}, 1'b1} ; 
         end
       end
     else if(rd_cmd_done)
       begin
          rburst_cnt <=#1 rburst_cnt  - {{ADDR_WIDTH- ARLEN_WIDTH-ARSIZE-1{1'b0}},1'b1} ;
       end
     else
       begin
	  rburst_cnt <=#1 rburst_cnt ;
       end
  end 
/////////get rd_addr rd_length //////
always@(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	rd_addr_d <=#1 {ADDR_WIDTH{1'b0}} ;
      end
    else if(rd_ready&&rd_en)
      begin
	rd_addr_d <=#1 rd_addr ;
      end
    else
      begin
	rd_addr_d <=#1 rd_addr_d  ;
      end
  end

always@(posedge mclk , negedge mreset_n)
  begin
    if(mreset_n==1'b0)
      begin
	rd_length_d <=#1 {ADDR_WIDTH{1'b0}} ;
      end
    else if(rd_ready&&rd_en)
      begin
	rd_length_d <=#1 rd_length ;
      end
    else
      begin
	rd_length_d <=#1 rd_length_d ;
      end
  end
/////////////////////////////////////
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
///////////////////////////////////////
always@(*)
  begin
    if(mreset_n==1'b0)
      begin
	mstate_next = IDLE ;
      end
    else
      begin
	case(mstate)
          IDLE : begin
		   if(rd_ready && rd_en)
                     begin
                       mstate_next = TRANS ;
                     end
                   else
                     begin
		       mstate_next = IDLE  ;
                     end
                 end
          TRANS: begin
		   if(rready&&rvalid&&rlast&&(aburst_cnt == {{ADDR_WIDTH- ARLEN_WIDTH-ARSIZE-1{1'b0}},1'b1}))
                     begin
		       mstate_next = DONE ;
                     end
                   else
                     begin
                       mstate_next = TRANS ;			
                     end
                 end
          DONE : begin
                 //  if(rburst_cnt == {{ADDR_WIDTH- ARLEN_WIDTH-ARSIZE-1{1'b0}},1'b1})
                 //    begin
		       mstate_next = IDLE ;
                 //    end
                 //  else
                 //    begin
		 //      mstate_next = DONE ;
                 //    end
                 end
          default :begin
		     mstate_next = IDLE ;
                   end
        endcase 
      end
  end
  
assign status = mstate[2];

endmodule
