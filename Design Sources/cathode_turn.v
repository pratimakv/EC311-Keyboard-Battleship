`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 02:32:24 PM
// Design Name: 
// Module Name: cathode_turn
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


module cathode_turn(
    input [2:0] refreshcounter,
    input p1fire,
    input p2fire,
    input p1place,
    input p2place,
    output reg[7:0] cathode = 0
    );
    
    always@(refreshcounter)begin
    
    if(p1place == 1)begin
    
    
        case(refreshcounter) //starting from right to left
            3'b000:
            cathode = 8'b10010010; // s
            3'b001:
            cathode = 8'b10000110; // e
            3'b010:
            cathode = 8'b11000110; // c
            3'b011:
            cathode = 8'b10001000; // a
            3'b100:
            cathode = 8'b11000111; // l
            3'b101:
            cathode = 8'b10001100; // P
            3'b110:
            cathode = 8'b11111001; //1
            3'b111:
            cathode = 8'b10001100;  //P
        endcase
    end
    
    else if (p2place == 1)begin 
        case(refreshcounter) //starting from right to left
            3'b000:
            cathode = 8'b10010010; // s
            3'b001:
            cathode = 8'b10000110; // e
            3'b010:
            cathode = 8'b11000110; // c
            3'b011:
            cathode = 8'b10001000; // a
            3'b100:
            cathode = 8'b11000111; // l
            3'b101:
            cathode = 8'b10001100; // P
            3'b110:
            cathode = 8'b10100100; //2
            3'b111:
            cathode = 8'b10001100;  //P
        endcase
    end
    
    else if(p1fire ==1)begin
        case(refreshcounter) //starting from right to left
            3'b000:
            cathode = 8'b10101011; // n
            3'b001:
            cathode = 8'b10101111; // r
            3'b010:
            cathode = 8'b11100011; // u
            3'b011:
            cathode = 8'b10000111; // t
            3'b100:
            cathode = 8'b10010010; // s
            3'b101:
            cathode = 8'b11111101; // '
            3'b110:
            cathode = 8'b11111001; //1
            3'b111:
            cathode = 8'b10001100;  //P
        endcase
    end
    
    else if(p2fire ==1)begin
        case(refreshcounter) //starting from right to left
            3'b000:
            cathode = 8'b10101011; // n
            3'b001:
            cathode = 8'b10101111; // r
            3'b010:
            cathode = 8'b11100011; // u
            3'b011:
            cathode = 8'b10000111; // t
            3'b100:
            cathode = 8'b10010010; // s
            3'b101:
            cathode = 8'b11111101; // '
            3'b110:
            cathode = 8'b10100100; //2
            3'b111:
            cathode = 8'b10001100;  //P
        endcase
    end
    
    else begin
        case(refreshcounter) //starting from right to left
            3'b000:
            cathode = 8'b10001100; // p
            3'b001:
            cathode = 8'b11111001; // i
            3'b010:
            cathode = 8'b10001001; // h
            3'b011:
            cathode = 8'b10010010; // s
            3'b100:
            cathode = 8'b10000011; // B
            3'b101:
            cathode = 8'b11111111; // blank
            3'b110:
            cathode = 8'b11111111; // nothingness
            3'b111:
            cathode = 8'b11111111;  // empty
        endcase
    end
    
   
       
    end

endmodule


