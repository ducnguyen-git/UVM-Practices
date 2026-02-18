// -------------------------------------------------
// Environment
// -------------------------------------------------
class coffee_env extends uvm_env;
  //import coffee_pkg::*;
  
  `uvm_component_utils(coffee_env)
  
  coffee_agent 		agt;
  coffee_scoreboard	scb;
  
  // ----------------
  // Constructor
  // ----------------
  function new(string name = "coffee_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "is inside constructor!", UVM_HIGH)
  endfunction: new
  
  // ----------------
  // Build phase
  // ----------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "is inside build phase!", UVM_HIGH)
    
    agt = coffee_agent::type_id::create("agt", this);
    scb = coffee_scoreboard::type_id::create("scb", this);
    
  endfunction: build_phase
  
  // ----------------
  // Connect phase
  // ----------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(), "is inside connect phase!", UVM_HIGH)
    
    agt.mnt.ap.connect(scb.sb_ap);
    
  endfunction: connect_phase
  
endclass: coffee_env