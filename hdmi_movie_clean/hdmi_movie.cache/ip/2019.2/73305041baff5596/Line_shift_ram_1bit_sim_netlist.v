// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Tue Nov  1 21:33:10 2022
// Host        : LAPTOP-DU97D6U5 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Line_shift_ram_1bit_sim_netlist.v
// Design      : Line_shift_ram_1bit
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Line_shift_ram_1bit,c_shift_ram_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_14,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_14 U0
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
(* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_14
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_14_viv i_synth
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
YTMbst1CjdJSs0IHUizhqmrd/67FqDGWpS2wQcMKuYILdESRy897WAZ9rgKyMbYA2XHigiZn+ipL
F1x+EWAA0eiIYCut68qOgmf0Mwd/5udhpRTr5EK4qnl48+P86W1s6vyzF7TmulGrSCJX6mvn+0ef
p9LXqSMhrRik9LYdwjHNfzb6Mk+C3klm+00LduI83jQ3L4xKso5lqL4tDJczt+hExBY08KaRtL8G
cD0FJog+5DzRQ2RxnW4vkqgtOA82oOaNDNkt2LfMtmI4148SzVwwXEVYawEBEcKRcGZtD4mrsBJT
/eECRMJvY8CSgS5K+0GiEBcjgPo8YbnS0EmxlQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tVsCXUqeN2yt4ko3dcEWQiPkYLNEPSo4MC+wCoFSuZGdT1rcL0bTag55eU2Z9ZdVDfXM0HpuAheo
PX7uHQjXZSqnwhV9tbTBHiGs6UYil4e9loa11sbFfswGSHmmXQYOYbsWBwhgzgBawE180AUGv5k9
hUqoxYr9Ir5UyEqfvodyaL2ORzzP/P9BB6RKkWDzxSk9QzaLSLwVtkuOPu1J3HRbZmVAAQ16uMYN
Jtp4YDWTlrRV0Q090Ns94VXgQPc3eKG0d8/GLEgR9a/B5eRTEBc3RvHIEv7U9OQO6OcwLijs4tEw
dRnSTPAvRiOb1Eawd+uvOP/ZMAg9dP9P45Ny1Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17088)
`pragma protect data_block
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
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
