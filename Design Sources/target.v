`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 11:19:24 PM
// Design Name: 
// Module Name: target
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


module target(
    input [35:0] keys_code,
    output reg [35:0] target_key
    );
    
    // I think at change in state, target key should be set to 0
    // at change in keys_code target_key = keys_code unless keys_code = 0
    
    // always @(*) if (keys_code != 36'd0) target_key <= keys_code; else target_key <= target_key;
    always @(*) begin 
    if (keys_code == 36'h000000000) begin 
        target_key <= target_key; end
    else begin target_key <= keys_code; end
    end

endmodule
