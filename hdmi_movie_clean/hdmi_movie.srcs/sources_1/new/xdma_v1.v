module xdma_v1(
     mclk        ,   
     mreset_n    ,
     aclk        ,   
     areset_n    ,
                            //axi ports
     arid       ,
     araddr     ,
     arlen      ,
     arsize     ,
     arburst    ,
     arvalid    ,
     arready    ,
     rid        ,
     rresp      ,
     rdata      ,
     rlast      ,
     rvalid     ,
     rready     ,

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
 
     s0_tvalid                     ,
     s0_tdata                      ,
     s0_tlast                      ,
     s0_tready                     ,
                                  //------axis bus master port--------
     m0_tvalid                     ,
     m0_tdata                      ,
     m0_tlast                      ,
     m0_tready                     ,
     rd_trig											 ,
     vga_enable										,
     wfifo_full,
     rd_ack,
		 rd_fifo_rst,
		 wr_ack,
		 wr_fifo_rst,
		 camera_req
);
parameter    U_ADDR_WIDTH      = 32   ;
parameter    U_DATA_WIDTH      = 64   ;
parameter    U_ID_WIDTH        = 4    ;
parameter    U_ARLEN_WIDTH     = 4    ;
parameter    U_RSTRB_WIDTH     = 4    ;
parameter    U_ARSIZE_WIDTH    = 3    ;
parameter    U_ARBURST_WIDTH   = 2    ;
parameter    U_RD_LENGTH_WIDTH = 32   ;
parameter    U_ARSIZE          = 3    ;
parameter    U_RID             = 0    ;
parameter    U_AWLEN_WIDTH     = 4    ;
parameter    U_WSTRB_WIDTH     = 8    ;
parameter    U_AWSIZE_WIDTH    = 3    ;
parameter    U_AWBURST_WIDTH   = 2    ;
parameter    U_WR_LENGTH_WIDTH = 32   ;
parameter    U_AWSIZE          = 3    ;
parameter    U_WID             = 0    ;
input            mclk                          ;// input clock.
input            mreset_n                      ;// input async reset, low active.
input            aclk                          ;// input clock.
input            areset_n                      ;// input async reset, low active.
//read address channel
output [U_ID_WIDTH-1   :0  ]    arid                          ;//CM
output [U_ADDR_WIDTH-1 :0  ]    araddr                        ;//CM
output [U_ARLEN_WIDTH-1  :0  ]  arlen                         ;//CM
output [U_ARSIZE_WIDTH-1  :0  ] arsize                        ;//CM
output [1  :0  ]              arburst                       ;//CM
output                        arvalid                       ;//CM
input                         arready                       ;//CM
//read data channel
input  [U_ID_WIDTH-1   :0  ]    rid                           ;//CM
input  [U_DATA_WIDTH-1 :0  ]    rdata                         ;//CM
input  [1  :0  ]              rresp                         ;//CM
input                         rlast                         ;//CM
input                         rvalid                        ;//CM
output                        rready                        ;//CM
//write address channel
output [U_ID_WIDTH-1    :0  ]   awid                          ;//CM
output [U_ADDR_WIDTH-1  :0  ]   awaddr                        ;//CM
output [U_AWLEN_WIDTH-1  :0  ]  awlen                         ;//CM
output [U_AWSIZE_WIDTH-1  :0  ] awsize                        ;//CM
output [1  :0  ]              awburst                       ;//CM
output                        awvalid                       ;//CM
input                         awready                       ;//CM
//write data channel
output [U_ID_WIDTH-1  :0  ] wid                           ;//CM
output [U_DATA_WIDTH-1:0  ] wdata                         ;//CM
output [U_WSTRB_WIDTH-1 :0  ] wstrb                         ;//CM
output                    wlast                         ;//CM
output                    wvalid                        ;//CM
input                     wready                        ;//CM
//write response channel
input  [U_ID_WIDTH-1  :0  ] bid                           ;//CM
input  [1  :0  ] bresp                         ;//CM
input            bvalid                        ;//CM
output           bready                        ;//CM
//------axis slave port--------
input                     s0_tvalid                     ;//CM
input  [U_DATA_WIDTH-1:0  ] s0_tdata                      ;//CM
input                     s0_tlast                      ;//CM
output                    s0_tready                     ;//CM
//------axis master port--------
output                    m0_tvalid                     ;//CM
output [U_DATA_WIDTH-1:0  ] m0_tdata                      ;//CM
output                    m0_tlast                      ;//CM
input                     m0_tready                     ;//CM

input											rd_trig;
output										vga_enable;
input											wfifo_full;
output							rd_ack;
output							rd_fifo_rst;
output							wr_ack;
output							wr_fifo_rst;
input								camera_req;

//debug

reg   [31:0]		cnt_axis_data;
reg   [31:0]		cnt_axi4_data;
wire						wr_check_done;

wire            rd_en;   
wire  [31:0]    rd_addr;  
wire  [31:0]    rd_length; 
wire            rd_ready;  
wire            wr_en;   
wire  [31:0]  	wr_addr;  
wire  [31:0]  	wr_length; 
wire            wr_ready;  

//wr_time_ctrl
wire    [4:0]   wr_ram_waddr;
wire    [127:0] wr_ram_din;
wire		      	wr_start;
wire		      	wr_ram_wen;
wire		      	send_done_mflag;
//rd
wire		      	rd_ram_wen;
wire	[4:0]	    rd_ram_waddr;
wire	[127:0]	  rd_ram_din;
wire		      	rd_start;
wire						rd_ddr_packet_done;
wire						rd_status;

wire						bstate_out;
wire   [1:0]		wr_check_result;

always	@(posedge	aclk	or	negedge	areset_n)
	begin
	  if(areset_n==1'b0)
		cnt_axis_data<=32'b0;
	  else	if(wr_check_done==1'b1)
		cnt_axis_data<=32'b0;
	  else	if(s0_tvalid==1'b1	&&	s0_tready==1'b1)
		cnt_axis_data<=cnt_axis_data+32'b1;
	  else
		cnt_axis_data<=cnt_axis_data;
	end	

always	@(posedge	aclk	or	negedge	areset_n)
	begin
	  if(areset_n==1'b0)
		cnt_axi4_data<=32'b0;
	  else	if(wr_check_done==1'b1)
		cnt_axi4_data<=32'b0;
	  else  if(wvalid==1'b1	&&	wready==1'b1)
		cnt_axi4_data<=cnt_axi4_data+32'b1;
	  else
		cnt_axi4_data<=cnt_axi4_data;
	end

//rd

//assign rd_ram_waddr	= macro_rwreg7[4:0];
//assign in_put		= {macro_rwreg8,macro_rwreg9,macro_rwreg10,macro_rwreg11,macro_rwreg12};
//assign rd_start		= macro_pul[3];
//assign rd_cmd_num_in    = macro_rwreg13[5:0];
//assign macro_int_sr[1]	= ready_out;
//assign rd_ram_wen       = macro_pul[1];

//assign macro_int_sr[31:2]=30'b0; 

cmd_ctrl	cmd_ctrl_inst(
			.sclk					(mclk),
			.rst_n				(mreset_n),
			.rd_trig			(rd_trig),
			.send_done_mflag	(send_done_mflag),
			.rd_ddr_packet_done(rd_ddr_packet_done),
			.wr_ram_wen		(wr_ram_wen),
			.wr_ram_waddr	(wr_ram_waddr),
			.wr_ram_din		(wr_ram_din),
			.wr_start     (wr_start),
			
			.rd_ram_wen		(rd_ram_wen),
			.rd_ram_waddr	(rd_ram_waddr),
			.rd_ram_din		(rd_ram_din),
			.rd_start     (rd_start),
			.vga_enable		(vga_enable),
			.wfifo_full		(wfifo_full),
			.rd_ack				(rd_ack),
			.rd_fifo_rst	(rd_fifo_rst),
			.camera_req		(camera_req),
			.wr_ack				(wr_ack),
		 	.wr_fifo_rst	(wr_fifo_rst)
);

axi_master_rd 
#(
         .ADDR_WIDTH      (U_ADDR_WIDTH       ), 
         .DATA_WIDTH      (U_DATA_WIDTH       ), 
         .ID_WIDTH        (U_ID_WIDTH         ), 
         .ARLEN_WIDTH     (U_ARLEN_WIDTH      ), 
         .ARSIZE_WIDTH    (U_ARSIZE_WIDTH     ), 
         .ARBURST_WIDTH   (U_ARBURST_WIDTH    ), 
         .RD_LENGTH_WIDTH (U_RD_LENGTH_WIDTH  ), 
         .ARSIZE          (U_ARSIZE           ), 
         .RID             (U_RID              ) 
) 
  axi_rd(
     .mclk     (aclk        )  ,
     .mreset_n (areset_n    )  ,
                               //axi ports
     .arid     (arid     )  ,
     .araddr   (araddr   )  ,
     .arlen    (arlen    )  ,
     .arsize   (arsize   )  ,
     .arburst  (arburst  )  ,
     .arvalid  (arvalid  )  ,
     .arready  (arready  )  ,
     .rid      (rid      )  ,
     .rdata    (rdata    )  ,
     .rlast    (rlast    )  ,
     .rvalid   (rvalid   )  ,
     .rready   (rready   )  ,
                              // config ports
     .mode     (16'b0     )  ,
     .status   (rd_status   )  ,
                              // axis ports
     .rd_en    (rd_en    )  ,
     .rd_addr  (rd_addr  )  ,
     .rd_length(rd_length)  ,
     .rd_ready (rd_ready )  ,
     .mvalid   (m0_tvalid   )  ,
     .mdata    (m0_tdata    )  ,
     .mlast    (m0_tlast    )  ,
     .mready   (m0_tready   ) 
		) ;

wr_time_ctrl	rd_time_ctrl_inst(
               .mclk		(mclk),
               .mreset_n	(mreset_n),
	       			 .aclk		(aclk),
	       			 .areset_n	(areset_n),
               .ram_waddr	(rd_ram_waddr),
               .cmd_in		(rd_ram_din),
               .start		(rd_start),
               .ram_wen		(rd_ram_wen),
               .axi_ready	(rd_ready),
               .cmd_num_in	(6'b1),
               .axi_wren	(rd_en),
               .axi_laddr	(rd_addr),
               .axi_length	(rd_length),
	       			 .bstate_out	(rd_status),
               .send_done_mflag (rd_ddr_packet_done)
	);


axi_master_wr 
#( 
         .ADDR_WIDTH      (U_ADDR_WIDTH      ), 
         .DATA_WIDTH      (U_DATA_WIDTH      ), 
         .ID_WIDTH        (U_ID_WIDTH        ), 
         .AWLEN_WIDTH     (U_AWLEN_WIDTH     ), 
         .WSTRB_WIDTH     (U_WSTRB_WIDTH     ), 
         .AWSIZE_WIDTH    (U_AWSIZE_WIDTH    ), 
         .AWBURST_WIDTH   (U_AWBURST_WIDTH   ), 
         .WR_LENGTH_WIDTH (U_WR_LENGTH_WIDTH ), 
         .AWSIZE          (U_AWSIZE          ), 
         .WID             (U_WID             ) 
)
axi_wr(
     .mclk     ( aclk       )  ,
     .mreset_n ( areset_n   )  ,
                                   //axi ports
     .awid     (awid        )  ,
     .awaddr   (awaddr      )  ,
     .awlen    (awlen       )  ,
     .awsize   (awsize      )  ,
     .awburst  (awburst     )  ,
     .awvalid  (awvalid     )  ,
     .awready  (awready     )  ,
     .wid      (wid         )  ,
     .wdata    (wdata       )  ,
     .wstrb    (wstrb       )  ,
     .wlast    (wlast       )  ,
     .wvalid   (wvalid      )  ,
     .wready   (wready      )  ,
     .bid      (bid         )  ,
     .bresp    (bresp       )  , 
     .bvalid   (bvalid      )  ,
     .bready   (bready      )  ,
                                  // config ports
     .mode     (16'b1        )  ,
                                   // axis ports
     .wr_en    (wr_en       )  ,
     .wr_addr  (wr_addr     )  ,
     .wr_length(wr_length   )  ,
     .wr_ready (wr_ready    )  ,
     .svalid   (s0_tvalid      )  ,
     .sdata    (s0_tdata       )  ,
     .slast    (s0_tlast       )  ,
     .sready   (s0_tready      ),
     .bstate_out(bstate_out)
		) ;

wr_time_ctrl	wr_time_ctrl_inst(
               .mclk		(mclk),
               .mreset_n	(mreset_n),
	       .aclk		(aclk),
	       .areset_n	(areset_n),
               .ram_waddr	(wr_ram_waddr),
               .cmd_in		(wr_ram_din),
               .start		(wr_start),
               .ram_wen		(wr_ram_wen),
               .axi_ready	(wr_ready),
               .cmd_num_in	(6'b1),
               .axi_wren	(wr_en),
               .axi_laddr	(wr_addr),
               .axi_length	(wr_length),
	       .bstate_out	(bstate_out),
               .send_done_mflag (send_done_mflag)
	);

endmodule
