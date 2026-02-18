// -------------------------------------------------
// Sequence Item (Transaction)
// -------------------------------------------------
class coffee_sequence_item extends uvm_sequence_item;
  
  rand size_e size;
  rand bit 		with_milk;
  rand bit		with_foam;
  
  coffee_type_e	coffee_type; // Output from DUT
  
  // Keep the coffee order correct
  constraint foam_request {
    if (with_foam) with_milk == 1;
  }
  
  `uvm_object_utils(coffee_sequence_item)
  
  // ----------------
  // Constructor
  // ----------------
  function new(string name = "coffee_sequence_item");
    super.new(name);
  endfunction
  
  virtual function void do_print(uvm_printer printer);
    printer.print_string("coffee_type", coffee_type.name());
    printer.print_string("size", 		size.name());
    printer.print_field_int("with_milk", with_milk, 1);
    printer.print_field_int("with_foam", with_foam, 1);
  endfunction
  
endclass: coffee_sequence_item