`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:11:30 PM
// Design Name: 
// Module Name: p1_wins
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


module p1_wins(
    input [15:0] H_Counter_Value,
    input [15:0] V_Counter_Value,
    output reg [3:0] Red,
    output reg [3:0] Green,
    output reg [3:0] Blue
    );
    
    always @(*) begin
        if (!(H_Counter_Value < 784 && H_Counter_Value >143 && V_Counter_Value <515 && V_Counter_Value > 34)) begin
            Red = 4'h0; Blue = 4'h0; Green = 4'h0;
        end else if (H_Counter_Value < 208 || H_Counter_Value > 688 || V_Counter_Value < 99 || V_Counter_Value > 451 || (H_Counter_Value > 400 && H_Counter_Value < 464) || (H_Counter_Value >= 560 && H_Counter_Value < 624)) begin
            // gray
            Red = 4'h3;
            Green = 4'h3;
            Blue = 4'h3;
        end else if (H_Counter_Value < 272 || (H_Counter_Value > 496 && H_Counter_Value < 560)) begin
            // green
            Red = 4'h0;
            Green = 4'hf;
            Blue = 4'h0;
        end else if (H_Counter_Value < 336) begin
            // changed these values for better P
            if (V_Counter_Value < 163 || (V_Counter_Value > 215 && V_Counter_Value < 279)) begin
                // green
                Red = 4'h0;
                Green = 4'hf;
                Blue = 4'h0;
            end else begin
                // gray
                Red = 4'h3;
                Green = 4'h3;
                Blue = 4'h3;
            end
        end else if (H_Counter_Value <= 400) begin
            if (V_Counter_Value < 279) begin
                // green
                Red = 4'h0;
                Green = 4'hf;
                Blue = 4'h0;
            end else begin
                // gray
                Red = 4'h3;
                Green = 4'h3;
                Blue = 4'h3;
            end
        end else if (H_Counter_Value <= 496) begin
            if (V_Counter_Value < 163) begin
                // green
                Red = 4'h0;
                Green = 4'hf;
                Blue = 4'h0;
            end else begin
                // gray
                Red = 4'h3;
                Green = 4'h3;
                Blue = 4'h3;
            end
        end else begin
            if (V_Counter_Value < 323 || V_Counter_Value > 387) begin
                // green
                Red = 4'h0;
                Green = 4'hf;
                Blue = 4'h0;
            end else begin
                // gray
                Red = 4'h3;
                Green = 4'h3;
                Blue = 4'h3;
            end
        end
    
    end
endmodule
