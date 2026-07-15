`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2026 06:51:43 PM
// Design Name: 
// Module Name: User_Pressing
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


module User_Pressing(
    input logic BTNL,
    input logic BTNC,
    input logic BTNR,
    
    output logic press_made,
    output logic [2:0] selected_button
    );
    
    assign press_made = 0;
    assign selected_button = 3'b000;
    
    always_comb begin
        if (BTNL) begin
            press_made = 1;
            selected_button = 3'b100;
        end
        if (BTNC) begin
            press_made = 1;
            selected_button = 3'b010;
        end
        if (BTNR) begin
            press_made = 1;
            selected_button = 3'b001;
        end
    end
          
endmodule
