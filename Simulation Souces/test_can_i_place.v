`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 05:44:18 PM
// Design Name: 
// Module Name: test_can_i_place
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


module test_can_i_place();
    reg [2:0] state = 0;
    wire p1place,p2place;
    
    can_i_place UUT(state,p1place,p2place);
    
    initial begin
    #10 state = state + 1;
    #10 state = state + 1;
    #10 state = state + 1;
    #10 state = state + 1;
    #10 $finish;
    end
endmodule
