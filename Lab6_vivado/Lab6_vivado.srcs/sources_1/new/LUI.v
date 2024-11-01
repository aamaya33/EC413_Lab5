`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2024 01:23:28 PM
// Design Name: 
// Module Name: LUI
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


module LUI(
    input [15:0] imm, //16 bit immediate that will be loaded into the uppet 16 bits 
    output [31:0] out
    );
    
    assign out = {imm, 16'b0}; //concat imm to upper 32 bits
endmodule
