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
    output logic [2:0] led1_top, //LD 16
    output logic [2:0] simon_led
    );
    
    //game control
    logic [2:0] game_state;
    
    //pregame
    logic pregame_start;
    logic [2:0] pregame_led0;
    logic [2:0] pregame_led1;
    logic [4:0] curr_index;
    logic allow_write;
    
    //user_pressing
    logic raw_press;
    logic [2:0] raw_selected_button;
    logic press_pulse;
    logic [2:0] selected_button;
    
    //LED_Randomizer
    logic [1:0] randout;
    logic seeden;
    
    //Simon_Brain
    logic led_seq;
    
    //clock divider for Simon Talking
    logic clock_div;
    
    //Simon Talking
    logic current_level;
    
    //Checking_Input
    logic check_index;
    logic round_complete;
    logic press_status;
    
    clk_divider u_divider (
    .clk(clk),
    .reset(reset),
    .clock_div(clock_div)
    );
    
    Game_Control u_game_control (
    .clk(clk),
    .reset(reset),          
    .game_start(pregame_start),              //pregame
    .sequence_done(),                   //simon_talking
    .press_made(press_pulse),           //user_pressing
    .press_correct(press_correct),      //checking input
    .round_complete(round_complete),    //checking input
    .game_state(game_state)  
    );
    
    Pregame u_pregame (
    .clk(clk),
    .reset(reset),
    .start_button(BTNC),
    .curr_index(mem_index),
    .allow_write(allow_write),
    .pregame_start(pregame_start),
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
    
    LED_Randomizer u_randomizer(
    .clk(clk),
    .reset(reset),
    .seed_en(seed_en),
    .randout(randout)
    );
    
    Simon_Brain u_brain(
    .clk(clk),
    .reset(reset),
    .led_randomizer_value(randout),
    .allow_write(allow_write),
    .curr_index(curr_index),
    .led_sequence() //read array
    );
    
    Simon_Talking u_talking(
    //insert stuff here
    );
    
    Checking_Input u_checking(
    .clk(clk),
    .reset(reset),
    .selected_button(selected_button), //user pressing
    .press_pulse(press_pulse), //user pressing
    .led_sequence(led_seq),
    .current_level(current_level),
    .check_index(check_index),
    .round_complete(round_complete),
    .press_status(press_status)
    );
    
    game_over u_game_over(
    .clk(clk),
    .reset(reset),
    .game_state(game_state) //from game_controls
    );
    
    always_comb begin
        led0_top = 3'b000;
        led1_top = 3'b000;
        raw_press = 1'b0;
        raw_selected_button = 3'b000;
        
        if (game_state == 3'b000) begin //pregame 
            led0_top = pregame_led0;
            led1_top = pregame_led1; // note- we will probably have to do pregame + recieved signal now for LED logic
        end
        else begin
            led0_top = 3'b000;
            led1_top = 3'b000; 
        end
        
        if(game_state == 3'b001) begin //simon talking
            
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
