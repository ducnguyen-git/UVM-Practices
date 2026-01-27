class our_driver extends uvm_driver #(our_packet);

    `uvm_component_utils(our_driver)

    our_interface intf; // Instantiated interface
    our_packet pkt; // Instantiated packet

    function new (string name = "our_driver", uvm_component parent = null);
	super.new(name, parent);

    endfunction: new

    // Build phase
    function void build_phase(uvm_phase phase);
	// Build other components
	//
	// Reporting macros
	`uvm_info(get_type_name(), "In the build phase", UVM_MEDIUM);
	//
	pkt = our_packet::type_id::create("Our Packet");
	// Get interface method
	uvm_config_db #(virtual our_interface)::get(null, "*", "intf", intf);
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

		seq_item_port.get_next_item(pkt);

		intf.input_1 <= pkt.input_1;
		intf.input_2 <= pkt.input_2;

		seq_item_port.item_done();

	end
    endtask
    //Main Logic

endclass: our_driver
