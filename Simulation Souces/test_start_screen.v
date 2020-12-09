`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 06:05:30 PM
// Design Name: 
// Module Name: test_start_screen
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


module test_start_screen(
    );
    
    reg Enter = 0;
    reg reset = 0;
    wire start;
    start_screen UUT(reset,Enter,start);
    
    initial begin
    #5 reset = 1;
    #5 Enter = 1;
    #5 Enter = 0;
    #5 Enter = 1;
    #5 Enter = 0;
    end
endmodule
