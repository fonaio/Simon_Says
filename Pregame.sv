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
    input logic [1:0] rand_value, //brain
    
    output logic [4:0] memindex, //brain
    output logic is_writing,
    output logic start,
    output logic [2:0] led0, // {rgb}
    output logic [2:0] led1 
    
    );
    
    always_comb begin
        start = 0;
        led0 = 3'b010;
        led1 = 3'b010;
        
        if (start_button) begin
            led0 = 3'b000;
            led1 = 3'b000;
            start = 1;
        end
    end
        
       
endmodule


