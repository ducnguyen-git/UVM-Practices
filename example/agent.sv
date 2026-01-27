class our_agent extends uvm_agent;

    `uvm_component_utils(our_agent)
    
    // Instantiate classes
    our_sequencer seqr;
    our_driver drv;
    our_monitor mnt;

    function new (string name = "our_agent", uvm_component parent = null);
	super.new(name, parent);

    endfunction: new

    // Build phase
    function void build_phase(uvm_phase phase);
	// Build other components
	// Reporting macros
	`uvm_info(get_type_name(), "In the build phase", UVM_MEDIUM);
	// Build sequencer, monitor, driver
	seqr = our_sequencer::type_id::create("seqr", this); // Sequencer obj
	drv = our_driver::type_id::create("drv", this); // Driver obj
	mnt = our_monitor::type_id::create("mnt", this); // Monitor obj
    endfunction
    
    // Connect phase
    function void connect_phase(uvm_phase phase);
	// Necessary connections
	drv.seq_item_port.connect(seqr.seq_item_export)
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);

    // Main Logic

    endtask
endclass: our_agent
