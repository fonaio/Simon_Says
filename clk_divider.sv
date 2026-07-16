`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// 
// Create Date: 07/01/2026 06:27:16 PM

// Module Name: clk_divider
// Project Name: Simon_Says
// Description: Paces Simon's talking to occur every 2^27 clock cycles (a little less than a second) 
//////////////////////////////////////////////////////////////////////////////////


module clk_divider( //Nexys A7 uses 100 MHz (100 million times/second) 
        input logic clk,
        input logic reset,
        
        output clock_div
    );
    
    logic[26:0] count = 27'b0; // 27th bit switches after 2^(26) pulses pass
    
    always_ff @ (posedge clk or posedge reset) begin 
        if (reset) begin
            count <= 27'b0;
        end
        else begin 
            count <= count + 1;
        end
    end
    
    assign clock_div = count[26];
    
endmodule
