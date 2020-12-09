`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 07:46:22 PM
// Design Name: 
// Module Name: vga_clock_divider
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


module vga_clock_divider(
  input clk,
  output reg divided_clk = 0);
  
  integer counter = 0;
  
  always @(posedge clk) begin
    if (counter == 1) begin
      counter <= 0; end
    else begin
      counter <= counter + 1;
    end 
    
  end
  
  always @(posedge clk) begin
    if (counter == 1) begin
      divided_clk <= ~divided_clk;
    end
  end
  
endmodule
