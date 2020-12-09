`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 01:42:11 PM
// Design Name: 
// Module Name: scan_to_keys
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


module scan_to_keys(
    input [7:0] short_code,
    output reg [35:0] keys_code,
    output reg Enter
    );
    
    always @(*) begin
        
    case (short_code)
    8'h45: begin keys_code = 36'h000000001; Enter = 0; end // 0
    8'h16: begin keys_code = 36'h000000002; Enter = 0; end // 1
    8'h1e: begin keys_code = 36'h000000004; Enter = 0; end // 2
    8'h26: begin keys_code = 36'h000000008; Enter = 0; end // 3
    8'h25: begin keys_code = 36'h000000010; Enter = 0; end // 4
    8'h2e: begin keys_code = 36'h000000020; Enter = 0; end // 5
    8'h36: begin keys_code = 36'h000000040; Enter = 0; end // 6
    8'h3d: begin keys_code = 36'h000000080; Enter = 0; end // 7
    8'h3e: begin keys_code = 36'h000000100; Enter = 0; end // 8
    8'h46: begin keys_code = 36'h000000200; Enter = 0; end // 9
    8'h1c: begin keys_code = 36'h000000400; Enter = 0; end // a
    8'h32: begin keys_code = 36'h000000800; Enter = 0; end // b
    8'h21: begin keys_code = 36'h000001000; Enter = 0; end // c
    8'h23: begin keys_code = 36'h000002000; Enter = 0; end // d
    8'h24: begin keys_code = 36'h000004000; Enter = 0; end // e
    8'h2b: begin keys_code = 36'h000008000; Enter = 0; end // f
    8'h34: begin keys_code = 36'h000010000; Enter = 0; end // g
    8'h33: begin keys_code = 36'h000020000; Enter = 0; end // h
    8'h43: begin keys_code = 36'h000040000; Enter = 0; end // i
    8'h3b: begin keys_code = 36'h000080000; Enter = 0; end // j
    8'h42: begin keys_code = 36'h000100000; Enter = 0; end // k
    8'h4b: begin keys_code = 36'h000200000; Enter = 0; end // l
    8'h3a: begin keys_code = 36'h000400000; Enter = 0; end // m
    8'h31: begin keys_code = 36'h000800000; Enter = 0; end // n
    8'h44: begin keys_code = 36'h001000000; Enter = 0; end // o
    8'h4d: begin keys_code = 36'h002000000; Enter = 0; end // p
    8'h34: begin keys_code = 36'h004000000; Enter = 0; end // q
    8'h2d: begin keys_code = 36'h008000000; Enter = 0; end // r
    8'h1b: begin keys_code = 36'h010000000; Enter = 0; end // s
    8'h2c: begin keys_code = 36'h020000000; Enter = 0; end // t
    8'h3c: begin keys_code = 36'h040000000; Enter = 0; end // u
    8'h2a: begin keys_code = 36'h080000000; Enter = 0; end // v
    8'h1d: begin keys_code = 36'h100000000; Enter = 0; end // w
    8'h22: begin keys_code = 36'h200000000; Enter = 0; end // x
    8'h35: begin keys_code = 36'h400000000; Enter = 0; end // y
    8'h1a: begin keys_code = 36'h800000000; Enter = 0; end // z
    8'h5a: begin keys_code = 36'd0; Enter = 1; end 
    default: begin keys_code = 36'd0; Enter = 0; end 
    
    endcase
        
    end
endmodule
