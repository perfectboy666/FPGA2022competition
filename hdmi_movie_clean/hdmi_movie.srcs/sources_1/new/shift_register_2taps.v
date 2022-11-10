module shift_register_2taps
#(
  parameter DATA_WIDTH = 16
)
(
  input                   clk,
  input  [DATA_WIDTH-1:0] shiftin,
  input                   shiftin_valid,

  output [DATA_WIDTH-1:0] shiftout,
  output [DATA_WIDTH-1:0] taps1x,
  output [DATA_WIDTH-1:0] taps0x
);

assign shiftout = taps0x;

shift_reg_ram shift_reg_ram_inst1 (
  .D   (shiftin       ),// input wire [15 : 0] D
  .CLK (clk           ),// input wire CLK
  .CE  (shiftin_valid ),// input wire CE
  .Q   (taps1x        ) // output wire [15 : 0] Q
);

shift_reg_ram shift_reg_ram_inst2 (
  .D  (taps1x        ),// input wire [15 : 0] D
  .CLK(clk           ),// input wire CLK
  .CE (shiftin_valid ),// input wire CE
  .Q  (taps0x        ) // output wire [15 : 0] Q
);

endmodule