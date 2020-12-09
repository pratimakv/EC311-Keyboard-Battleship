`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 12/01/2020 02:08:09 AM
// Design Name: 
// Module Name: find_one_hot_index
// Project Name: Keyboard Battleship 
// Description: Takes a 35-bit one-hot input and 
//              returns the index of the hot bit.
// 
//////////////////////////////////////////////////////////////////////////////////


module find_one_hot_index(
    input [35:0] number,
    output reg [5:0] index
    );
    
    integer i;
    
    always @(*) begin
        for (i = 0; i < 36; i = i + 1) begin
            if (number[i]) index <= i;
        end
    end
endmodule
