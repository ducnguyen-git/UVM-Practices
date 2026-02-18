// -------------------------------------------------
// Scoreboard
// -------------------------------------------------
class coffee_scoreboard extends uvm_scoreboard;
  //import coffee_pkg::*;
  
  `uvm_component_utils(coffee_scoreboard)
  
  uvm_analysis_imp#(coffee_sequence_item, coffee_scoreboard) sb_ap;
  
  // ----------------
  // Constructor
  // ----------------
  function new(string name = "coffee_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), " is inside constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------
  // Build phase
  //------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), " is inside build phase!", UVM_HIGH)
    
    sb_ap = new("sb_ap", this);
    
  endfunction: build_phase
  
  // ----------------
  // WRITE & COMPARE Function
  // ----------------
  function void write(coffee_sequence_item item);
    coffee_type_e expected;
    
    case ({item.size, item.with_milk, item.with_foam})
      // Espresso
      3'b000: expected = {SMALL, ESPRESSO};
      3'b100: expected = {BIG, ESPRESSO};
      
      // Latte
      3'b010: expected = {SMALL, LATTE};
      3'b110: expected = {BIG, LATTE};
      
      // Cappuccino
      3'b011: expected = {SMALL, CAPPUCCINO};
      3'b111: expected = {BIG, CAPPUCCINO};
      
      // Default
      default: expected = {1'b0, NONE};
    endcase
    
    if (item.coffee_type !== expected)
      `uvm_error("SCOREBOARD", $sformatf("Mismatch! Expected: %s, Got: %s", 
                                         expected.name(), item.coffee_type.name()))
    else
      `uvm_info("SCOREBOARD", $sformatf("Correct coffee: %s", 
                                        item.coffee_type.name()), UVM_LOW);
  endfunction: write
  
endclass: coffee_scoreboard