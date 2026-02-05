class alu_monitor extends uvm_monitor;
  
  `uvm_component_utils(alu_monitor)
  
  virtual alu_interface v_intf;
  alu_sequence_item item;
  
  uvm_analysis_port #(alu_sequence_item) monitor_port;
  
  //------------------------------
  // Constructor
  //------------------------------
  function new(string name = "alu_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "is inside constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------
  // Build phase
  //------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "is inside build phase!", UVM_HIGH)
    
    monitor_port = new("monitor_port", this);
    
    if(!(uvm_config_db #(virtual alu_interface)::get(this, "*", "v_intf", v_intf))) begin
      `uvm_error(get_type_name(), " failed to get virtual interface from config database!")
    end
    
  endfunction: build_phase
  
  //------------------------------
  // Connect phase
  //------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(), "is inside connect phase!", UVM_HIGH)
    
  endfunction: connect_phase
  
  //------------------------------
  // Run phase
  //------------------------------
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_type_name(), "is inside run phase!", UVM_HIGH)
    
    forever begin
      item = alu_sequence_item::type_id::create("item");
      
      wait(!v_intf.rst);
      
      // Sample inputs
      @(posedge v_intf.clock);
      item.a = v_intf.a;
      item.b = v_intf.b;
      item.opcode = v_intf.opcode;
      
      // Sample outputs
      @(posedge v_intf.clock);
      item.out = v_intf.out;
      
      // Send item to scoreboard
      monitor_port.write(item);
    end
    
  endtask: run_phase
  
endclass: alu_monitor