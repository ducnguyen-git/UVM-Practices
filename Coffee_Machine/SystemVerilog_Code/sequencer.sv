// -------------------------------------------------
// Sequencer
// -------------------------------------------------
class coffee_sequencer extends uvm_sequencer#(coffee_sequence_item);
  //import coffee_pkg::*;
  
  `uvm_component_utils(coffee_sequencer)
  
  // ----------------
  // Constructor
  // ----------------
  function new(string name = "coffee_sequencer", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "is inside constructor!", UVM_HIGH)
  endfunction: new
  
endclass: coffee_sequencer