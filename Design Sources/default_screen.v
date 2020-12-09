`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 10:22:06 AM
// Design Name: 
// Module Name: default_screen
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


module default_screen(
    input [15:0] H_Counter_Value,
    input [15:0] V_Counter_Value,
    output reg [3:0] Red,
    output reg [3:0] Green,
    output reg [3:0] Blue
    );
    
    always @(*) begin
        if (!(H_Counter_Value < 784 && H_Counter_Value >143 && V_Counter_Value <515 && V_Counter_Value > 34)) begin
            Red = 4'h0; Blue = 4'h0; Green = 4'h0;
        end
        else begin
            Red = 4'hc; Blue = 4'h0; Green = 4'h0;
        end
    end
endmodule
