`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 07:47:20 PM
// Design Name: 
// Module Name: horizontal_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module horizontal_counter(
  input clk_25MHz,
  output reg [15:0] H_Counter_Value=0,
  output reg enable_V_Counter = 0);
  
  always @(posedge clk_25MHz) begin
    if (H_Counter_Value < 799) begin
      H_Counter_Value <= H_Counter_Value+1; 
      enable_V_Counter <= 0; end
    else begin
      H_Counter_Value <= 0;
      enable_V_Counter <= 1; 
    end
    
  end
  
endmodule
