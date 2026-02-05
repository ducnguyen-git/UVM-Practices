class alu_env extends uvm_env;
  
  `uvm_component_utils(alu_env)
  
  alu_agent agnt;
  alu_scoreboard scb;
  
  //------------------------------
  // Constructor
  //------------------------------
  function new(string name = "alu_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "is inside constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------
  // Build phase
  //------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "is inside build phase!", UVM_HIGH)
    
    agnt = alu_agent::type_id::create("agnt", this);
    scb = alu_scoreboard::type_id::create("scb", this);
    
  endfunction: build_phase
  
  //------------------------------
  // Connect phase
  //------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(), "is inside connect phase!", UVM_HIGH)
    
    agnt.mnt.monitor_port.connect(scb.scoreboard_port);
    
  endfunction: connect_phase
  
  //------------------------------
  // Run phase
  //------------------------------
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    // Logic
    
  endtask: run_phase
  
endclass: alu_env