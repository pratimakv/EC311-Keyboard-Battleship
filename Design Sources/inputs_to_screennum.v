`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 10:13:11 AM
// Design Name: 
// Module Name: inputs_to_screennum
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


module inputs_to_screennum(
    input p1fire, p2fire,
    input p1hit,p2hit,p1miss,p2miss,
    input p1wins, p2wins,
    input start,
    output reg [5:0] screen
    );
    
    always @(*) begin
        if (p1wins) begin
            screen = 6'd8;
        end else if (p2wins) begin
            screen = 6'd16;
        end else if (start) begin
            screen = 6'd1;
        end else if (p1fire) begin
            if (p2hit) begin
                screen = 6'd2; end
            else if (p2miss) begin
                screen = 6'd4;
            end
            else begin
                screen = 6'd32;
            end
        end else if (p2fire) begin
            if (p1hit) begin
                screen = 6'd2;
            end else if (p1miss) begin
                screen = 6'd4;
            end
            else begin
                screen = 6'd32;
            end
        
        end else begin
            screen = 6'd32;
        end 
    end
        
    
endmodule
