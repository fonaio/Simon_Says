`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// 
// Create Date: 07/01/2026 06:27:16 PM

// Module Name: Simon_Talking
// Project Name: Simon_Says
// Description: Turns on/off the 3 LEDs for when Simon is talking
// 
//////////////////////////////////////////////////////////////////////////////////


module Simon_Talking(
    input logic clk,
    input logic clock_div,
    input logic reset,
    input logic [2:0] led_seq,
    input logic [4:0] current_level, //how many LEDs this round has, from game control
    
    output logic [4:0] talk_index, //walks from 0 to current_level
    output logic [2:0] simon_led,
    output logic sequence_done
    );
    
    logic clock_div_prev;
    logic tick; 
    
    always_ff @(posedge clk) clock_div_prev <= clock_div;
    assign tick = clock_div & ~clock_div_prev; 

    always_ff @(posedge clk) begin
        if (reset) begin
           simon_led <= 3'b000; 
           talk_index <= 5'b00000;
           sequence_done <= 0;
        end
        else if (tick && !sequence_done) begin
            simon_led <= led_seq;
            if (talk_index == current_level) begin
                sequence_done <= 1;
            end
            else begin 
                talk_index <= talk_index + 1;
            end
        end
    end
endmodule
