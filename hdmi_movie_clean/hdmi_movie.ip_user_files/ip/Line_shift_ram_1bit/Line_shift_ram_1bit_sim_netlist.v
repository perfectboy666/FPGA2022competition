// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Nov  1 21:33:10 2022
// Host        : LAPTOP-DU97D6U5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               E:/vivado_prj/wx/hdmi_movie/hdmi_movie.runs/Line_shift_ram_1bit_synth_1/Line_shift_ram_1bit_sim_netlist.v
// Design      : Line_shift_ram_1bit
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Line_shift_ram_1bit,c_shift_ram_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_14,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module Line_shift_ram_1bit
   (D,
    CLK,
    CE,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [0:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "0" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "480" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "1" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Line_shift_ram_1bit_c_shift_ram_v12_0_14 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "0" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DEPTH = "480" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "0" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "1" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_shift_ram_v12_0_14" *) (* downgradeipidentifiedwarnings = "yes" *) 
module Line_shift_ram_1bit_c_shift_ram_v12_0_14
   (A,
    D,
    CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]A;
  input [0:0]D;
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "0" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "480" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "1" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  Line_shift_ram_1bit_c_shift_ram_v12_0_14_viv i_synth
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
LaFEyfyxU2eSiHc4qUJXLjaX7KTgafO8swbLbiv/Sf9OhFdIYoQNqUp8BBAnMMGJmrHwHRPIf4F6
o//soabg0A==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
mlXdJI1KtaFJSwPaQOA45kCl+Zs7Sf5hrxI0kP6WcTyLd2NKmdS7WjYL92+NUmX5ohlTBxfnBCXw
bP34tk43opA0/w53wsRDvrKalr52U4qIncnH5uP1g2KjhJDvMuounm4OXBEpJPAVIPA+KVWyM0By
oMGFDp7HDuQS9BWgDG8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
stP8wGZN/GWBaZ7TOUHDdRV5koenqQ9Yarp16/conM3fYqVjTvIC1AB1w0a62GvqHKWbgLYi/2jZ
70upYMBAPsU4SrgyRLzrAYY3XRzoHKxZxSNV2T1TK4IHsTHTO9yICsFdfxTjVNgY/fO2s9y9h4g7
apFddx11MW/vy16fWRWMd/SLJ9cNvLurnQDbX+E7hDxEqh7H19FtRhD5J5xr3Yz8AtG6NHGHohSt
/2hR+/qwVR+i6f4eos11uieLzKWD5ztipnEJxcQ8D7yBTSe1wD1OS39/d4QzA0dnqc4pnzL79tOq
98/jQ4TFnief3PU26yF27CNBOfL4rYVq4k3Wjg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uq63cCGdwR2xvqrD0Kn5+kP4k6mGbAdqnMX5UXBki043rVinooxiOlTx6jFk8zUwKK5DyUDb78yB
tLbc8dhFfMPPvgARX1Qj5GKEi/kDdXhkRULTixN2uQ13qnZlpbjTTBBgKUkFNdf9/dyxdfTZNEjG
x17Tl8xhv5BKHuFVdQ1tFdoEO4ScmqWIztFU8hwKj66993eZBovevhp7gCVGW0l43OB2gpgpGtOh
WG1WRjwgaklhgOBNBPaxKCaAvCCsrjpIFAjdF8Z1sRsRvZOQzU/xvg0uXLNaYrGgvaAEcJLBqhL7
hZE526SQfdNsMTg+CjKaCcUyjKY2dCDd51VpcQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hu5tUSDDK8dd7tbo2w1nHyVlm/1B8qj18yUBj2tfbXP9YvsDb667+J0DnrBkxtarPZbVaFA4LlZ7
pbgQdlYSTHuI8sh5BrdKXQ1ZjcDRHtnVoFEpitKE6sXS+RTBgglj8eF1iSmQIuf7zL6XOi+SlDHR
Bw6YUKS+Kh7mvaGqmcfDWkoafDYa4qLLY+DoNbtmMRInDL+ndEwKkgJWf1UrUrtyFEGBC36+rvYK
Q8kgejIrnMVUnepjwgbtz8Hv4eT4B3JXiQKYA1sasf2ZLPW6jd4JN3xtstpCSajI67LU1Ijro1Bo
ZVKlddD39J6lw1/TopWmrBP93VS/7+dEuZ/IRg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
prvwFCgChd0N0reFurzi25YPM+5HwkuPkdPJaOwKDiXyitC8zIymqwHzZqw+r3mjjCGFQBwubBQp
36Gy1U1hMtzV23LU8UMdnsT3ADaIzoIMs5AYqGAtzIivvqwcySVW+2rPaQ0BoZ5krSeoz7XL4Pud
DGBmpry8VjgSy7pwWEE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GphCwqsD22w8ZM0lINVSdl7ugKtxyfXZ2O231S+2SMOKvbsghfMSl5Vuc4udUKKVvoZJECsrUeLe
PS8BqyZsdexqEAThri7pN6L/xOwY6nPfJgKtrbGpVyOZ5AWKdXYZQ5nR1NwVSGfOBy+yMVu5CFWc
XM8TaJAULlKKIDuSW0WR5kzZh7exU2hZoTuCcjRNFZcWDDCBPXPV0VOhyP90sfhQ0Qjfyapt7mbD
STHiaOneJ2/crycvetf0SyAm3wpe0mZH74+vZ2nqdAKZk6qU+UEi0pfRrCMFYWoEjH8GEL/ZTdzf
eU3RZPZfzJAbknTppsK3Qwj+/i8jyyhST+3f4A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ibi++YXec0p8FC+j0Y9nMOukmIP81YNiI92V3vzT6kHfQh2oWxvjb9c3X2+Sh/FOcwIAvCV9BaI/
rIrKUg202CaitJjYGHvJi6N1RP+VX8ghgp39d4SnCvu1s4U0sRyq3FpcIX0n+Eic0JU7LlduFjh6
zBG62Cri0YYEQ83jmPk68X78xIPuWXk8i5A+ax0Uh4hY6pCahm59dbbMJ1t/sj+33IsgsMrBFO7i
SDYghR158ES+u67QWLMR3rsfPZFobet7mWaUUQ2HRFYlrmCUhHRbPqDnDXy/BBcBkszV0b5vzSBD
dQB3jzHwQibPFDQhb91SagcGq1tY7xCpL6QkKg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
A0zcYPvMHIpqF4AzkpTLnDJSC4V4OPfMcs5BSF9r5qBxUk183jCBQTZcsGxR6Pab1d51nnBAOtw3
WSLoj874LxCwCHspvvqodoHIuQZmSAouvVEKVptZVyWf1og/yLATV/NIHJGX9G71pLwqYC06OPnN
RQe+vQfY7yoRTjQvT0RthXFMklG8ZNQkW+7Zy5MW+xojpF0cRI7XCniLn/Tma4zcLFrcumHfyoE+
y9U787bqeoo5qvXibaT5l0GYG4FeOU5JsqSfZ6Wh8QE76khuRMOky9TVkVvMYC+uqDzJ8cAKLh77
+/KKpdOp5mhkx9RXJP4W+QIQoiXZrpW+hZJZqA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RCE9WEN2HdVFgoWeDUqhIkuyd97uLrS8cQ6uo4D7emJNK9R/DpV1zD0Gw4Z8lkXMdgb6Hfv4AwCv
fliK2JTzZ48hnQkGxzbAV5EHPGfA4taVbQf5x5sfveyKgh2gddKFK17OT1OxpA/hRMXM/DrbHFN/
4pFa3nXYUS0HFQhcyeakkp7F317Qky6j/Zy3X16zCCAsjbF5ZyxmW8UPpiJld/C5c7raFxtxABU9
BdwpfoT585Svph/qva2TCiDQD8UN1nYOGRZKj9nPGHdJHO7VCccdBgjGhzY6y2F9a2UJN4SCehdO
QIoZXVGvFmBG/Pg61WiCFdKTYXyfACoKEryayQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17120)
`pragma protect data_block
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
at2DuEDsjTz/9FEMG1ixVEx7PfM=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
