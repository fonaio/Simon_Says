`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2026 06:27:16 PM
// Design Name: 
// Module Name: Game_Control
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


module Game_Control(
    input logic clk,
    input logic reset,
    input logic start,
    input logic level_pass,
    output logic game_state
    );

    typedef enum logic [2:0] {
        pregame = 3'b000,
        simon_talking = 3'b001,
        user_pressing = 3'b010,
        check = 3'b011,
        game_over = 3'b100
     } state_t;
     
     state_t state_curr, state_next;
     
     //reset button
     always_ff @(posedge clk or reset) begin
        if (reset) begin
            state_curr <= pregame;
        end
        else if (clk) begin //only update on positive edge of the clock, think about other variables later
            state_curr <= state_next;
        end
     end
        
    always_comb begin
        case (state_curr)
            pregame : begin
                if (start) begin
                    state_next = simon_talking;
                end
                else begin
                    state_next = pregame;
                end
            end
            simon_talking : state_next = user_pressing;
            user_pressing : state_next = check;
            check : begin
                if(level_pass) begin
                    state_next = simon_talking;
                end
                else begin
                    state_next = game_over;
                end
             end
             
             game_over : state_next = game_over;
             default : state_next = pregame;
         endcase
    end
    
endmodule
