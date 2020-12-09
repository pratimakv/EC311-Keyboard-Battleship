`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 01:02:32 PM
// Design Name: 
// Module Name: display_M
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


module display_M(
    input [15:0] H_Counter_Value,
    input [15:0] V_Counter_Value,
    output reg [3:0] Red,
    output reg [3:0] Green,
    output reg [3:0] Blue
    );
    
    always @(*) begin
        if (!(H_Counter_Value < 784 && H_Counter_Value >143 && V_Counter_Value <515 && V_Counter_Value > 34)) begin
            Red = 4'h0; Blue = 4'h0; Green = 4'h0;
        end else if (H_Counter_Value < 304 || H_Counter_Value > 624 || V_Counter_Value < 83 || V_Counter_Value > 467) begin
            // make gray
            Red = 4'h3;
            Green = 4'h3;
            Blue = 4'h3;
        end else if (H_Counter_Value < 400 || H_Counter_Value > 528) begin
            // make blue
            Red = 4'h0;
            Green = 4'ha;
            Blue = 4'hf;
        end else if (H_Counter_Value < 464) begin
            
            if ( (H_Counter_Value < ((4*V_Counter_Value)/7 + 353) ) && (H_Counter_Value > ((4*V_Counter_Value)/7 + 252) ) ) begin
                // make blue
                Red = 4'h0;
                Green = 4'ha;
                Blue = 4'hf;
            end else begin
                // make gray
                Red = 4'h3;
                Green = 4'h3;
                Blue = 4'h3;
            end
        end else begin
            if ( (H_Counter_Value > (575 - (4*V_Counter_Value)/7) ) && (H_Counter_Value < (676 - (4*V_Counter_Value)/7) ) ) begin
                // make blue
                Red = 4'h0;
                Green = 4'ha;
                Blue = 4'hf;
            end else begin
                // make gray
                Red = 4'h3;
                Green = 4'h3;
                Blue = 4'h3;
            end
            
        
        end
        
    end
endmodule
