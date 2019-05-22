// Name: David Kirk, Zachary Carlson
// BU ID: U51166236, U14078190
// EC413 Project: ALU

module ALU (
  input branch_op,
  input [5:0]  ALU_Control,
  input [31:0] operand_A,
  input [31:0] operand_B,
  output [31:0] ALU_result,
  output branch
);

/******************************************************************************
*                      Start Your Code Here
******************************************************************************/


	wire [31:0] SLT;
	wire [31:0] SRA;
	assign SLT = {31'b0, ($signed(operand_A) < $signed(operand_B))};
	assign SLTU = {31'b0, ((operand_A) < (operand_B))};
	assign SRA = ($signed(operand_A) >>> operand_B);
	
	
	assign ALU_result = (ALU_Control == 6'b000000) ? (operand_A + operand_B) : //add
							  (ALU_Control == 6'b001000) ? (operand_A - operand_B) : //sub
							  (ALU_Control == 6'b000010) ? 						 (SLT) : //slt
							  (ALU_Control == 6'b000100) ? (operand_A ^ operand_B) : //xor
							  (ALU_Control == 6'b000111) ? (operand_A & operand_B) : //and
							  
							  (ALU_Control == 6'b011111) ? (operand_A) : //JAL
							  (ALU_Control == 6'b111111) ? (operand_A) : //JALR
							  
							  (ALU_Control == 6'b010000) ? 0 : //BEQ
							  (ALU_Control == 6'b010001) ? 0 : //BNE
							  (ALU_Control == 6'b010100) ? 0 : //BLT
							  (ALU_Control == 6'b010101) ? 0 : //BGE
							  (ALU_Control == 6'b010110) ? 0 : //BLTU
							  (ALU_Control == 6'b010111) ? 0 : //BGEU
							  
							  (ALU_Control == 6'b000010) ? (SLT) : //SLTI and SLT
							  (ALU_Control == 6'b000011) ? (SLTU) : //SLTU and SLTIU
							  (ALU_Control == 6'b000110) ? (operand_A | operand_B) : //OR and ORI
							  (ALU_Control == 6'b000001) ? (operand_A << operand_B) : //SLL and SLLI
							  (ALU_Control == 6'b000101) ? (operand_A >> operand_B) : //SRL and SRLI
							  (ALU_Control == 6'b001101) ?  (SRA): (32'b0); //SRA and SRAI
							  
							  
	assign branch =     (ALU_Control == 6'b010000) ? (operand_A == operand_B) : //BEQ
							  (ALU_Control == 6'b010001) ? (operand_A != operand_B) : //BNE
							  (ALU_Control == 6'b010100) ? (SLT) : //BLT
							  (ALU_Control == 6'b010101) ? (!SLT) : //BGE
							  (ALU_Control == 6'b010110) ? (SLTU) : //BLTU
							  (ALU_Control == 6'b010111) ? (!SLTU): (1'b0);//BGEU
							  
							  endmodule
