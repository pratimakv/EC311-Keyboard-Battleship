`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 05:48:30 PM
// Design Name: 
// Module Name: test_get_state
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


module test_get_state();
    reg clk = 0;
    reg reset = 0;
    //reg start = 1;
    reg Enter = 0;
    reg taking_turns = 0;
    reg p1wins = 0;
    reg p2wins = 0;
    wire [2:0] state;
    
    get_state UUT(reset,Enter,taking_turns,p1wins,p2wins,state);
    
    always #1 clk = ~clk;
    
    initial begin
    #1 reset = 1;   // Start screen
    #5 Enter = 1;    // Move to P1 chooses ships
    #1 Enter = 0;               // Stay in P1 choose ships
    #5 Enter = 1;               // Move to P2 chooses ships
    #1 Enter = 0;               // Stay in P2 chooses ships
    #5 Enter = 1; taking_turns = 1;     // P1 first turn
    #1 Enter = 0;               // P1 picking a target
    #5 Enter = 1;               // P1 fires, now it is P2 turn
    #1 Enter = 0;               // P2 choosing target
    #5 Enter = 1;
    #1 Enter = 0;
    #5 Enter = 1;
    #1 Enter = 0;
    #5 p2wins = 1; Enter = 1;   // P2 fires and wins
    #10 $finish;
    
    
    end
endmodule
