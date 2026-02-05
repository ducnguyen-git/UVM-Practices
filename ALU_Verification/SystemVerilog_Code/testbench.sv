// ALU Verification with UVM
// Date: Jan 28th, 2026


`timescale 1ns/1ns
//------------------------------
// Include Files
//------------------------------
//import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

//------------------------------
// Top Module
// -----------------------------

module top;
  //------------------------------
  // Instantiation
  // -----------------------------
  
  logic clk;
  
  alu_interface intf(.clock(clk));
  
  alu dut(
    // Inputs
    .clock(intf.clock),
    .reset(intf.rst),
    .A(intf.a),
    .B(intf.b),
    .ALU_Sel(intf.opcode),
    
    // Outputs
    .ALU_Out(intf.out),
    .Carry_Out(intf.carry)
  );
  
  //------------------------------
  // Interface setting
  // -----------------------------
  initial begin
    uvm_config_db #(virtual alu_interface)::set(null, "*", "v_intf", intf);
  end
  
  //------------------------------
  // Start the test
  // -----------------------------
  initial begin
    run_test("alu_test");
  end
  
  //------------------------------
  // Clock
  // -----------------------------
  initial begin
    clk = 0;
    forever begin
      #5 clk = ~clk;
    end
  end
  
  //------------------------------
  // End of program
  // -----------------------------
  initial begin
    #5000;
    $display("End of program!");
    $finish();
  end
  
  //------------------------------
  // Waveform generator
  // -----------------------------
  initial begin
    $dumpfile("d.vcd");
    $dumpvars();
  end
  
endmodule: top