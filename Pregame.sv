`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2026 05:56:43 PM
// Design Name: 
// Module Name: Pregame
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Pregame(

    input logic clk,
    input logic start_button,
    
    output logic start,
    output logic start_LED,
    output logic rgb_r,
    output logic rgb_g,
    output logic rgb_b
    
    );
    
    always_comb begin
        start = 0;
        rgb_r = 1'b0;
        rgb_g = 1'b1;
        rgb_b = 1'b0;
        
        if (start_button) begin
            rgb_r = 1'b0;
            rgb_g = 1'b0;
            rgb_b = 1'b0;
            start = 1;
        end
    end
        
       
endmodule


