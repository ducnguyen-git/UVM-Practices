`include "uvm_macros.svh"

import uvm_pkg::*;

module top();

    our_interface intf(); // Instantiated interface
    our_design uut(); // Instantiated design

    initial begin
	// Set method
	uvm_config_db #(virtual our_interface)::set(null, "*", "intf", intf);
    end

    initial begin
	run_test("our_test");
    end

endmodule
