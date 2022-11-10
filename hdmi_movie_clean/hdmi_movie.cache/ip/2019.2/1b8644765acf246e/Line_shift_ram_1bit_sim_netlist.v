// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Oct 23 22:09:35 2022
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
  (* c_depth = "640" *) 
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
(* C_DEPTH = "640" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
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
  (* c_depth = "640" *) 
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
hFBm2oCROl2Nk0BGVEcWLgwutnTaqP+PDqnbCoDh9qEXs3/CateqebbN1D/dqlQOttFcdT1SlcvK
fU+zRTcB3ShodBNKrS7oT09IeCFOA5+lLOM5F4ZhbPBnYxXBmYem3/WTN/8yvLQTCIDq2x3tMkL4
m/eu/ViNmMaG+/dYC8UE1TSD2F2WhQLt/CeyYRq0kA4/9r6lB2XqW4F9CmL5jtpMWsObC92uLciJ
nwbEEcfPmMrVKNib+DfOxUssOIdnbn+Po1aqgkgvgxF5AQeFhj+8svyxHPy+6NP/PEjl3wSmkeWl
hMhg2CiykfGtlR4aL0V8NANWCf8nVeUoXTelCQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
B5HpQUisGRt+cZuTvpqI2FZIOCDPem3U2uXTJQ7Zr8S7HTeGAsmmaa0azIHrPtvyJ46uTegDIAwP
X30ldWSvnZzIpOqFJNbq8KqhJy+zXfnbGqrRDz/LCMMG1U/jRNvMT+0o9IQ+KvMcCMV2sB9xqxZC
XC6zGge2+solt6tqIU8IviyKtQ41OeW7d3fMFhb0XkKrCt0gTOkZtFgkSDqe5EPAUP8jdmPBHZFB
XMs2OKRrg59vxlvgZLVnizXI9Pa98BE+TjTqz41jJPY4nipwZb+7Si5AI/NMILO90g+I+YlO9QZ3
pbFJvpAppk3aS4K4JPwdeyToa9vPlmbKssv1XA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21536)
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
