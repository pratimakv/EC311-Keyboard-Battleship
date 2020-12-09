`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 08:13:26 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input CPU_RESETN,
    input PS2_DATA,
    input ps2c,
    output [7:0] AN,
    output [7:0] Cathode,
    output Hsynq, 
    output Vsynq,
    output [3:0] Red, 
    output [3:0] Green,
    output [3:0] Blue,
    output UART_TXD,
    // output reg start_led,
    // output reg enter_led,
    // output reg turns_led, p1place_l, p2place_l, p1hit_l, p2hit_l, p1miss_l, p2miss_l, p1fire_l, p2fire_l, p1wins_l, p2wins_l, 
    // output reg [2:0] state_l,
    //output reg [15:0] newp1ships_l,
    input BTNC
    );
    wire Enter;// High when ENTER key is pressed
    debouncer ENT(clk,BTNC,Enter);
    
    wire start;
    wire [35:0] newp1ships,newp2ships;     
    wire reset;
    wire p1fire,p2fire,taking_turns;
    wire [2:0] state;
    wire p1place,p2place;
    wire p1hit,p1miss,p2hit,p2miss;
    wire p1wins, p2wins;
    wire [35:0] target_key;
    /*
    always @* begin
//    start_led = start;
//    enter_led = Enter;
//    turns_led = taking_turns;
//    p1place_l = p1place;
//    p1hit_l = p1hit;
//    p1miss_l = p1miss;
//    p1fire_l = p1fire;
//    p2place_l = p2place;
//    p2hit_l = p2hit;
//    p2miss_l = p2miss;
//    p2fire_l = p2fire;
//    state_l = state;
//    p1wins_l = p1wins;
//    p2wins_l = p2wins;
    newp1ships_l[7:0] = newp1ships[7:0];
    newp1ships_l[15:8] = newp2ships[7:0];
    end 
    */
    
    
    ////// Debounce the reset button    //////
    debouncer RES(clk,CPU_RESETN,reset);
    
    ////// Initialize the game  ///////
    start_screen STARTGAME(reset,Enter,start);
    
    
    // changed keys_code to wire
    wire [35:0] keys_code;
    reg p1_choose_ships, p2_choose_ships;
    
    
    ////// Translate data from the keyboard //////
    ////// into usable registers            //////
    // keyboard_decoder Player1Ships(PS2_DATA,keys_code);
    // declaring all needed wires
    wire Enter1;
    displays_and_keyboard dk(.start(start), .p1place(p1place), .p2place(p2place), .p1fire(p1fire), .p2fire(p2fire), .p1hit(p1hit), .p1miss(p1miss), 
    .p2hit(p2hit), .p2miss(p2miss), .p1wins(p1wins), .p2wins(p2wins), .keys_code(keys_code), .Enter(Enter), .anode(AN), .cathode(Cathode), .clk(clk),
    .Hsynq(Hsynq), .Vsynq(Vsynq), .Red(Red), .Green(Green), .Blue(Blue), .ps2d(PS2_DATA), .ps2c(ps2c), .UART_TXD(UART_TXD), .reset(reset));
    
    ////// Direct each module using states //////
    get_state STT(reset,Enter,taking_turns,p1wins,p2wins,newp1ships, newp2ships, state);

    ////// Send signal to place ships ////////
    // wire p1place,p2place;
    can_i_place PLACE(state,p1place,p2place);
    
    
    ////// Create ship locations register ///////
    wire [35:0] p1ships, p2ships;
    set_ships P1SHIPS(clk,reset,p1place,target_key,p1ships);
    set_ships P2SHIPS(clk,reset,p2place,target_key,p2ships);
    
    ////// Send signal to make moves ///////
    can_i_fire FIRE(clk,reset,state,p1fire,p2fire,taking_turns);

    ////// Identify the target key //////
    // wire [35:0] target_key;
    target TGT(keys_code,target_key);
    
    ////// Determine a hit or miss for each player ///////
    ////// Track which ships have been hit so far  ///////
    
    // wire p1hit,p1miss,p2hit,p2miss;
    hit_or_miss P1TURN(clk,reset,p2place,p1fire,target_key,p2ships,p1hit,p1miss,newp2ships);
    hit_or_miss P2TURN(clk,reset,p1place,p2fire,target_key,p1ships,p2hit,p2miss,newp1ships);
    
    
    ////// Determine a winner ///////
    // wire p1wins, p2wins;
    who_wins WIN(clk,state,p1wins,p2wins);
    
endmodule
