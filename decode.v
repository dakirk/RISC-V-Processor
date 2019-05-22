// Name: Zachary Carlson, David Kirk
// BU ID: U14078190, U51166236
// EC413 Project: Decode Module

module decode #(
  parameter ADDRESS_BITS = 16
) (
  // Inputs from Fetch
  input [ADDRESS_BITS-1:0] PC,
  input [31:0] instruction,

  // Inputs from Execute/ALU
  input [ADDRESS_BITS-1:0] JALR_target,
  input branch,

  // Outputs to Fetch
  output next_PC_select,
  output [ADDRESS_BITS-1:0] target_PC,

  // Outputs to Reg File
  output [4:0] read_sel1,
  output [4:0] read_sel2,
  output [4:0] write_sel,
  output wEn,

  // Outputs to Execute/ALU
  output branch_op, // Tells ALU if this is a branch instruction
  output [31:0] imm32,
  output [1:0] op_A_sel,
  output op_B_sel,
  output [5:0] ALU_Control,

  // Outputs to Memory
  output mem_wEn,

  // Outputs to Writeback
  output wb_sel

);

localparam [6:0]R_TYPE  = 7'b0110011,
                I_TYPE  = 7'b0010011,
                STORE   = 7'b0100011,
                LOAD    = 7'b0000011,
                BRANCH  = 7'b1100011,
                JALR    = 7'b1100111,
                JAL     = 7'b1101111,
                AUIPC   = 7'b0010111,
                LUI     = 7'b0110111;


// These are internal wires that I used. You can use them but you do not have to.
// Wires you do not use can be deleted.
//wire[6:0]  s_imm_msb;
//wire[4:0]  s_imm_lsb;
//wire[19:0] u_imm;
//wire[11:0] i_imm_orig;
//wire[19:0] uj_imm;
//wire[11:0] s_imm_orig;
//wire[12:0] sb_imm_orig;

//wire[31:0] sb_imm_32;
//wire[31:0] u_imm_32;
//wire[31:0] i_imm_32;
//wire[31:0] s_imm_32;
//wire[31:0] uj_imm_32;

wire [6:0] opcode;
wire [6:0] funct7;
wire [2:0] funct3;
wire [1:0] extend_sel;
wire [ADDRESS_BITS-1:0] branch_target;
wire [ADDRESS_BITS-1:0] JAL_target;


// Read registers
assign read_sel2  = instruction[24:20];
assign read_sel1  = (opcode == LUI) ? (5'b0) : (instruction[19:15]); //HACKY SOLUTION--CHANGE ME???

/* Instruction decoding */
assign opcode = instruction[6:0];
assign funct7 = instruction[31:25];
assign funct3 = instruction[14:12];

/* Write register */
assign write_sel = instruction[11:7];



/******************************************************************************
* Start Your Code Here
******************************************************************************/

//idea: test opcode first for r-type, i-type, or s-type
//for each, take it apart according to its format

wire [11:0] imm12;
wire [19:0] imm20;

//if opcode is for R-type or invalid, set to 0, else set to what it should be
assign imm12 = ((opcode == I_TYPE & funct3 != 3'b001 & funct3 != 3'b101) | opcode == LOAD | opcode == JALR) ? (instruction[31:20]) :
					(opcode == I_TYPE & (funct3 == 3'b001 | funct3 == 3'b101)) ? ({7'b0000000, instruction[24:20]}) : //for shifts
					(opcode == STORE)	? ({instruction[31:25], instruction[11:7]}) :
					(opcode == BRANCH) ? ({instruction[31], instruction[7], instruction[30:25], instruction[11:8]}) :
					(opcode == LUI | opcode == AUIPC) ? ({instruction[31:12]}) :
					(opcode == JAL) ? ({instruction[31], instruction[19:12], instruction[20], instruction[30:21]}) : (12'b0);

assign imm20 = (opcode == JAL) ? ({instruction[31], instruction[19:12], instruction[20], instruction[30:21]}) :
					(opcode == LUI | opcode == AUIPC) ? ({instruction[31:12]}) : (20'b0);

//sign extension (20->32 for JAL, 20->32 shifted to upper for LUI and AUIPC, and 12->32 for everything else)
assign imm32 = (opcode == JAL) ? ({ {12{imm20[19]}}, imm20}) : 
					(opcode == LUI | opcode == AUIPC) ? ({imm20, 12'b0}) : ({ {20{imm12[11]}}, imm12});

//set ALU_Control: if add, do add...
assign ALU_Control = (opcode == JAL) ? (6'b011111) : //PASS THRU for JAL
							(opcode == JALR) ? (6'b111111) : //PASS THRU for JALR
							(opcode == BRANCH & funct3 == 3'b000) ? (6'b010000) : //EQUALS
							(opcode == BRANCH & funct3 == 3'b001) ? (6'b010001) : //NOT EQUALS
							(opcode == BRANCH & funct3 == 3'b100) ? (6'b010100) : //LESS THAN (branch)
							(opcode == I_TYPE & funct3 == 3'b010) ? (6'b000010) : //LESS THAN (SLTI)
							(opcode == I_TYPE & funct3 == 3'b011) ? (6'b000011) : //LESS THAN (SLTIU)
							(opcode == R_TYPE & funct3 == 3'b010 & funct7 == 7'b0000000) ? (6'b000010) : //LESS THAN (SLT)
							(opcode == R_TYPE & funct3 == 3'b011 & funct7 == 7'b0000000) ? (6'b000011) : //LESS THAN (SLTU)
							(opcode == BRANCH & funct3 == 3'b101) ? (6'b010101) : //GREATER THAN OR EQUAL
							(opcode == BRANCH & funct3 == 3'b110) ? (6'b010110) : //LESS THAN UNSIGNED (branch)
							(opcode == BRANCH & funct3 == 3'b111) ? (6'b010111) : //GREATER THAN OR EQUAL UNSIGNED
							((opcode == I_TYPE | opcode == R_TYPE) & funct3 == 3'b100) ? (6'b000100) : //XOR
							((opcode == I_TYPE | opcode == R_TYPE) & funct3 == 3'b110) ? (6'b000110) : //OR
							((opcode == I_TYPE | opcode == R_TYPE) & funct3 == 3'b111) ? (6'b000111) : //AND
							((opcode == I_TYPE | opcode == R_TYPE) & funct3 == 3'b001) ? (6'b000001) : //LEFT SHIFT
							((opcode == I_TYPE | opcode == R_TYPE) & funct3 == 3'b101 & funct7 == 7'b0000000) ? (6'b000101) : //LOGICAL RIGHT SHIFT
							((opcode == I_TYPE | opcode == R_TYPE) & funct3 == 3'b101 & funct7 == 7'b0100000) ? (6'b001101) : //ARITHMETIC RIGHT SHIFT
							((opcode == R_TYPE & funct3 == 3'b000 & funct7 == 7'b0100000)) ? (6'b001000) : (6'b000000); //SUBTRACT, else ADD
							//(opcode == LUI | opcode == AUIPC | opcode == LOAD | opcode == STORE | (opcode == I_TYPE & funct3 == 3'b000) | (opcode == R_TYPE & funct3 == 3'b000 & funct7 == 7'b0000000)) ? (6'b000000) : //ADD
							
		
//if opcode is AUIPC, return 1 (for PC); if opcode is for JAL, return 2; else return 0
assign op_A_sel = (opcode == AUIPC) ? (2'b01) :
						(opcode == JAL | opcode == JALR) ? (2'b10) : (2'b00);
		
//if opcode is for R-type, return 1 (for rs2), else 0 (for imm32)					
assign op_B_sel = (opcode == R_TYPE | opcode == BRANCH) ? (1'b1) : (1'b0);

//if a jump or branch will be performed, 1; else 0 
assign next_PC_select = (opcode == JAL | opcode == JALR | branch) ? (1'b1) : (1'b0);

//uses JALR_target only if JALR is the current instruction; else uses imm32
assign target_PC = (opcode == JALR) ? (JALR_target) : ((imm32 << 1) + PC);

//1 if branch instruction, 0 else
assign branch_op = (opcode == BRANCH) ? (1'b1) : (1'b0);

//if opcode is for S-type, return 1 (for sw), else 0 (for everything else)
assign mem_wEn = (opcode == STORE) ? (1'b1) : (1'b0);

//if lw operation, return 1 (writeback from memory), else return 0 (writeback from alu)
assign wb_sel = (opcode == LOAD) ? (1'b1) : (1'b0); //only load operation is lw?

//if branch or sw, assert 0 (not enabled), else 1 (reg file enabled)
assign wEn = (opcode == BRANCH | opcode == STORE) ? (1'b0) : (1'b1);

endmodule
