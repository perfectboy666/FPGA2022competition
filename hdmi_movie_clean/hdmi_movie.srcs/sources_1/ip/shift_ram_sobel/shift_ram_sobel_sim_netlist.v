// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Oct 21 21:21:35 2022
// Host        : MT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               E:/wx/hdmi_movie/hdmi_movie.runs/shift_ram_sobel_synth_1/shift_ram_sobel_sim_netlist.v
// Design      : shift_ram_sobel
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "shift_ram_sobel,c_shift_ram_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_14,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module shift_ram_sobel
   (D,
    CLK,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [2:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [2:0]Q;

  wire CLK;
  wire [2:0]D;
  wire [2:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "000" *) 
  (* c_default_data = "000" *) 
  (* c_depth = "6" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "000" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "3" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  shift_ram_sobel_c_shift_ram_v12_0_14 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b1),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "000" *) (* C_DEFAULT_DATA = "000" *) 
(* C_DEPTH = "6" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "000" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "3" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_shift_ram_v12_0_14" *) (* downgradeipidentifiedwarnings = "yes" *) 
module shift_ram_sobel_c_shift_ram_v12_0_14
   (A,
    D,
    CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]A;
  input [2:0]D;
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  output [2:0]Q;

  wire CLK;
  wire [2:0]D;
  wire [2:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "000" *) 
  (* c_default_data = "000" *) 
  (* c_depth = "6" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "0" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "000" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "3" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  shift_ram_sobel_c_shift_ram_v12_0_14_viv i_synth
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(1'b0),
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
apEwgrVeh/owfejnhVwqAqS4kN9BDpHbu0Cj9anc2/Xy6o1aQKa08e/lqVcTj/0Rxp8nzm1rzQDd
oqbM44dVzke2mJMTLTyj/4Nq6XL8wLYInaMtSSFS8ewn4UinKOL2nCOR8j11hBz36I/fNPLjLKge
HUhe0K5AhDN41uSXaaHL4kVzAPeN2uydw0XJN6fIQKMku2/KrbUgeAcJE67133O5ZWUiWdxZVu1c
huFayjTazlbU+x/aSmM08ZjknNaKzXr2s5VcBJUbcF1+ybVnBrjIUHGHbGm3syPMUxwV9b1zAV84
MTYyasmotWvM6HP1cRoF2ScFBMAQQIFcllisJQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ms4Xzw6ioTlnBL1KcW5Um93mh5ubfxWeIac3/bJQ3JoIEOrzi7GsoCEJRy+baQt73SzFCPTUl+yx
UW027wLt+yFNQ341Ls+Vu1XzTHsnEy5OSPHqdjwli7dITYhoyCHosIrwIMNTrHw0F5QsA7j1oslM
/R4WHiEU7qAbSjPT3oF3CcuCLoctWPrgstsD3IuEdxmjXnvkjlot9s4Z9R5itm586steInwbxjQO
YOMMkJtRE2CkqgZjYhWZdKnZqurN7QHPnTSoc46wAE2E2Sz8fBAoWS5YUU8Gmov6DgvKl1szuFma
Vlo//v4irPZUVx0k68xOFFXfHG0oIYdrwaY44g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6160)
`pragma protect data_block
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
q0axLA==
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
