`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 06:03:57 PM
// Design Name: 
// Module Name: start_screen
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


module start_screen(
    input reset,
    input Enter,
    output reg start
    );
    
    
    always @(negedge reset or posedge Enter) begin
        if (~reset) start <= 1;
        else start <= 0;
    end
endmodule
