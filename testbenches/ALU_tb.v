// Name: David Kirk, Zachary Carlson
// BU ID: U51166236, U14078190
// EC413 Project: ALU Test Bench

module ALU_tb();
																		reg branch_op;
reg [5:0] ctrl;
reg [31:0] opA, opB;

wire [31:0] result;
wire branch;

ALU dut (
																	.branch_op(branch_op),
  .ALU_Control(ctrl),
  .operand_A(opA),
  .operand_B(opB),
  .ALU_result(result),
  .branch(branch)
);

initial begin
                                                    branch_op = 1'b0;
  ctrl = 6'b000000;
  opA = 4;
  opB = 5;

  #10
  $display("ALU Result 4 + 5: %d",result);
    $display("Branch (should be 0): %b", branch);
  #10
  ctrl = 6'b000010;
  #10
  $display("ALU Result 4 < 5: %d",result);
    $display("Branch (should be 0): %b", branch);
  ctrl = 6'b000011;	 
    opB = -5;
  $display("ALU Result 4 < -5 unsigned: %d",result);
    $display("Branch (should be 0): %b", branch);	 
	   ctrl = 6'b000010;	 
		#10
		  $display("ALU Result 4 < -5 signed: %d",result);
    $display("Branch (should be 0): %b", branch);	 
	 
  #10
  opB = 32'hffffffff;
  #10
  $display("ALU Result 4 < -1: %d",result);
    $display("Branch (should be 0): %b", branch);

                                                      branch_op = 1'b1;
  opB = 32'hffffffff;
  opA = 32'hffffffff;
  ctrl = 6'b010_000; // BEQ
  #10
  $display("ALU Result (BEQ): %d",result);
  $display("Branch (should be 1): %b", branch);

/******************************************************************************
*                      Add Test Cases Here
******************************************************************************/

                                                     branch_op = 1'b1;
  opB = 32'hffffffff;
  opA = 32'hfffffffe;
  ctrl = 6'b010_000; // BEQ
  #10
  $display("ALU Result (BEQ): %d",result);
  $display("Branch (should be 0): %b", branch);
  
    opB = 32'hffffffff;
  opA = 32'hfffffffe;
  ctrl = 6'b010_001; // BNE
  #10
  $display("ALU Result (BNE): %d",result);
  $display("Branch (should be 1): %b", branch); 

  opB = 32'hffffffff;
  opA = 32'hffffffff;
  ctrl = 6'b010_001; // BNE
  #10
  $display("ALU Result (BNE): %d",result);
  $display("Branch (should be 0): %b", branch); 
  
  
    opB = 32'hffffffff;
  opA = 32'hffffffff;
  ctrl = 6'b010_100; // BLT
  #10
  $display("ALU Result (BLT): %d",result);
  $display("Branch (should be 0): %b", branch); 
  
      opB = 32'hffffffff;
  opA = 32'hfffffffe;
  ctrl = 6'b010_100; // BLT
  #10
  $display("ALU Result (BLT): %d",result);
  $display("Branch (should be 1): %b", branch); 
  
      opB = 32'hffffffff;
  opA = 32'hffffffff;
  ctrl = 6'b010_101; // BGE
  #10
  $display("ALU Result (BGE): %d",result);
  $display("Branch (should be 1): %b", branch); 
  
      opB = 32'hffffffff;
  opA = 32'hfffffffe;
  ctrl = 6'b010_101; // BGE
  #10
  $display("ALU Result (BGE): %d",result);
  $display("Branch (should be 0): %b", branch); 
  
      opB = 32'hffffffff;
  opA = 32'hffffffff;
  ctrl = 6'b010_110; // BLTU
  #10
  $display("ALU Result (BLTU): %d",result);
  $display("Branch (should be 0): %b", branch); 
  
      opB = 32'hffffffff;
  opA = 32'hfffffffe;
  ctrl = 6'b010_110; // BLTU
  #10
  $display("ALU Result (BLTU): %d",result);
  $display("Branch (should be 1): %b", branch); 
  
      opB = 32'hffffffff;
  opA = 32'hffffffff;
  ctrl = 6'b010_111; // BGEU
  #10
  $display("ALU Result (BGEU): %d",result);
  $display("Branch (should be 1): %b", branch); 
  
      opB = 32'hffffffff;
  opA = 32'hfffffffe;
  ctrl = 6'b010_111; // BGEU
  #10
  $display("ALU Result (BGEU): %d",result);
  $display("Branch (should be 0): %b", branch); 
  
  
  
  
  
  
  

 ctrl = 6'b000110;
  opA = 1;
  opB = 2;
  
  #10
$display("ALU Result 1 or 2 (should be 3): %d",result); 
  $display("Branch (should be 0): %b", branch);


  ctrl = 6'b000001;
  opA = 2;
  opB = 2;  #10
$display("ALU Result 2 logic shifted 2 left (should be 8): %d",result);   
  $display("Branch (should be 0): %b", branch);

#10

 ctrl = 6'b000101;
  opA = -1000;
  opB = 3;  #10
$display("ALU Result -1000 logic shifted 3 right: %d",result);   
  $display("Branch (should be 0): %b", branch);

ctrl = 6'b001101;
  opA = -1000;
  opB = 3;  #10
  $display("actual shift: %d", ($signed(opA) >>> opB));
$display("ALU Result -1000 arithmetic shifted 3 right: %d",$signed(result));
  $display("Branch (should be 0): %b", branch);

ctrl = 6'b011111;
  opA = 151;
  opB = 285;  #10
$display("ALU Result pass-through opA for JAL (should be 151): %d",result);
  $display("Branch (should be 0): %b", branch);

ctrl = 6'b111111;
  opA = 251;
  opB = 285;  #10
$display("ALU Result pass-through opA for JALR (should be 251): %d",result);
  $display("Branch (should be 0): %b", branch);


  ctrl = 6'b001000;
  opA = 5;
  opB = 3;

  #10
  $display("ALU Result 5 - 3: %d",result);
    $display("Branch (should be 0): %b", branch);
  #10
  
    ctrl = 6'b000100;
  opA = 5;
  opB = 3;

  #10
  $display("ALU Result 5 xor 3 (should be 6): %d",result);
    $display("Branch (should be 0): %b", branch);
  #10

  ctrl = 6'b000111;
  opA = 5;
  opB = 3;

  #10
  $display("ALU Result 5 and 3 (should be 1): %d",result);
    $display("Branch (should be 0): %b", branch);
  #10
  

  ctrl = 6'b000010;
  opA = 6;
  opB = -8;

  #10
  $display("ALU Result 6 less than -8 (should be 0): %d",result);
    $display("Branch (should be 0): %b", branch);
  #10
  
  
  
  ctrl = 6'b000011;
  opA = 6;
  opB = -8;

  #10
  $display("ALU Result 6 less than -8 unsigned (should be 1): %d",result);
    $display("Branch (should be 0): %b", branch);
  #10
#10
  $stop();

end

endmodule