`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 11:02:59 PM
// Design Name: 
// Module Name: test_hit_or_miss
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


module test_hit_or_miss();
    reg clk = 0;
    reg reset = 0;
    reg place = 0;
    reg fire = 0;
    reg [35:0] target_key = 36'b000000000000000000000000000000000000;
    //reg [35:0] original_enemy_ships = 36'b100000000000000000000000000000000001;
    reg [35:0] enemy_ships = 36'b100100000000000000000000000000000001;
    reg [2:0] state = 0;
    wire hit,miss;
    wire [35:0] new_enemy_ships;
    
    hit_or_miss UUT(clk,reset,place,fire,target_key,enemy_ships,state,hit,miss,new_enemy_ships);
    
    always #1 clk = ~clk;
    
    initial begin
        #5 reset = 1; place = 1; state = 1;
        #10 place = 0; fire = 1; state = 3;
        #10 target_key = 36'b0000000000000000000000000000000000010;  //  Should miss
        #10 fire = 0; state = 4;
        #10 fire = 1; state = 3; target_key = 36'b000000000000000000000000000000000001;  // Should hit
        #10 fire = 0; state = 4;
        #10 fire = 1; state = 3; target_key = 36'b100000000000000000000000000000000000;  // Should hit
        #10 fire = 0; state = 4;
        #10 fire = 1; state = 3; target_key = 36'b000000000010000000000000000000000000;  // Should miss
        #10 fire = 0; state = 4;
        #10 fire = 1; state = 3; target_key = 36'b000100000000000000000000000000000000;  // Should hit and new_ships --> 0
        #10 fire = 0; state = 4;
        #10 $finish;
    end
endmodule
