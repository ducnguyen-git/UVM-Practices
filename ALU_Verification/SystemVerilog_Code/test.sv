class alu_test extends uvm_test;
  
  `uvm_component_utils(alu_test)
  
  alu_env env;
  alu_base_sequence rst_seq;
  alu_test_sequence test_seq;
  
  //------------------------------
  // Constructor
  //------------------------------
  function new(string name = "alu_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), " is inside constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------
  // Build phase
  //------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), " is inside build phase!", UVM_HIGH)
    
    env = alu_env::type_id::create("env", this);
    
  endfunction: build_phase
  
  //------------------------------
  // Connect phase
  //------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(), " is inside connect phase!", UVM_HIGH)
    
    // Connect monitor with scoreboard
    
  endfunction: connect_phase
  
  //------------------------------
  // Run phase
  //------------------------------
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_type_name(), " is inside run phase!", UVM_HIGH)
    
    phase.raise_objection(this);
    
    // Reset sequence
    rst_seq = alu_base_sequence::type_id::create("reset_seq");
    rst_seq.start(env.agnt.seqr);
    #50;
    
    repeat(100) begin
      // Test sequence
      test_seq = alu_test_sequence::type_id::create("test_seq");
      test_seq.start(env.agnt.seqr);
      #50;
    end
    phase.drop_objection(this);
    
  endtask: run_phase
  
endclass: alu_test