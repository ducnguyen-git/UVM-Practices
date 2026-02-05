//--------------------------------------------------------
// 8-bit ALU 1.0
//--------------------------------------------------------


/* 
ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 0010  |   ALU_Out = A * B;
----------------------------------------------------------------------
| 0011  |   ALU_Out = A / B;
----------------------------------------------------------------------
*/

module alu(
  // Inputs
  input clock,
  input reset,
  input [7:0] A,B,  
  input [3:0] ALU_Sel,
  
  // Outputs
  output reg [7:0] ALU_Out, 
  output bit Carry_Out 
);

  reg [7:0] ALU_Result;
  wire [8:0] tmp;

  assign tmp = {1'b0,A} + {1'b0,B};

  
  always @(posedge clock or posedge reset) begin
    if(reset) begin
      ALU_Out  <= 8'd0;
      Carry_Out <= 1'd0;
    end else begin
      ALU_Out <= ALU_Result;
      Carry_Out <= tmp[8];
    end
  end

  always @(*) 
    begin
      case(ALU_Sel)
        4'b0000: // Addition
          ALU_Result = A + B; 
        4'b0001: // Subtraction
          ALU_Result = A - B;
        4'b0010: // Multiplication
          ALU_Result = A * B;
        4'b0011: // Division
          ALU_Result = A / B;
        default:
          ALU_Result = 8'hFF; 
      endcase
    end

endmodule