module coffee_machine(
  input clk,
  input size,
  input with_milk,
  input with_foam,
  
  output reg [2:0] coffee_type
);
  
  // Size parameters
  localparam SMALL 	= 1'b0;
  localparam BIG 	= 1'b1;
  
  // Coffee type parameters
  localparam NONE 		= 2'd0;
  localparam ESPRESSO 	= 2'd1;
  localparam LATTE 		= 2'd2;
  localparam CAPPUCCINO	= 2'd3;
  
  always @(posedge clk) begin
    case({size, with_milk, with_foam})
      
      // Espresso
      3'b000: coffee_type <= {SMALL, ESPRESSO};
      3'b100: coffee_type <= {BIG, ESPRESSO};
      
      // Latte
      3'b010: coffee_type <= {SMALL, LATTE};
      3'b110: coffee_type <= {BIG, LATTE};
      
      // Cappuccino
      3'b011: coffee_type <= {SMALL, CAPPUCCINO};
      3'b111: coffee_type <= {BIG, CAPPUCCINO};
      
      // Default (3'b001 & 3'b101)
      default: coffee_type <= {1'b0, NONE};
    endcase
  end
    
endmodule