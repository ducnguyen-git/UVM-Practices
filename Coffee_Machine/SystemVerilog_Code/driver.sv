// -------------------------------------------------
// Driver
// -------------------------------------------------
class coffee_driver extends uvm_driver#(coffee_sequence_item);
  //import coffee_pkg::*;
  
  `uvm_component_utils(coffee_driver)
  
  virtual coffee_if vif;
  coffee_sequence_item item;
  
  // ----------------
  // Constructor
  // ----------------
  function new(string name = "coffee_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "is inside constructor!", UVM_HIGH)
  endfunction: new
  
  // ----------------
  // Build phase
  // ----------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "is inside build phase!", UVM_HIGH)
    
    if (!uvm_config_db#(virtual coffee_if)::get(this, "", "vif", vif))
      `uvm_fatal("NOVIF", "No virtual interface")
  endfunction: build_phase
      
  // ----------------
  // Run phase
  // ----------------
  task run_phase(uvm_phase phase);
    forever begin
      item = coffee_sequence_item::type_id::create("item");
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done();
    end
  endtask: run_phase
    
  //------------------------------
  // Drive
  //------------------------------
  task drive(coffee_sequence_item item);
    @(posedge vif.clk);
    vif.size 		<= item.size;
    vif.with_milk	<= item.with_milk;
    vif.with_foam	<= item.with_foam;
  endtask: drive
  
endclass: coffee_driver