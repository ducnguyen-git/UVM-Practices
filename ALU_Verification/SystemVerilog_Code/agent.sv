class alu_agent extends uvm_agent;
  
  `uvm_component_utils(alu_agent)
  
  alu_driver drv;
  alu_monitor mnt;
  alu_sequencer seqr;
  
  //------------------------------
  // Constructor
  //------------------------------
  function new(string name = "alu_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "is inside constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------
  // Build phase
  //------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "is inside build phase!", UVM_HIGH)
    
    drv = alu_driver::type_id::create("drv", this);
    mnt = alu_monitor::type_id::create("mnt", this);
    seqr = alu_sequencer::type_id::create("seqr", this);
    
  endfunction: build_phase
  
  //------------------------------
  // Connect phase
  //------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(), "is inside connect phase!", UVM_HIGH)
    
    drv.seq_item_port.connect(seqr.seq_item_export);
    
  endfunction: connect_phase
  
  //------------------------------
  // Run phase
  //------------------------------
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    // Logic
    
  endtask: run_phase
  
endclass: alu_agent