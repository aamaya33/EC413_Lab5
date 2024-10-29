`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2024 06:04:33 PM
// Design Name: 
// Module Name: SLT_tb
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


module SLT_tb;
    reg [31:0] a, b;
    reg [5:0] instruction;
    reg [1:0] ALUOp;
    wire [2:0] func;
    wire [31:0] out;
    wire zero_flag;

    ALU_control alu_ctrl (
        .instruction(instruction),
        .ALUOp(ALUOp),
        .func(func)
    );

    ALU alu (
        .a(a),
        .b(b),
        .func(func),
        .out(out),
        .zero_flag(zero_flag)
    );

    initial begin
        //test add
        a = 32'd10; b = 32'd15; ALUOp = 2'b00; instruction = 6'h20; #10;
        $display("ADD: a=%d, b=%d, out=%d, zero_flag=%b", a, b, out, zero_flag);

        //test sub
        a = 32'd20; b = 32'd15; ALUOp = 2'b00; instruction = 6'h22; #10;
        $display("SUB: a=%d, b=%d, out=%d, zero_flag=%b", a, b, out, zero_flag);

        //test and 
        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; ALUOp = 2'b00; instruction = 6'h24; #10;
        $display("AND: a=%h, b=%h, out=%h, zero_flag=%b", a, b, out, zero_flag);

        //test or 
        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; ALUOp = 2'b00; instruction = 6'h25; #10;
        $display("OR: a=%h, b=%h, out=%h, zero_flag=%b", a, b, out, zero_flag);

        //test nor 
        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; ALUOp = 2'b00; instruction = 6'h27; #10;
        $display("NOR: a=%h, b=%h, out=%h, zero_flag=%b", a, b, out, zero_flag);

        //SLT
        a = 32'd5; b = 32'd10; ALUOp = 2'b00; instruction = 6'h2A; #10;
        $display("SLT (a < b): a=%d, b=%d, out=%d, zero_flag=%b", a, b, out, zero_flag);

        //SLT (a > b)
        a = 32'd15; b = 32'd10; ALUOp = 2'b00; instruction = 6'h2A; #10;
        $display("SLT (a > b): a=%d, b=%d, out=%d, zero_flag=%b", a, b, out, zero_flag);
        $stop;
    end
endmodule