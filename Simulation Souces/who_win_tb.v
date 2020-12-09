`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 05:00:32 PM
// Design Name: 
// Module Name: who_win_tb
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


module who_win_tb(

    );
    
    reg clk = 0;
    reg reset;
    reg taking_turns = 0;
    reg [35:0] p1ships;
    reg [35:0] p2ships;
    wire p1wins;
    wire p2wins;
   
   who_wins UUT(clk,reset,taking_turns,p1ships,p2ships,p1wins,p2wins);
   
//    initial begin
//    clk = 0; reset = 1; p1ships = 36'b000000000000000000000000000000000001;  p2ships = 36'b000000000000000000000000000000000001;;
//    end
    always #1 clk = ~clk;
    
    initial begin
    #5 reset = 0;
    #5 reset = 1;
    #10 p1ships = 36'b000000000000000000000000000000000000;
        p2ships = 36'b000000000000000000000000000000000001;
    #5 reset = 0; 
    #5 reset = 1;
    #10 p1ships = 36'b000000000000000000000000000000000001;
   p2ships = 36'b000000000000000000000000000000000000;
  
    end
     
    

    
    
     
    initial 
    #300 $finish;
    
     
    
    
    always #1 clk = ~clk; 
    
    
endmodule
