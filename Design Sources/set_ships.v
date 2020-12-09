`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/01/2020 02:05:08 AM
// Design Name: 
// Module Name: set_ships
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


module set_ships(
    input clk,
    input reset,
    input place,
    input [35:0] pressed_key,
    output reg [35:0] ships
    );
    
    wire [5:0] index;
    find_one_hot_index IDX(pressed_key,index);
    
    always @(posedge clk or negedge reset) begin
        if (~reset) ships <= 0;
        else if (place) ships[index] <= 1;
    end

endmodule
