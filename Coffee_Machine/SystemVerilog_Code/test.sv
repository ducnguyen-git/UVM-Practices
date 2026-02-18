// -------------------------------------------------
// Test
// -------------------------------------------------
class coffee_test extends uvm_test;
  //import coffee_pkg::*;
  
  `uvm_component_utils(coffee_test)
  
  coffee_env		env;
  coffee_sequence	seq;
  
  // ----------------
  // Constructor
  // ----------------
  function new(string name = "coffee_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), " is inside constructor!", UVM_HIGH)
  endfunction: new
  
  // ----------------
  // Build phase
  // ----------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), " is inside build phase!", UVM_HIGH)
    
    env = coffee_env::type_id::create("env", this);
    
  endfunction: build_phase
  
  // ----------------
  // Run phase
  // ----------------
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_type_name(), " is inside run phase!", UVM_HIGH)
    
    phase.raise_objection(this);
    
    seq = coffee_sequence::type_id::create("seq");
    seq.start(env.agt.sqr);
    #20;
    
    phase.drop_objection(this);
    
  endtask: run_phase
  
endclass: coffee_test