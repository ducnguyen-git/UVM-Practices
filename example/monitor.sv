class our_monitor extends uvm_monitor;

    `uvm_component_utils(our_monitor)

    our_interface intf; // Instantiated interface
    our_packet pkt; // Instantiated packet

    uvm_analysis_port #(our_sequence_item) mnt_port;

    function new (string name = "our_monitor", uvm_component parent = null);
	super.new(name, parent);

    endfunction: new

    // Build phase
    function void build_phase(uvm_phase phase);
	// Build other components
	//
	// Reporting macros
	`uvm_info(get_type_name(), "In the build phase", UVM_MEDIUM);
	//
	pkt = our_packet::type_id::create("Our packet");
	// Get interface method
	uvm_config_db #(virtual our_interface)::get(null, "*", "intf", intf);
	
	mnt_port = new("Monitor port", this);

    endfunction
    
    // Connect phase
    function void connect_phase(uvm_phase phase);
	// Necessary connections
	
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);

	// Main Logic
	forever begin
	    @(posedge intf.clk);

		pkt.input_1 <= intf.input_1;
		pkt.input_2 <= intf.input_2;

	end

    endtask
    //Main Logic

endclass: our_monitor
