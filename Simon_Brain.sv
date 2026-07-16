`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// 
// Create Date: 07/01/2026 06:27:16 PM

// Module Name: Simon_Brain
// Project Name: Simon_Says
// Description: Memory register for Simon_Talking. Creates the 30 levels of LEDs for Simon's Says during pregame. 
// 
//////////////////////////////////////////////////////////////////////////////////


module Simon_Brain(

    input logic clk,
    input logic reset,
    input logic [2:0] led_randomizer_value,
    input logic need_new,
    input logic [4:0] curr_index,
    
    output logic [2:0] led_sequence
    );
   
    logic [2:0] memory [29:0]; //creates an array (memory) with 30 memory slots + 2 bit per slot
    
    assign led_sequence = memory[curr_index];
    
    always_ff @(posedge clk) begin
        if (reset) begin
            memory <= '{default: 0}; //clears array upon reset
        end
        else if (need_new) begin
            memory[curr_index] = led_randomizer_value;
        end
    end
        
endmodule
