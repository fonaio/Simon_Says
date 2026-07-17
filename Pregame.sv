`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// 
// Create Date: 07/01/2026 06:27:16 PM

// Module Name: Pregame
// Project Name: Simon_Says
// Description: Sets 2 Tricolor LEDs to be green after filling memory array. Pressing the button when the LED is green starts the game. 
// After the game starts, LEDs turn off.
//////////////////////////////////////////////////////////////////////////////////


module Pregame(
    input logic clk,
    input logic reset,
    input logic start_button,
    
    output logic [4:0] curr_index, //brain
    output logic allow_write,
    output logic pregame_start, //user has pressed start
    output logic [2:0] led0, // {rgb}
    output logic [2:0] led1 
    );
    
    typedef enum logic [1:0]{
        filling = 2'b01,
        ready = 2'b10, //array has been filled
        running = 2'b11 //running game now
    } state_t;
    
    state_t state;
    
    always_ff @(posedge clk) begin
        if (reset) begin
            state <= filling;
            curr_index <= 0;
            allow_write <= 0;
            pregame_start <= 0;
            led0 <= 3'b0;
            led1 <= 3'b0;
        end
        else begin
            led0 <= 3'b0;
            led1 <= 3'b0;
            case(state)
                filling : begin
                    allow_write <=1;
                    if (curr_index == 5'b11101) begin //index 29
                        state <= ready;
                        allow_write <= 0;
                    end
                    else begin
                        curr_index <= curr_index + 1;
                    end
                end
                ready : begin
                    led0 <= 3'b010;
                    led1 <= 3'b010;
                    if (start_button) begin
                        state <= running;
                        pregame_start <= 1;
                    end
                end
             endcase
        end
    end   
endmodule


