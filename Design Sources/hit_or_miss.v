`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 12/01/2020 05:14:09 PM
// Design Name: 
// Module Name: hit_or_miss
//////////////////////////////////////////////////////////////////////////////////


module hit_or_miss(
    input clk,
    input reset,
    input place,
    input fire,
    input [35:0] target,
    input [35:0] enemy_ships,
  
    output reg hit,
    output reg miss,
    output reg [35:0] new_enemy_ships
    );
    
    //reg [35:0] ship_tracker;
    integer i;
    reg [35:0] hit_tracker = 0;
   
    /*always @(*)begin
        ship_tracker = new_enemy_ships;
    end    
    */
    always @(posedge clk /* negedge reset*/) begin
        if (~reset) begin
            hit <= 0;
            miss <= 0;
            new_enemy_ships <= 36'b111111111111111111111111111111111111;
        end
        else if (place)
            new_enemy_ships <= enemy_ships;
        else if (fire) begin
            // ship_tracker = new_enemy_ships;
            for (i = 0; i < 36; i = i + 1) begin
                if (target[i] && enemy_ships[i]) begin
                    new_enemy_ships[i] <= 0;
                    hit_tracker[i] <= 1;
                end else begin
                    hit_tracker[i] <= 0;
                    //new_enemy_ships[i] <= enemy_ships[i];
                end
            end
            if (hit_tracker > 0) hit <= 1; else hit <= 0;
            if (hit == 0) miss <= 1; else miss <= 0;
        end
        
    end
endmodule
