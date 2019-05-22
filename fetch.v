// Name: David Kirk, Zachary Carlson
// BU ID: U51166236, U14078190
// EC413 Project: Fetch Module

module fetch #(
  parameter ADDRESS_BITS = 16
) (
  input  clock,
  input  reset,
  input  next_PC_select,
  input  [ADDRESS_BITS-1:0] target_PC,
  output [ADDRESS_BITS-1:0] PC
);

reg [ADDRESS_BITS-1:0] PC_reg;

assign PC = PC_reg;

/******************************************************************************
*                      Start Your Code Here
******************************************************************************/

always @(posedge clock) begin

	if (reset) begin
		PC_reg <= 0;
	end else if (next_PC_select) begin
		PC_reg <= target_PC;
	end else begin
		PC_reg <= PC + 4;
	end

end

endmodule
