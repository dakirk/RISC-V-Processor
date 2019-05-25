# RISC-V-Processor
Simple single-stage RISC-V processor which can run simple programs with a limited instruction set. Programs can be written in RISC-V assembly and assembled for this processor using [this assembler](https://github.com/dakirk/RISC-V-Assembler).

To use:
1. Create a new Verilog project and import each module and testbench manually
2. Place your chosen vmh file in your working directory
3. In top_tb.v, replace the name of the vmh file in the line "$readmemh("./fibonacci.vmh", dut.main_memory.ram);" with the name of your chosen file
4. Simulate top_tb.v

Contributors:
- Zachary Carlson
- David Kirk
