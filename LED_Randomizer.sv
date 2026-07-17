`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: 
// 
// Create Date: 07/01/2026 06:27:16 PM

// Module Name: LED_Randomizer
// Project Name: Simon_Says
// Description: Chooses a random LED to turn on when Simon is talking
//////////////////////////////////////////////////////////////////////////////////


module LED_Randomizer(
    input logic clk,
    input logic reset,
    input logic seed_en,
    
    output logic [1:0] randout //2 bit output: 0,1,2
    );
    
    logic [7:0] lfsr_reg;
    logic feedback;
    
    //Polynomial from online: x^8+x^6+x^5+x^4 +1 for 8-bit LFSR
    
    assign feedback = lfsr_reg[7] ^lfsr_reg[5] ^ lfsr_reg[4] ^lfsr_reg[3];
    
    always_ff @(posedge clk or reset) begin
        if (reset) begin
            lfsr_reg <= 8'b1000_0001;
            randout <= 2'b00;
        end
        else begin //do a LFSR every clock cycle
            lfsr_reg <= {lfsr_reg[6:0], feedback};
            
            //in the case that we get 11, sample again
            if (lfsr_reg[1:0] != 2'b11) begin
                randout <= lfsr_reg[1:0];
            end
        end
     end
     
endmodule
