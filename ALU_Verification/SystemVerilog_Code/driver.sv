class alu_driver extends uvm_driver #(alu_sequence_item);
  
  `uvm_component_utils(alu_driver)
  
  virtual alu_interface v_intf;
  alu_sequence_item item;
  
  //------------------------------
  // Constructor
  //------------------------------
  function new(string name = "alu_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "is inside constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------
  // Build phase
  //------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "is inside build phase!", UVM_HIGH)
    
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
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done();
    end
    
  endtask: run_phase
  
  //------------------------------
  // Drive
  //------------------------------
  task drive(alu_sequence_item item);
    @(posedge v_intf.clock);
    v_intf.rst <= item.rst;
    v_intf.a <= item.a;
    v_intf.b <= item.b;
    v_intf.opcode <= item.opcode;
  endtask: drive
  
endclass: alu_driver