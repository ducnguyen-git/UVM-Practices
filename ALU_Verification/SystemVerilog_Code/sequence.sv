// Object class
//------------------------------
// Base Sequence Class
//------------------------------
class alu_base_sequence extends uvm_sequence;
  `uvm_object_utils(alu_base_sequence)
  
  alu_sequence_item rst_pkt;
  
  //------------------------------
  // Constructor
  //------------------------------
  function new(string name = "alu_base_sequence");
    super.new(name);
    `uvm_info(get_type_name(), " is in constructor!", UVM_HIGH)
  endfunction
    
  //------------------------------
  // Body task
  //------------------------------
  task body();
    `uvm_info(get_type_name(), " is in body task!", UVM_HIGH)
    
    rst_pkt = alu_sequence_item::type_id::create("rst_pkt");
    start_item(rst_pkt);
    rst_pkt.randomize() with {rst==1;};
    finish_item(rst_pkt);
    
  endtask: body
  
endclass: alu_base_sequence

//------------------------------
// Test Sequence Class
//------------------------------
class alu_test_sequence extends alu_base_sequence;
  `uvm_object_utils(alu_test_sequence)
  
  alu_sequence_item item;
  
  //------------------------------
  // Constructor
  //------------------------------
  function new(string name = "alu_test_sequence");
    super.new(name);
    `uvm_info(get_type_name(), " is in constructor!", UVM_HIGH)
  endfunction
    
  //------------------------------
  // Body task
  //------------------------------
  task body();
    `uvm_info(get_type_name(), " is in body task!", UVM_HIGH)
    
    item = alu_sequence_item::type_id::create("item");
    start_item(item);
    item.randomize() with {rst==0;};
    finish_item(item);
    
  endtask: body
endclass: alu_test_sequence