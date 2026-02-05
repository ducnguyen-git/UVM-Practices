class alu_scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(alu_scoreboard)
  
  uvm_analysis_imp #(alu_sequence_item, alu_scoreboard) scoreboard_port;
  
  alu_sequence_item transactions[$];
  
  //------------------------------
  // Constructor
  //------------------------------
  function new(string name = "alu_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info(get_type_name(), " is inside constructor!", UVM_HIGH)
  endfunction: new
  
  //------------------------------
  // Build phase
  //------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), " is inside build phase!", UVM_HIGH)
    
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  //------------------------------
  // Connect phase
  //------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_type_name(), " is inside connect phase!", UVM_HIGH)
    
  endfunction: connect_phase
  
  //------------------------------
  // WRITE Method
  //------------------------------
  function void write(alu_sequence_item item);
    transactions.push_back(item);
  endfunction: write
  
  
  //------------------------------
  // Run phase
  //------------------------------
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    `uvm_info(get_type_name(), " is inside run phase!", UVM_HIGH)
    
    forever begin
      // Get the packet
      // Generate expected value
      // Compare with actual value
      // Score the transactions accordingly
      alu_sequence_item curr_trans;
      wait(transactions.size() != 0);
      curr_trans = transactions.pop_front();
      compare(curr_trans);
      
    end
    
  endtask: run_phase
  
  //------------------------------
  // Compare: Generate expected result and compare with actual value
  //------------------------------
  task compare(alu_sequence_item curr_trans);
    logic [7:0] expected;
    logic [7:0] actual;
    
    case(curr_trans.opcode)
      0: begin // A + B
        expected = curr_trans.a + curr_trans.b;
      end
      
      1: begin // A - B
        expected = curr_trans.a - curr_trans.b;
      end
      
      2: begin // A * B
        expected = curr_trans.a * curr_trans.b;
      end
      
      3: begin // A / B
        expected = curr_trans.a / curr_trans.b;
      end
    endcase
    
    actual = curr_trans.out;
    
    if(actual != expected) begin
      `uvm_error("Compare", $sformatf("Transaction failed! Actual = %d | Expected = %d", actual, expected))
    end else begin
      `uvm_info("Compare", $sformatf("Transaction passed! Actual = %d | Expected = %d", actual, expected), UVM_LOW)
    end
    
  endtask: compare
  
endclass: alu_scoreboard