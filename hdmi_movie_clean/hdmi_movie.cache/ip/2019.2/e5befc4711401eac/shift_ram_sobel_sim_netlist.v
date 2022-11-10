// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri Oct 21 21:21:34 2022
// Host        : MT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ shift_ram_sobel_sim_netlist.v
// Design      : shift_ram_sobel
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tfgg484-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "shift_ram_sobel,c_shift_ram_v12_0_14,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_14,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_14 U0
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_shift_ram_v12_0_14_viv i_synth
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
gpkpIjWmZrJ3Q1TD/HgVgfl3myLtdgqmyAVg/LgdN0y3PAH1DN4FdBC30Kw91XvsZpTSoaDXd6Cx
UPjcqxWJgnPythLQuNNcUyXBdmYD1l5N5iogr4DsQFmWP7dauKs7xmx7V1vv8HpU3V6jLWMhszYn
Y7sDBSQX3XGfX6s1bHFcYNV3pTVTljispiXtqiVUbbL+EbW8O68p7Q0niWaKLOO/JxllSVRzU4N7
bfGf9Jp5xiq00t3h8ih2NJA3Rvd+vbzbItv7AxyPMTyScnoSpFn3vgBeH8KmhOAEcOzmSiDWKzuT
r7mIJS8yGKohn+I3VPoDvqOjEBRnQU/e9Po1sQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uK/mn57ZVSOSO5BALcUXgkG7V7eaJEQulqozMUoDDmetLluDsPFscs8Cc9SsVtruLfvkEKkxJbv8
zge++9FRMGoJzKdZwjI6Z/+kuKK34qnqA6yc3XksVBNsCts7ypHCQq4fSfvdBKSCMAe6MmNPD0Gy
4fzO6LXZAgB6K3vSviS8VMtk0Y6r58xpD/kzPu6N6Mw/F8jR4w1N7kAwHy2n8DbNPoc/SbSANy7O
mm2+cArB+WOCcBdgQIS7KNIPlLHU7+ijGB6NL9aSrbBCsz3Yz3RP9WSxw3O0LXF1hqTPJ3GY04Vz
0uWhLER5IsCX46nBQalAbV0iizLpHYvG2mJojg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 6144)
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
