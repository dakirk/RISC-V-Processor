// Name: Zachary Carlson, David Kirk
// BU ID: U14078190, U51166236
// EC413 Project: Register File

module regFile (
  input clock,
  input reset,
  input wEn, // Write Enable
  input [31:0] write_data,
  input [4:0] read_sel1,
  input [4:0] read_sel2,
  input [4:0] write_sel,
  output [31:0] read_data1,
  output [31:0] read_data2
);

reg   [31:0] reg_file[0:31];

/******************************************************************************
*                      Start Your Code Here
******************************************************************************/
	assign read_data1 = reg_file[read_sel1];
	assign read_data2 = reg_file[read_sel2];

	always @(posedge clock) begin
		if (reset) begin
			reg_file[0] <= 32'b0;
			reg_file[1] <= 32'b0;
			reg_file[2] <= 32'b0;
			reg_file[3] <= 32'b0;
			reg_file[4] <= 32'b0;
			reg_file[5] <= 32'b0;
			reg_file[6] <= 32'b0;
			reg_file[7] <= 32'b0;
			reg_file[8] <= 32'b0;
			reg_file[9] <= 32'b0;
			reg_file[10] <= 32'b0;
			reg_file[11] <= 32'b0;
			reg_file[12] <= 32'b0;
			reg_file[13] <= 32'b0;
			reg_file[14] <= 32'b0;
			reg_file[15] <= 32'b0;
			reg_file[16] <= 32'b0;
			reg_file[17] <= 32'b0;
			reg_file[18] <= 32'b0;
			reg_file[19] <= 32'b0;
			reg_file[20] <= 32'b0;
			reg_file[21] <= 32'b0;
			reg_file[22] <= 32'b0;
			reg_file[23] <= 32'b0;
			reg_file[24] <= 32'b0;
			reg_file[25] <= 32'b0;
			reg_file[26] <= 32'b0;
			reg_file[27] <= 32'b0;
			reg_file[28] <= 32'b0;
			reg_file[29] <= 32'b0;
			reg_file[30] <= 32'b0;
			reg_file[31] <= 32'b0;	
		end else if (wEn & write_sel != 0) begin
			reg_file[write_sel] <= write_data;
		end
		
		
		
	end


endmodule
