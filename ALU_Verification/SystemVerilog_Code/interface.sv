interface alu_interface(input logic clock);
  
  logic rst;
  
  logic [7:0] a, b;
  logic [3:0] opcode;
  
  logic [7:0] out;
  bit carry;
  
endinterface: alu_interface