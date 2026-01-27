class our_test extends uvm_test;

    `uvm_component_utils(out_test)
    
    // Instantiate classes
    our_env env;

    // Constructor
    function new(string name = "our_test", uvm_component parent = null);
	super.new(name, parent);
    endfunction
    
    // Build phase
    function void build_phase(uvm_phase phase);
	// Build other components
	// Build env class
	env = our_env::type_id::create("env", this); // Create new env object
    endfunction
    
    // Connect phase
    function void connect_phase(uvm_phase phase);
	// Necessary connections
	
    endfunction

    // Run phase
    task run_phase(uvm_phase phase);

    // Main Logic

    endtask

    // Methods
    
    // Properties

endclass

