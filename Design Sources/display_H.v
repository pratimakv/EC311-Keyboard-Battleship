`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:48:43 AM
// Design Name: 
// Module Name: display_H
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


module display_H(
    input [15:0] H_Counter_Value,
    input [15:0] V_Counter_Value,
    output reg [3:0] Red,
    output reg [3:0] Green,
    output reg [3:0] Blue
    );
    
    // reg dark;
    
    always @(*) begin
        if (!(H_Counter_Value < 784 && H_Counter_Value >143 && V_Counter_Value <515 && V_Counter_Value > 34)) begin
            Red = 4'h0; Blue = 4'h0; Green = 4'h0;
        end else if (H_Counter_Value < 304 || H_Counter_Value > 624 || V_Counter_Value < 83 || V_Counter_Value > 467) begin
            // make gray
            Red = 4'h3;
            Green = 4'h3;
            Blue = 4'h3;
        end else if (H_Counter_Value < 400 || H_Counter_Value > 528) begin
            // make orange
            Red = 4'hf;
            Green = 4'h5;
            Blue = 4'h4;
        end else begin
            if (V_Counter_Value < 307 && V_Counter_Value > 243) begin
                // make orange
                Red = 4'hf;
                Green = 4'h5;
                Blue = 4'h4;
            end
            else begin
                // make gray
                Red = 4'h3;
                Green = 4'h3;
                Blue = 4'h3;
            end
        end
    end
  
endmodule
