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
    output logic press_correct
    );
 
    always_ff @(posedge clk) begin
        if (reset) begin
            check_index = 5'b0;
            round_complete = 0;
            press_correct = 0;
        end
        else if (press_pulse) begin
            if(selected_button == led_sequence) begin
                if (check_index == current_level) begin
                    round_complete <= 1;
                end
                else begin 
                    check_index <= check_index + 1;
                    press_correct <= 1;
                end
            end
            else begin
                press_correct = 0;
            end
        end
    end
endmodule
