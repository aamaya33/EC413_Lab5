`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2024 01:00:46 PM
// Design Name: 
// Module Name: BNE_tb
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


module BNE_tb;

	// Inputs
	reg rst;
	reg clk;
	reg initialize;
	reg [31:0] instruction_initialize_data;
	reg [31:0] instruction_initialize_address;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.rst(rst), 
		.clk(clk), 
		.initialize(initialize), 
		.instruction_initialize_data(instruction_initialize_data), 
		.instruction_initialize_address(instruction_initialize_address)
	);

	// Internal signals for monitoring
	wire [31:0] PC;
	wire [31:0] instruction;
	wire jump_signal;

	// Connecting internal signals
	assign PC = uut.PC_out;
	assign instruction = uut.instruction;
	assign jump_signal = uut.jump;

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		initialize = 1;
		instruction_initialize_data = 0;
		instruction_initialize_address = 0;

		#100;

		// Initialize instruction memory with test instructions
		// Set up registers to have values for BNE testing

		instruction_initialize_address = 0;
		instruction_initialize_data = 32'b000000_00000_00010_00001_00000_100000;      // ADD R1, R0, R2 (R1 = R0 + R2 = 0 + 2)
		#20;

		instruction_initialize_address = 4;
		instruction_initialize_data = 32'b000000_00000_00011_00010_00000_100000;      // ADD R2, R0, R3 (R2 = R0 + R3 = 0 + 3)
		#20;

		instruction_initialize_address = 8;
		instruction_initialize_data = 32'b000101_00001_00010_00000_00000_000001;      // BNE R1, R2, offset=1 (should branch since R1 != R2)
		#20;

		instruction_initialize_address = 16;
		instruction_initialize_data = 32'b000000_00010_00000_00010_00000_100000;      // ADD R2, R0, R2 (reset R2 to 0)
		#20;

		instruction_initialize_address = 20;
		instruction_initialize_data = 32'b000101_00001_00001_00000_00000_000001;      // BNE R1, R1, offset=1 (should not branch since R1 == R1)
		#20;
		
		// Finish instruction initialization
		initialize = 0;
		#20;
		rst = 0;
	end

	// Clock generation
	always
		#5 clk = ~clk;

endmodule

