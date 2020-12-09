`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 05:42:02 PM
// Design Name: 
// Module Name: who_wins
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


module who_wins(
    input clk,

 
    input [2:0]state,
    output reg p1wins,
    output reg p2wins
    );
    
  initial begin
       
            p1wins <= 0;
            p2wins <= 0;
            end
  always @(posedge clk) begin
            if (state == 6) p2wins <= 1;
            else p2wins = 0;
            
            if (state == 5) p1wins <= 1;
            else p1wins = 0;
        end

endmodule
