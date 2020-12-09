`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 04:57:39 PM
// Design Name: 
// Module Name: can_i_place
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


module can_i_place(
    input [2:0] state,
    output reg p1place,
    output reg p2place
    );
    
    always @(*) begin
        if (state == 1) p1place <= 1; else p1place <= 0;
        if (state == 2) p2place <= 1; else p2place <= 0;
    end
endmodule
