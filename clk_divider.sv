`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/10/2026 08:23:30 PM
// Design Name: 
// Module Name: clk_divider
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


module clk_divider( //Nexys A7 uses 100 MHz (100 million times/second) 
        input logic clk,
        input logic reset,
        
        output clock_div
    );
    
    logic[26:0] count = 27'b0; // 27th bit switches after 2^(26) pulses pass
    
    always_ff @ (posedge clk or reset) begin 
        if (reset) begin
            count <= 27'b0;
        end
        else begin 
            count <= count + 1;
        end
    end
    
    assign clock_div = count[26];
    
endmodule
