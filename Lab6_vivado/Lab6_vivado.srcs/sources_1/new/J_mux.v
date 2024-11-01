`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 03:37:51 PM
// Design Name: 
// Module Name: J_mux
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


module J_mux(
    input [31:0] in_1,
    input [31:0] in_2,
    input sel, 
    output reg [31:0] out  
    );
    //mux that comes with jump as seen by figure 4.24
    
    always @(in_1 or in_2 or sel)
    begin 
        if(sel==1'b0) begin
            out = in_2; //sending forward the normal PC instruction 
        end else if (sel == 1'b1) begin 
            out = in_1; //sending forward the new jump instruction 
        end
    end
    
    
    
endmodule
