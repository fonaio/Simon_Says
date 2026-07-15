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

    input logic start_button,

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


