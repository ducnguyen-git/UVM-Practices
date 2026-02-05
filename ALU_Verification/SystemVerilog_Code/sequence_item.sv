// Object class

class alu_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(alu_sequence_item)
  
  //------------------------------
  // Instantiation
  //------------------------------
  // Inputs
  //------------------------------
  rand logic rst;
  
  rand logic [7:0] a, b;
  rand logic [3:0] opcode;
  
  //------------------------------
  // Outputs
  //------------------------------
  logic [7:0] out;
  bit carry;
  
  //------------------------------
  // Default constraints
  //------------------------------
  constraint input1_c {a inside {[10:20]};}
  constraint input2_c {b inside {[1:10]};}
  constraint opcode_c {opcode inside {0, 1, 2, 3};}
  
  //------------------------------
  // Constructor
  //------------------------------
  function new(string name = "alu_sequence_item");
    super.new(name);
    
  endfunction: new
  
endclass: alu_sequence_item