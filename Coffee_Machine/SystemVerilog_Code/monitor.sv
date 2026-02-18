// -------------------------------------------------
// Monitor
// -------------------------------------------------
class coffee_monitor extends uvm_component;
  //import coffee_pkg::*;
  
  // Previous input values
  size_e 	prev_size;
  bit		prev_with_milk;
  bit		prev_with_foam;
  bit		first_cycle = 1;
  
  `uvm_component_utils(coffee_monitor)
  
  virtual coffee_if vif;
  coffee_sequence_item item;
  
  uvm_analysis_port#(coffee_sequence_item) ap;
  
  // ----------------
  // Constructor
  // ----------------
  function new(string name = "coffee_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), "is inside constructor!", UVM_HIGH)
  endfunction: new
  
  // ----------------
  // Build phase
  // ----------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "is inside build phase!", UVM_HIGH)
    
    ap = new("ap", this);
    
    if (!uvm_config_db#(virtual coffee_if)::get(this, "", "vif", vif)) begin
      `uvm_fatal("NOVIF", "No virtual interface")
    end
    
  endfunction: build_phase
  
  // ----------------
  // Run phase
  // ----------------
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_type_name(), "is inside run phase!", UVM_HIGH)
    
    
    
    item = coffee_sequence_item::type_id::create("mnt_item", this);
    
    forever begin
      @(posedge vif.clk);
      
      // On 2nd and onward cycles, use previous inputs for current output
      if (!first_cycle) begin
        item.size 			= prev_size;
        item.with_milk		= prev_with_milk;
        item.with_foam		= prev_with_foam;
        item.coffee_type	= coffee_type_e'(vif.coffee_type);
        item.print();
        ap.write(item);
      end
      
      // Save current inputs for use on next cycle
      prev_size 		= size_e'(vif.size);
      prev_with_milk 	= vif.with_milk;
      prev_with_foam 	= vif.with_foam;
      first_cycle		= 0;
    end
    
  endtask: run_phase
  
endclass: coffee_monitor