`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 12:05:32 PM
// Design Name: 
// Module Name: top_key_demo
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


module top_key_demo(
    input CLK100MHZ,
    input PS2_CLK,
    input PS2_DATA,
    // output [6:0]SEG,
    // output [7:0]AN,
    // output DP,
    output UART_TXD,
    output [7:0] short_code,
    input reset
    );
    
reg CLK50MHZ=0;    
wire [31:0]keycode;

always @(posedge(CLK100MHZ))begin
    CLK50MHZ<=~CLK50MHZ;
end

PS2Receiver keyboard (
.clk(CLK50MHZ),
.kclk(PS2_CLK),
.kdata(PS2_DATA),
.keycodeout(keycode[31:0]),
.reset(reset)
);

// wire [7:0] short_code;
assign short_code = keycode[7:0];
/*
    always @(posedge CLK100MHZ) begin
        if (~reset) begin
            short_code = 8'd0;
        end else begin
            short_code = keycode[7:0];
        end
    end */
/*
seg7decimal sevenSeg (
.x(keycode[31:0]),
.clk(CLK100MHZ),
.seg(SEG[6:0]),
.an(AN[7:0]),
.dp(DP) 
);
*/ 
endmodule
