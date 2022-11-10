module mean_filter
#(
  parameter DATA_WIDTH = 8
)
(
  input                      clk,    //pixel clk
  input                      reset_p,
  input     [DATA_WIDTH-1:0] data_in,
  input                      data_in_valid,
  input                      data_in_hs,
  input                      data_in_vs,

  output    [DATA_WIDTH-1:0] data_out,
  output reg                 data_out_valid,
  output reg                 data_out_hs,
  output reg                 data_out_vs
);
//line data
wire [DATA_WIDTH-1:0] line0_data;
wire [DATA_WIDTH-1:0] line1_data;
wire [DATA_WIDTH-1:0] line2_data;
//matrix 3x3 data
reg  [DATA_WIDTH-1:0] row0_col0;
reg  [DATA_WIDTH-1:0] row0_col1;
reg  [DATA_WIDTH-1:0] row0_col2;

reg  [DATA_WIDTH-1:0] row1_col0;
reg  [DATA_WIDTH-1:0] row1_col1;
reg  [DATA_WIDTH-1:0] row1_col2;

reg  [DATA_WIDTH-1:0] row2_col0;
reg  [DATA_WIDTH-1:0] row2_col1;
reg  [DATA_WIDTH-1:0] row2_col2;
//
reg[DATA_WIDTH+2:0] sum_data;
reg   data_in_valid_dly1;
reg   data_in_hs_dly1;
reg   data_in_vs_dly1;

//3xline data
shift_register_2taps
#(
  .DATA_WIDTH ( DATA_WIDTH )
)shift_register_2taps(
  .clk           (clk           ),
  .shiftin       (data_in       ),
  .shiftin_valid (data_in_valid ),

  .shiftout      (              ),
  .taps0x        (line0_data    ),
  .taps1x        (line1_data    )
);

assign line2_data = data_in;

//----------------------------------------------------
// matrix 3x3 data
// row0_col0   row0_col1   row0_col2
// row1_col0   row1_col1   row1_col2
// row2_col0   row2_col1   row2_col2
//----------------------------------------------------
always @(posedge clk or negedge reset_p) begin
  if(reset_p==1'b0) begin
    row0_col0 <= 'd0;
    row0_col1 <= 'd0;
    row0_col2 <= 'd0;

    row1_col0 <= 'd0;
    row1_col1 <= 'd0;
    row1_col2 <= 'd0;

    row2_col0 <= 'd0;
    row2_col1 <= 'd0;
    row2_col2 <= 'd0;
  end
  else if(data_in_hs && data_in_vs)
    if(data_in_valid) begin
      row0_col2 <= line0_data;
      row0_col1 <= row0_col2;
      row0_col0 <= row0_col1;

      row1_col2 <= line1_data;
      row1_col1 <= row1_col2;
      row1_col0 <= row1_col1;

      row2_col2 <= line2_data;
      row2_col1 <= row2_col2;
      row2_col0 <= row2_col1;
    end
    else begin
      row0_col2 <= row0_col2;
      row0_col1 <= row0_col1;
      row0_col0 <= row0_col0;

      row1_col2 <= row1_col2;
      row1_col1 <= row1_col1;
      row1_col0 <= row1_col0;

      row2_col2 <= row2_col2;
      row2_col1 <= row2_col1;
      row2_col0 <= row2_col0;
    end
  else begin
    row0_col0 <= 'd0;
    row0_col1 <= 'd0;
    row0_col2 <= 'd0;

    row1_col0 <= 'd0;
    row1_col1 <= 'd0;
    row1_col2 <= 'd0;

    row2_col0 <= 'd0;
    row2_col1 <= 'd0;
    row2_col2 <= 'd0;
  end
end

always @(posedge clk)
begin
  data_in_valid_dly1 <= data_in_valid;
  data_in_hs_dly1    <= data_in_hs;
  data_in_vs_dly1    <= data_in_vs;
end

//----------------------------------------------------
//result
//----------------------------------------------------
always @(posedge clk or negedge reset_p) begin
  if(reset_p==1'b0)
    sum_data <= 'd0;
  else if(data_in_valid_dly1)
    sum_data <= (row0_col0 + row0_col1 + row0_col2 + 
                 row1_col0 +             row1_col2 + 
                 row2_col0 + row2_col1 + row2_col2 );
end

assign data_out = sum_data>>3;

always @(posedge clk)
begin
  data_out_valid <= data_in_valid_dly1;
  data_out_hs    <= data_in_hs_dly1;
  data_out_vs    <= data_in_vs_dly1;
end

endmodule
