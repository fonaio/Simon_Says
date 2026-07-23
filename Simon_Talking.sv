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
    input logic clk.
    input logic clock_div,
    input logic reset,
    input logic led_seq,
    input logic [4:0] check_index, //from check, flashes LEDs up to that index
    
    output logic [2:0] simon_led
    );
    
    always_ff @(posedge clk) begin
        if reset begin
           //stuff 
        end
        else if clock_div begin
            //stuff
        end
    end
    
endmodule
