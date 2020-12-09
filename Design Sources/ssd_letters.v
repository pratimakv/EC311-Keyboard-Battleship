`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 01:55:41 PM
// Design Name: 
// Module Name: ssd_letters
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


module ssd_letters( 
    input wire clk,
    //input wire player_place, and player fire
    input wire p1fire,
    input wire p2fire,
    input wire p1place,
    input wire p2place,
    output wire [7:0] cathode,
    output wire [7:0] anode
    );
    
    wire [2:0] refreshcounter;
    wire refreshclock;
    
    
    clk_div #(49999) refreshclock_generator(.clk(clk),.slow_clk(refreshclock));
    
    refreshcounter ref_cou(.refresh_clock(refreshclock),.refreshcounter(refreshcounter));
    
    anode_control ano(.refreshcounter(refreshcounter),.anode(anode));    
    
    cathode_turn cat(.refreshcounter(refreshcounter),.p1fire(p1fire),.p2fire(p2fire),.p1place(p1place),.p2place(p2place),.cathode(cathode));
    
    
endmodule

