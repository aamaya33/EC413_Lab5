`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 03:57:39 PM
// Design Name: 
// Module Name: J_concat
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


module J_concat(
    input [3:0] PC,
    input [27:0] shifted_imm, 
    output [31:0] out
    );
    
    assign out[31:28] = PC;
    assign out[27:0] = shifted_imm; 
endmodule
