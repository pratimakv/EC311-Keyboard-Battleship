`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 07:24:35 PM
// Design Name: 
// Module Name: clk_div
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


module clk_div #(parameter period = 1)( // make period global
input clk,
output reg slow_clk = 0
    );
    integer counter = 0;
    always @(posedge clk)
    begin
        if (counter == period)
            slow_clk <= ~slow_clk;
        else 
            slow_clk <= slow_clk;
        end
        
    always @(posedge clk)
        begin
            if (counter == period)
            counter <= 0;
            else
            counter <= counter + 1;            
        end

endmodule

