// -------------------------------------------------
// Agent
// -------------------------------------------------
class coffee_agent extends uvm_component;
  //import coffee_pkg::*;
  
  `uvm_component_utils(coffee_agent)
  
  coffee_sequencer 	sqr;
  coffee_driver		drv;
  coffee_monitor	mnt;
  
  // ----------------
  // Constructor
  // ----------------
  function new(string name = "coffee_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "is inside constructor!", UVM_HIGH)
  endfunction: new
  
  // ----------------
  // Build phase
  // ----------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "is inside build phase!", UVM_HIGH)
    
    sqr = coffee_sequencer::type_id::create("sqr", this);
    drv = coffee_driver::type_id::create("drv", this);
    mnt = coffee_monitor::type_id::create("mnt", this);
    
  endfunction: build_phase
  
  // ----------------
  // Connect phase
  // ----------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(), "is inside connect phase!", UVM_HIGH)
    
    drv.seq_item_port.connect(sqr.seq_item_export);
    
  endfunction: connect_phase
  
endclass: coffee_agent