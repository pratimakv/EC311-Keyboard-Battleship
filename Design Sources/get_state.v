`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 08:46:10 PM
// Design Name: 
// Module Name: get_state
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


module get_state(
    input reset,
    //input start,
    input Enter,
    input taking_turns,
    input p1wins,
    input p2wins,
    input [35:0] p1ships,
    input [35:0] p2ships,
    output reg [2:0] state
    );
    
    // State encodings:
    // 0: Start screen
    // 1: Player 1 chooses ships
    // 2: Player 2 chooses ships
    // 3: Player 1 fires
    // 4: Player 2 fires
    // 5: Player 1 wins
    // 6: Player 2 wins
    
//    always @(posedge clk or negedge reset or Enter) begin
//        if (~reset) state <= 0;
//        else begin
//            if (Enter & ~taking_turns & ~p1wins & ~p2wins) state <= state + 1;
//            else if (p1wins | p2wins) state <= 3'd6;
//            else if (Enter & taking_turns) begin
//                if (state == 3) state <= 4;
//                if (state == 4) state <= 3;
//            end
//        end
//    end

    always @(posedge Enter or negedge reset) begin
        if (~reset) state <= 0;
        else begin
            if (Enter & ~taking_turns & ~p1wins & ~p2wins) state <= state + 1;
//            else if (Enter & p1wins) state <= 3'd5;
//            else if (Enter & p2wins) state <= 3'd6;
            if (p1ships == 0)
            state = 6;
            if (p2ships == 0)
            state = 5;
            else if (Enter & taking_turns) begin
                if (state == 2) state <= 3;
                else if (state == 3) state <= 4;
                else if (state == 4) state <= 3;
            end
        end
    end
endmodule
