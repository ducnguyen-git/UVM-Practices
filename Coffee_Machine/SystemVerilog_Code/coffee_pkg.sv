package coffee_pkg;
import uvm_pkg::*;
`include "uvm_macros.svh"

	
// -------------------------------------------------
// Enumerations
// -------------------------------------------------
typedef enum bit {
  SMALL = 1'b0,
  BIG = 1'b1
} size_e;

typedef enum logic [1:0] {
  NONE			= 2'd0,
  ESPRESSO		= 2'd1,
  LATTE			= 2'd2,
  CAPPUCCINO	= 2'd3
} coffee_type_e;

`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

/*
// -------------------------------------------------
// Sequence Item (Transaction)
// -------------------------------------------------
class coffee_sequence_item extends uvm_sequence_item;
  
endclass: coffee_sequence_item

// -------------------------------------------------
// Sequencer
// -------------------------------------------------
class coffee_sequencer extends uvm_sequencer #(coffee_sequence_item);
  `uvm_component_utils(coffee_sequencer)
  
endclass: coffee_sequencer

// -------------------------------------------------
// Driver
// -------------------------------------------------
class coffee_driver extends uvm_driver #(coffee_sequence_item);
  `uvm_component_utils(coffee_driver)
  
endclass: coffee_driver

// -------------------------------------------------
// Monitor
// -------------------------------------------------
class coffee_monitor extends uvm_component;
  `uvm_component_utils(coffee_monitor)
  
endclass: coffee_monitor

// -------------------------------------------------
// Agent
// -------------------------------------------------
class coffee_agent extends uvm_component;
  `uvm_component_utils(coffee_agent)
  
endclass: coffee_agent

// -------------------------------------------------
// Scoreboard
// -------------------------------------------------
class coffee_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(coffee_scoreboard)
  
endclass: coffee_scoreboard

// -------------------------------------------------
// Environment
// -------------------------------------------------
class coffee_env extends uvm_env;
  `uvm_component_utils(coffee_env)
  
endclass: coffee_env

// -------------------------------------------------
// Sequence
// -------------------------------------------------
class coffee_sequence extends uvm_sequence #(coffee_sequence_item);
  `uvm_object_utils(coffee_sequence)
  
endclass: coffee_sequence

// -------------------------------------------------
// Test
// -------------------------------------------------
class coffee_test extends uvm_test;
  `uvm_component_utils(coffee_test)
  
endclass: coffee_test
*/

endpackage: coffee_pkg