module ddr3_top(
		input		wire					ddr_clk,
		input		wire					rst_n,
    output	wire	[13:0]	ddr3_addr,                      
    output	wire	[2:0]		ddr3_ba,                       
    output	wire					ddr3_cas_n,                     
    output	wire					ddr3_ck_n,                      
    output	wire					ddr3_ck_p,                    
    output	wire					ddr3_cke,                     
    output	wire					ddr3_ras_n,                   
    output	wire					ddr3_reset_n,                 
    output	wire					ddr3_we_n,                    
    inout		wire	[15:0]	ddr3_dq,                      
    inout		wire	[1:0]		ddr3_dqs_n,                   
    inout		wire	[1:0]		ddr3_dqs_p,                   
		output	wire					ddr3_cs_n,                    
    output	wire	[1:0]		ddr3_dm,                      
    output	wire					ddr3_odt,
    
    input		wire	[27:0]	s_axi_awaddr,
		input		wire	[7:0]		s_axi_awlen,		//burst	len	,the number of data in one transfer
		input		wire	[2:0]		s_axi_awsize,		//bytes number in transfer 000 1 001 2 010 4
		input		wire	[1:0]		s_axi_awburst,  //burst type,INCR 01
		input		wire					s_axi_awlock,		//1'b0
		input		wire	[3:0]		s_axi_awcache,  //memory type fix 0011
		input		wire	[2:0]		s_axi_awprot,   //protection type fix 000
		input		wire	[3:0]		s_axi_awqos,    //quality of service fix 4'b0000
		input		wire					s_axi_awvalid,
		output	wire					s_axi_awready,
		
		input		wire	[63:0]	s_axi_wdata,
		input		wire	[7:0]		s_axi_wstrb,
		input		wire					s_axi_wlast,
		input		wire					s_axi_wvalid,
		output	wire					s_axi_wready,
		
		output	wire	[3:0]		s_axi_bid,
		output	wire	[1:0]		s_axi_bresp,  //write respones 00:ok 
		output	wire					s_axi_bvalid,
		input		wire					s_axi_bready,
		
		input		wire	[27:0]	s_axi_araddr,
		input		wire	[7:0]		s_axi_arlen,
		input		wire	[2:0]		s_axi_arsize,
		input		wire	[1:0]		s_axi_arburst,
		input		wire					s_axi_arlock,
		input		wire	[3:0]		s_axi_arcache,
		input		wire	[2:0]		s_axi_arprot,
		input		wire	[3:0]		s_axi_arqos,
		input		wire					s_axi_arvalid,
		output	wire					s_axi_arready,
		
		output 	wire	[3:0]		s_axi_rid,
		output	wire	[63:0]	s_axi_rdata,
		output	wire					s_axi_rlast,
		output	wire	[1:0]		s_axi_rresp,
		output	wire					s_axi_rvalid,
		input		wire					s_axi_rready,
		
		output	wire					user_clk,
		output	wire					user_rst,
		output	wire					ddr_init_done
                          
);

mig_7series_axi u_mig_7series_axi_inst (
    // Memory interface ports
    .ddr3_addr                      (ddr3_addr),  // output [13:0]		ddr3_addr
    .ddr3_ba                        (ddr3_ba),  // output [2:0]		ddr3_ba
    .ddr3_cas_n                     (ddr3_cas_n),  // output			ddr3_cas_n
    .ddr3_ck_n                      (ddr3_ck_n),  // output [0:0]		ddr3_ck_n
    .ddr3_ck_p                      (ddr3_ck_p),  // output [0:0]		ddr3_ck_p
    .ddr3_cke                       (ddr3_cke),  // output [0:0]		ddr3_cke
    .ddr3_ras_n                     (ddr3_ras_n),  // output			ddr3_ras_n
    .ddr3_reset_n                   (ddr3_reset_n),  // output			ddr3_reset_n
    .ddr3_we_n                      (ddr3_we_n),  // output			ddr3_we_n
    .ddr3_dq                        (ddr3_dq),  // inout [15:0]		ddr3_dq
    .ddr3_dqs_n                     (ddr3_dqs_n),  // inout [1:0]		ddr3_dqs_n
    .ddr3_dqs_p                     (ddr3_dqs_p),  // inout [1:0]		ddr3_dqs_p
    .init_calib_complete            (ddr_init_done),  // output			init_calib_complete
		.ddr3_cs_n                      (ddr3_cs_n),  // output [0:0]		ddr3_cs_n
    .ddr3_dm                        (ddr3_dm),  // output [1:0]		ddr3_dm
    .ddr3_odt                       (ddr3_odt),  // output [0:0]		ddr3_odt
    // Application interface ports
    .ui_clk                         (user_clk),  // output			ui_clk
    .ui_clk_sync_rst                (user_rst),  // output			ui_clk_sync_rst
    .mmcm_locked                    (),  // output			mmcm_locked
    .aresetn                        (1'b1),  // input			aresetn
    .app_sr_req                     (1'b0),  // input			app_sr_req
    .app_ref_req                    (1'b0),  // input			app_ref_req
    .app_zq_req                     (1'b0),  // input			app_zq_req
    .app_sr_active                  (),  // output			app_sr_active
    .app_ref_ack                    (),  // output			app_ref_ack
    .app_zq_ack                     (),  // output			app_zq_ack
    // Slave Interface Write Address Ports
    .s_axi_awid                     (4'b0),  // input [3:0]			s_axi_awid
    .s_axi_awaddr                   (s_axi_awaddr),  // input [27:0]			s_axi_awaddr
    .s_axi_awlen                    (s_axi_awlen),  // input [7:0]			s_axi_awlen
    .s_axi_awsize                   (s_axi_awsize),  // input [2:0]			s_axi_awsize
    .s_axi_awburst                  (s_axi_awburst),  // input [1:0]			s_axi_awburst
    .s_axi_awlock                   (s_axi_awlock),  // input [0:0]			s_axi_awlock
    .s_axi_awcache                  (s_axi_awcache),  // input [3:0]			s_axi_awcache
    .s_axi_awprot                   (s_axi_awprot),  // input [2:0]			s_axi_awprot
    .s_axi_awqos                    (s_axi_awqos),  // input [3:0]			s_axi_awqos
    .s_axi_awvalid                  (s_axi_awvalid),  // input			s_axi_awvalid
    .s_axi_awready                  (s_axi_awready),  // output			s_axi_awready
    // Slave Interface Write Data Ports
    .s_axi_wdata                    (s_axi_wdata),  // input [63:0]			s_axi_wdata
    .s_axi_wstrb                    (s_axi_wstrb),  // input [7:0]			s_axi_wstrb
    .s_axi_wlast                    (s_axi_wlast),  // input			s_axi_wlast
    .s_axi_wvalid                   (s_axi_wvalid),  // input			s_axi_wvalid
    .s_axi_wready                   (s_axi_wready),  // output			s_axi_wready
    // Slave Interface Write Response Ports
    .s_axi_bid                      (s_axi_bid),  // output [3:0]			s_axi_bid
    .s_axi_bresp                    (s_axi_bresp),  // output [1:0]			s_axi_bresp
    .s_axi_bvalid                   (s_axi_bvalid),  // output			s_axi_bvalid
    .s_axi_bready                   (s_axi_bready),  // input			s_axi_bready
    // Slave Interface Read Address Ports
    .s_axi_arid                     (4'b0),  // input [3:0]			s_axi_arid
    .s_axi_araddr                   (s_axi_araddr),  // input [27:0]			s_axi_araddr
    .s_axi_arlen                    (s_axi_arlen),  // input [7:0]			s_axi_arlen
    .s_axi_arsize                   (s_axi_arsize),  // input [2:0]			s_axi_arsize
    .s_axi_arburst                  (s_axi_arburst),  // input [1:0]			s_axi_arburst
    .s_axi_arlock                   (s_axi_arlock),  // input [0:0]			s_axi_arlock
    .s_axi_arcache                  (s_axi_arcache),  // input [3:0]			s_axi_arcache
    .s_axi_arprot                   (s_axi_arprot),  // input [2:0]			s_axi_arprot
    .s_axi_arqos                    (s_axi_arqos),  // input [3:0]			s_axi_arqos
    .s_axi_arvalid                  (s_axi_arvalid),  // input			s_axi_arvalid
    .s_axi_arready                  (s_axi_arready),  // output			s_axi_arready
    // Slave Interface Read Data Ports
    .s_axi_rid                      (s_axi_rid),  // output [3:0]			s_axi_rid
    .s_axi_rdata                    (s_axi_rdata),  // output [63:0]			s_axi_rdata
    .s_axi_rresp                    (s_axi_rresp),  // output [1:0]			s_axi_rresp
    .s_axi_rlast                    (s_axi_rlast),  // output			s_axi_rlast
    .s_axi_rvalid                   (s_axi_rvalid),  // output			s_axi_rvalid
    .s_axi_rready                   (s_axi_rready),  // input			s_axi_rready
    // System Clock Ports
    .sys_clk_i                       (ddr_clk),
    .sys_rst                         (rst_n) // input sys_rst
    );


endmodule