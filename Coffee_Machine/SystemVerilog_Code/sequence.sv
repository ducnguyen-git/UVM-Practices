// -------------------------------------------------
// Sequence
// -------------------------------------------------
class coffee_sequence extends uvm_sequence#(coffee_sequence_item);
  //import coffee_pkg::*;
  
  `uvm_object_utils(coffee_sequence)
  
  // ----------------
  // Constructor
  // ----------------
  function new(string name = "coffee_sequence");
    super.new(name);
    `uvm_info(get_type_name(), " is in constructor!", UVM_HIGH)
  endfunction: new
  
  // ----------------
  // BODY function
  // ----------------
  task body();
    `uvm_info(get_type_name(), " is in body task!", UVM_HIGH)
    
    repeat (20) begin
      coffee_sequence_item item = coffee_sequence_item::type_id::create("item");
      start_item(item);
      assert(item.randomize());
      finish_item(item);
    end
    
  endtask: body
  
endclass: coffee_sequence