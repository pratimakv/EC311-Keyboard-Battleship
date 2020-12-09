`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 08:05:38 AM
// Design Name: 
// Module Name: can_i_fire_tb
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


module can_i_fire_tb(

    );
    
    reg clk;
    reg reset;
    reg [2:0] state;
    wire p1fire;
    wire p2fire;
    wire taking_turns;
    
    
    can_i_fire hello(clk,reset,state,p1fire,p2fire,taking_turns);
    
    always
    #1 clk = ~clk;
    
    initial begin
    reset = 1; clk = 0; state = 0;
    #1 reset = 0;
    #1 reset = 1;
    end
    
    initial begin
    
    #10 state = 3;
    #10 state = 4;
    #10 state = 3;
    #10 state = 2;
    #10 state = 5;
    #10 state = 6;
    #10 state = 4;
    #10 state = 3;
    #10 state = 4;
    $finish;
     end
    
    
    
endmodule
