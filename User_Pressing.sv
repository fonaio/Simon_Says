`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// 
// Create Date: 07/01/2026 06:27:16 PM

// Module Name: User_Pressing
// Project Name: Simon_Says
// Description: Determines if the user has pressed the button using edge detection by comparing the button press status of current and previous cycle
// 
//////////////////////////////////////////////////////////////////////////////////


module User_Pressing(
    input logic clk,
    input logic reset,
    input logic raw_press,
    input logic [2:0] raw_selected_button,
    
    output logic press_pulse,
    output logic [2:0] selected_button
    );
    
    logic raw_press_prev;
    
    always_ff @(posedge clk) begin
        if (reset) begin
            press_pulse <= 0;
            selected_button <= 3'b000;
        end
        else begin
            raw_press_prev <= raw_press; //sets on the next clock cycle
            press_pulse <= raw_press && !raw_press_prev;
            if (raw_press && !raw_press_prev) begin
                selected_button <= raw_selected_button;
            end
        end
    end
endmodule
