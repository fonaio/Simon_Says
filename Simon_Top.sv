`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// 
// Create Date: 07/01/2026 06:27:16 PM

// Module Name: Simon_Top
// Project Name: Simon_Says
// Description: Top level module for Simon says 
// 
//////////////////////////////////////////////////////////////////////////////////


module Simon_Top(
    input logic clk,
    input logic reset,
    input logic BTNL,
    input logic BTNC,
    input logic BTNR,
    
    output logic [2:0] led0_top, //LD 17
    output logic [2:0] led1_top //LD 16
    );
    
    //clock divider for Simon Talking
    logic clock_div;
    
    //game control
    logic [2:0] game_state;
    
    //pregame
    logic pregame_start;
    logic [2:0] pregame_led0;
    logic [2:0] pregame_led1;
    
    //user_pressing
    logic raw_press;
    logic [2:0] raw_selected_button;
    logic press_pulse;
    logic [2:0] selected_button;
    
    //LED_Randomizer
    logic [1:0] randout;
    logic seeden;
    
    
    clk_divider u_divider (
    .clk(clk),
    .reset(reset),
    .clock_div(clock_div)
    );
    
    Game_Control u_game_control (
    .clk(clk),
    .reset(reset),
    .start(pregame_start),
    .level_pass(),
    .sequence_done(),
    .press_made(press_pulse),
    .press_correct(),
    .round_complete(),
    .current_state(game_state)
    );
    
    Pregame u_pregame (
    .start_button(BTNC),
    .start(pregame_start),
    .led0(pregame_led0),
    .led1(pregame_led1)
    );
    
    User_Pressing u_pressing (
    .clk(clk),
    .reset(reset),
    .raw_press(raw_press),
    .raw_selected_button(raw_selected_button),
    .press_pulse(press_pulse),
    .selected_button(selected_button)
    );
    
    Led_Randomizer u_randomizer(
    .clk(clk),
    .reset(reset),
    .seed_en(seed_en)
    );
    
    always_comb begin
        led0_top = 3'b000;
        led1_top = 3'b000;
        raw_press = 1'b0;
        raw_selected_button = 3'b000;
        
        if (game_state == 3'b000) begin //pregame
            led0_top = pregame_led0;
            led1_top = pregame_led1;
        end
        else begin
            led0_top = 3'b000;
            led1_top = 3'b000;
        end
        
        if(game_state == 3'b010) begin //user pressing 
            raw_press = BTNL || BTNC || BTNR;
            if (raw_press) begin
                if (BTNL) begin
                    raw_selected_button = 3'b100;
                end
                else if (BTNC) begin
                    raw_selected_button = 3'b010;
                end
                else if (BTNR) begin
                    raw_selected_button = 3'b001;
                end
            end
        end
        
    end
    
endmodule
