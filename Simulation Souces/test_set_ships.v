`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 12/03/2020 05:35:49 PM
// Design Name: 
// Module Name: test_set_ships
//////////////////////////////////////////////////////////////////////////////////


module test_set_ships();
    reg clk = 0;
    reg reset = 0;
    reg place = 0;
    reg [35:0] pressed_key = 0;
    wire [35:0] ships;
    
    set_ships UUT(clk,reset,place,pressed_key,ships);
    
    always #1 clk = ~clk;
    
    initial begin
        #5 reset <= 1;
        #5 place <= 1; pressed_key = 36'b000000000000000000000000000000000001;
        #10 pressed_key = 36'b000000000000000000000000000000001000;
        #10 pressed_key = 36'b100000000000000000000000000000000000;
        #10 place <= 0;
        #10 pressed_key = 36'b000000000001000000000000000000000000;
        #10 $finish;
    end
endmodule
