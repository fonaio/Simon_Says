`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// 
// Create Date: 07/01/2026 06:27:16 PM

// Module Name: Checking_Input
// Project Name: Simon_Says
// Description: Checks the user's button input before moving onto the next stage. 
// 
//////////////////////////////////////////////////////////////////////////////////


module Checking_Input(
    input logic clk,
    input logic reset,
    input logic [2:0] selected_button, //BTNC/L/R
    input logic press_pulse, //if a button press was detected
    input logic [2:0] led_sequence,//correct value 
    input logic [4:0] current_level,
    
    output logic [4:0] check_index, //highest index of array we have to check
    output logic round_complete,
    output logic [1:0] press_status //possible statuses same as state: 00-idle, 01, correct, 10, incorrect
    );
    
    typedef enum logic [1:0]{
        incorrect = 2'b00,
        correct = 2'b01,
        idle = 2'b10
    } state_t;
    
    state_t state;
    //state tracks 
    always_ff @(posedge clk) begin
        if (reset) begin
            check_index <= 5'b0;
            round_complete <= 0;
            press_status <= idle;
            state <= idle;
        end
        else begin
            round_complete = 0;
            case (state)
                idle : begin
                    if (press_pulse) begin
                        if (selected_button == led_sequence) begin
                            if (current_level == check_index) begin
                                round_complete = 1;
                            end
                            else begin
                                check_index <= check_index + 1;
                            end
                            press_status <= correct;
                            state <= correct;
                        end 
                        else begin
                            press_status <= incorrect;
                            state <= incorrect;
                        end
                    end
                    else begin 
                        press_status <= idle;
                    end
                end
                correct, incorrect: begin 
                    press_status <= idle;
                    state <= idle;
                end
            endcase
          end
       end
endmodule
