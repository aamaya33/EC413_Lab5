`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 03:28:08 PM
// Design Name: 
// Module Name: J_Shift
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
module J_Shift(
    input [25:0] imm, 
    output reg [27:0] imm_left
    );
    
    //similar to the other shift_left, except here we want to shift the lower 26 bits of the instruction left by 2 bits. 
    always @(imm)
    begin 
        imm_left = imm << 2; 
    end 
    
endmodule
