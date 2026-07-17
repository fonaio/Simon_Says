`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// 
// Create Date: 07/01/2026 06:27:16 PM

// Module Name: game_over
// Project Name: Simon_Says
// Description: LEDs all turn red when the game is over
// 
//////////////////////////////////////////////////////////////////////////////////


module game_over(
    input logic clk, 
    input logic reset,
    input logic press_correct,
    
    output logic [2:0] led0,
    output logic [2:0] led1
    );
        
    always_ff @(posedge clk) begin
        if (reset) begin
            led0 = 3'b0;
            led1 = 3'b0;
        end
        else if (!press_correct) begin
            led0 = 3'b100;
            led1 = 3'b100;
        end
        else begin
            led0 = 3'b0;
            led1 = 3'b0;
        end
    end
endmodule
