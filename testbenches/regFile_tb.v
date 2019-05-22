// Name: David Kirk, Zachary Carlson
// BU ID: U51166236, U14078190
// EC413 Project: Register File Test Bench

module regFile_tb();

/******************************************************************************
*                      Start Your Code Here
******************************************************************************/

reg clock, reset, wEn;
reg [4:0] read_sel1, read_sel2, write_sel;
reg [31:0] write_data;
wire [31:0] read_data1, read_data2;

regFile reg1(
  .clock(clock),
  .reset(reset),
  .wEn(wEn),
  .write_data(write_data),
  .read_sel1(read_sel1),
  .read_sel2(read_sel2),
  .write_sel(write_sel),
  .read_data1(read_data1),
  .read_data2(read_data2)
);


always #5 clock = ~clock;

initial begin
  clock = 1'b1;
  reset = 1'b1;

  #20;
  reset = 1'b0;
  wEn = 0;
  write_data = 32'b0;
  write_sel = 5'b0;
  
  
  read_sel1 = 5'b11111;
  read_sel2 = 5'b10101;
  #10;
  reset = 1'b0;
  wEn = 1;
  write_data = 32'd15;
  write_sel = 5'b10101;
  #10;
  wEn = 0;
  #10;
  read_sel1 = 5'b10101;
end

endmodule
