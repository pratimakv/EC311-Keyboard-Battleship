`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 11:21:41 PM
// Design Name: 
// Module Name: test_target
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


module test_target();
    reg [35:0] keys_code = 0;
    wire [35:0] target_key;
    
    target TGT(keys_code,target_key);
    
    initial begin
        #5 keys_code = 36'b000000000000000000000000000000000001;
        #5 keys_code = 36'b000000000000000000000000000000000000;
        #5 keys_code = 36'b100000000000000000000000000000000000;
        #5 keys_code = 36'b000000000000000000000000000000000000;
    end
endmodule
