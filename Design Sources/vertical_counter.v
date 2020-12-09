`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 07:48:09 PM
// Design Name: 
// Module Name: vertical_counter
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


module vertical_counter(
  input clk_25MHz,
  output reg [15:0] V_Counter_Value=0,
  input enable_V_Counter);
  
  always @(posedge clk_25MHz) begin
    if (enable_V_Counter == 1'b1) begin
        if (V_Counter_Value < 524) begin
      		V_Counter_Value <= V_Counter_Value+1; 
    	end
    	else begin
      		V_Counter_Value <= 0;
    	end
    end
    
  end
  
  
endmodule

