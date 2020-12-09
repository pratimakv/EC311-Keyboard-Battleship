`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 09:35:44 AM
// Design Name: 
// Module Name: displays_and_keyboard
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


module displays_and_keyboard(
    input start,
    input p1place, p2place,
    input p1fire, p2fire,
    input p1hit, p1miss, p2hit, p2miss,
    input p1wins, p2wins,
    output reg [35:0] keys_code,
    // output [15:0] leds,
    input Enter,
    
    output [7:0] anode,
    output [7:0] cathode,
    
    input clk,
    output Hsynq, 
    output Vsynq,
    output [3:0] Red, 
    output [3:0] Green,
    output [3:0] Blue,
    
    // input reset,
    input ps2d,
    input ps2c,
    output UART_TXD,
    input reset
    );
    // wire [35:0] keys_code;
    
    wire [7:0] short_code; wire [35:0] temp_keys_code; wire clk_key;
    top_key_demo tkd(.CLK100MHZ(clk), .PS2_CLK(ps2c), .PS2_DATA(ps2d), .UART_TXD(UART_TXD), .short_code(short_code), .reset(reset));
    scan_to_keys stk(.short_code(short_code), .keys_code(temp_keys_code));
    clock_divide key_clk(.clk(clk), .div_clk(clk_key), .upto(12500000));
    // assign leds = keys_code[15:0];
    
    // change this back to clock, I don't know how to do reset
    always @(posedge clk_key) begin
        keys_code = temp_keys_code;
        
    end
    
    ssd_letters sl(.clk(clk), .p1place(p1place), .p2place(p2place), .p1fire(p1fire), .p2fire(p2fire), .cathode(cathode), .anode(anode));
    
    wire [5:0] screen;
    inputs_to_screennum i2s(.p1fire(p1fire), .p2fire(p2fire),.p1hit(p1hit), .p2hit(p2hit), .p1miss(p1miss), .p2miss(p2miss), .p1wins(p1wins), .p2wins(p2wins), .start(start), .screen(screen));
    
    top_vga tv(.clk(clk), .Hsynq(Hsynq), .Vsynq(Vsynq), .Red(Red), .Green(Green), .Blue(Blue), .screen(screen));
    
    
endmodule
