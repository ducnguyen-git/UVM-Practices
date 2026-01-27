class our_env extends uvm_env;

    `uvm_component_utils(our_env)

    // Instantiate classes
    our_agent agnt;

    function new (string name = "our_env", uvm_component parent = null);
	super.new(name, parent);

    endfunction

    // Build phase
    function void build_phase(uvm_phase phase);
	// Build other components
	
	// Reporting macros
	`uvm_info(get_type_name(), "In the build phase", UVM_MEDIUM);
	// Build agent class
	agnt = our_agent::type_id::create("agnt", this); // Create new agent object
    endfunction
    
    // Connect phase
    function void connect_phase(uvm_phase phase);
	// Necessary connections
	
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);

    // Main Logic

    endtask
endclass: our_env
