`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 10:19:45 AM
// Design Name: 
// Module Name: top_vga
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

// 444 good for gray, 333
// f70 orange, f54
// 0ac for blue, 0af
// need to change vertical number calculations

module top_vga(
  input clk,
  output Hsynq, 
  output Vsynq,
  output reg [3:0] Red, 
  output reg [3:0] Green,
  output reg [3:0] Blue,
  input [5:0] screen
  // input [3:0] r,
  // input [3:0] g,
  // input [3:0] b
  );
  
  wire clk_25M;
  wire enable_V_Counter;
  wire [15:0] H_Counter_Value;
  wire [15:0] V_Counter_Value;
  
  vga_clock_divider vcd(.clk(clk), .divided_clk(clk_25M));
  
  horizontal_counter hc(.clk_25MHz(clk_25M), .H_Counter_Value(H_Counter_Value), .enable_V_Counter(enable_V_Counter));
  
  vertical_counter vc(.clk_25MHz(clk_25M), .V_Counter_Value(V_Counter_Value), .enable_V_Counter(enable_V_Counter));
  
  assign Hsynq = (H_Counter_Value < 96) ? 1'b1 : 1'b0;
  assign Vsynq = (V_Counter_Value < 2) ? 1'b1 : 1'b0;
  
  /*
  assign Red = (H_Counter_Value < 784 && H_Counter_Value >143 && V_Counter_Value <515 && V_Counter_Value > 34) ? r : 4'h0;

  assign Green = (H_Counter_Value < 784 && H_Counter_Value >143 && V_Counter_Value <515 && V_Counter_Value > 34) ? g : 4'h0;

  assign Blue = (H_Counter_Value < 784 && H_Counter_Value >143 && V_Counter_Value <515 && V_Counter_Value > 34) ? b : 4'h0;
  */
  wire [3:0] r_h, g_h, b_h;
  display_H dH(.H_Counter_Value(H_Counter_Value), .V_Counter_Value(V_Counter_Value), .Red(r_h), .Green(g_h), .Blue(b_h));
  wire [3:0] r_m, g_m, b_m;
  display_M dM(.H_Counter_Value(H_Counter_Value), .V_Counter_Value(V_Counter_Value), .Red(r_m), .Green(g_m), .Blue(b_m));
  wire [3:0] r_s, g_s, b_s;
  display_start ds(.H_Counter_Value(H_Counter_Value), .V_Counter_Value(V_Counter_Value), .Red(r_s), .Green(g_s), .Blue(b_s));
  
  wire [3:0] r_p1, g_p1, b_p1;
  p1_wins p1w(.H_Counter_Value(H_Counter_Value), .V_Counter_Value(V_Counter_Value), .Red(r_p1), .Green(g_p1), .Blue(b_p1));
  wire [3:0] r_p2, g_p2, b_p2;
  p2_wins p2w(.H_Counter_Value(H_Counter_Value), .V_Counter_Value(V_Counter_Value), .Red(r_p2), .Green(g_p2), .Blue(b_p2));
  
  wire [3:0] r_d, g_d, b_d;
  default_screen defs(.H_Counter_Value(H_Counter_Value), .V_Counter_Value(V_Counter_Value), .Red(r_d), .Green(g_d), .Blue(b_d));
  /*
  always @(*) begin
    if (!(H_Counter_Value < 784 && H_Counter_Value >143 && V_Counter_Value <515 && V_Counter_Value > 34)) begin
        Red = 4'h0; Blue = 4'h0; Green = 4'h0;
    end else if (H_Counter_Value < 272 && V_Counter_Value < 131) begin
        Red = r;
        Blue = b;
        Green = g; 
    end else begin
        Red = 4'h0; Blue = 4'h0; Green = 4'h0;
    end
  end
  */
  
  always @(*) begin
    case (screen)
    1: begin Red = r_s; Green = g_s; Blue = b_s; end
    2: begin Red = r_h; Green = g_h; Blue = b_h; end 
    4: begin Red = r_m; Green = g_m; Blue = b_m; end
    8: begin Red = r_p1; Green = g_p1; Blue = b_p1; end
    16: begin Red = r_p2; Green = g_p2; Blue = b_p2; end
    32: begin Red = r_d; Green = g_d; Blue = b_d; end
    default: begin Red = r_d; Green = g_d; Blue = b_d; end
    endcase  
  end
  
endmodule
