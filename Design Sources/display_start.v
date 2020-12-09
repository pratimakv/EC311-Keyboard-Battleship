`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 06:05:29 PM
// Design Name: 
// Module Name: display_start
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


module display_start(
    input [15:0] H_Counter_Value,
    input [15:0] V_Counter_Value,
    output reg [3:0] Red,
    output reg [3:0] Green,
    output reg [3:0] Blue
    );
    
    always @(*) begin
        if (!(H_Counter_Value < 784 && H_Counter_Value >143 && V_Counter_Value <515 && V_Counter_Value > 34)) begin
            Red = 4'h0; Blue = 4'h0; Green = 4'h0;
        end else if (H_Counter_Value < 240 || H_Counter_Value > 688 || V_Counter_Value < 195 || V_Counter_Value > 355) begin
            // make white
            Red = 4'hd;
            Green = 4'hd;
            Blue = 4'hd;
        end else if (V_Counter_Value < 227) begin
            if (H_Counter_Value < 496 && H_Counter_Value > 400) begin
                // make gray1
                Red = 4'h6;
                Green = 4'h6;
                Blue = 4'h6;
            end else begin
                // make white
                Red = 4'hd;
                Green = 4'hd;
                Blue = 4'hd;
            end
        end else if (V_Counter_Value < 259) begin
            if (H_Counter_Value < 560 && H_Counter_Value > 400) begin
                // make gray1
                Red = 4'h6;
                Green = 4'h6;
                Blue = 4'h6;
            end else begin
                // make white
                Red = 4'hd;
                Green = 4'hd;
                Blue = 4'hd;
            end
        end else if (V_Counter_Value < 275) begin
            if (H_Counter_Value < 560 && H_Counter_Value > 368) begin
                // make gray2
                Red = 4'h3;
                Green = 4'h3;
                Blue = 4'h3;
            end else begin
                // make white
                Red = 4'hd;
                Green = 4'hd;
                Blue = 4'hd;
            end
        end else if (V_Counter_Value < 291) begin
            if (H_Counter_Value < 624 && H_Counter_Value > 368) begin
                // make gray2
                Red = 4'h3;
                Green = 4'h3;
                Blue = 4'h3;
            end else begin
                // make white
                Red = 4'hd;
                Green = 4'hd;
                Blue = 4'hd;
            end
        end else begin
            if ((H_Counter_Value < (834 - V_Counter_Value/2)) && (H_Counter_Value > (95 + V_Counter_Value/2))) begin
                // make black
                Red = 4'h0;
                Green = 4'h0;
                Blue = 4'h0;
            end else begin
                // make white
                Red = 4'hd;
                Green = 4'hd;
                Blue = 4'hd;
            end 
        end
    end
endmodule
