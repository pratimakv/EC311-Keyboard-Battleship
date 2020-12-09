`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 05:35:16 PM
// Design Name: 
// Module Name: can_i_fire
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


module can_i_fire(
    input clk,
    input reset,
    input [2:0] state,
    output reg p1fire,
    output reg p2fire,
    output reg taking_turns
    );
    
    always @(posedge clk or negedge reset) begin
        if (~reset) begin
            taking_turns <= 0;
            p1fire <= 0;
            p2fire <= 0;
        end else begin  
            if (state == 3 | state == 4) taking_turns <= 1; else taking_turns <= 0;
            if (state == 3) p1fire <= 1; else p1fire <= 0;
            if (state == 4) p2fire <= 1; else p2fire <= 0;
        end
    end
endmodule
