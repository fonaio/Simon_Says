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
    input logic rst,
    input logic [2:0] selected_button,
    input logic press_pulse,
    input logic [4:0] curr_index, 
    
    output logic press_correct,
    output logic level_pass
    );
    
    logic counter = 0; //highest index of the array we have to check
    
    
endmodule
