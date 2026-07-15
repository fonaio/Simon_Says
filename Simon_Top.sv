`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2026 01:43:20 AM
// Design Name: 
// Module Name: Simon_Top
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


module Simon_Top(
    input logic clk,
    input logic reset,
    input logic BTNC,
    
    output led0_top, //LD 17
    output led1_top //LD 16
    );
    
    logic [2:0] game_state;
    logic pregame_start;
    logic [2:0] pregame_led0;
    logic [2:0] pregame_led1;
    
    Game_Control u_game_control (
    .clk(clk),
    .reset(reset),
    .start(pregame_start),
    .
    
    )
    
    Pregame u_pregame (
    .start_button(BTNC)
    .start(pregame_start)
    .led0(pregame_led0)
    .led1(pregame_led1)
    )
    
    always_comb begin
        if (game_state == 3'b000) begin
            led0_top = pregame_led0;
            led1_top = pregame_led1;
        end
        else begin
            led0_top = 3'b000;
            led1_top = 3'b000;
        end
    end
    
    module Pregame 
endmodule
