class our_sequencer extends uvm_sequencer #(our_packet);

    `uvm_component_utils(our_sequencer)
    
    function new (string name = "our_sequencer", uvm_component parent = null);
	super.new(name, parent);

    endfunction: new

    // Build phase
    function void build_phase(uvm_phase phase);
	// Build other components
	
	// Reporting macros
	`uvm_info(get_type_name(), "In the build phase", UVM_MEDIUM);
    endfunction
    
    // Connect phase
    function void connect_phase(uvm_phase phase);
	// Necessary connections
	
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);

    // Main Logic

    endtask
    //Main Logic

endclass: our_sequencer
