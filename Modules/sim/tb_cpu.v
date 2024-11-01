`timescale 1ns / 1ns

module tb_cpu;

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
		instruction_initialize_address = 0;
		instruction_initialize_data = 32'b000000_00000_00010_00001_00000_100000;      // ADD R1, R0, R2
		#20;
		instruction_initialize_address = 4;
		instruction_initialize_data = 32'b000000_00100_00100_01000_00000_100010;      // SUB R8, R4, R4
		#20;
		instruction_initialize_address = 8;
        instruction_initialize_data = 32'b000010_00000_00000_00000_00001_000000;    // JUMP to address 32 (PC = 32)
		#40;
		instruction_initialize_address = 12;
		instruction_initialize_data = 32'b000000_00101_00110_00111_00000_100101;      // OR R7, R5, R6
		#20;
		instruction_initialize_address = 16;
		instruction_initialize_data = 32'b100011_00000_01100_00000_00000_001100;      // LW R12, 12(R0)
		#20;	
		instruction_initialize_address = 20;
		instruction_initialize_data = 32'b000100_00000_00000_11111_11111_111111;      // BEQ R0, R0, -1
		#20;
		instruction_initialize_address = 24;
		instruction_initialize_data = 32'b001000_00110_00110_00000_00000_001010;      // ADDI R6, R6, 10
		#20;
		instruction_initialize_address = 28;
		instruction_initialize_data = 32'b000000_11111_10000_11111_00000_101010;      // SLT R31, R31, R16 
		#20;

		// Finish instruction initialization
		initialize = 0;
		#20;
		rst = 0;
	end

	// Clock generation
	always
		#5 clk = ~clk;

	// Monitoring signals
	initial begin
		$monitor("Time: %0d ns | PC: %0d | Instruction: %b | Jump Signal: %b", $time, PC, instruction, jump_signal);
	end

	// Verification logic
	initial begin
		// Wait for reset to deassert
		@(negedge rst);
		#10;

		// Wait for jump instruction to be fetched
		@(posedge clk);
		while (PC != 8) begin
			@(posedge clk);
		end

		// Check if jump signal is asserted when jump instruction is at PC = 8
		if (jump_signal !== 1'b1) begin
			$display("Error: Jump signal not asserted at PC = 8");
		end else begin
			$display("Success: Jump signal correctly asserted at PC = 8");
		end

		// Wait for the next clock cycle to see the effect on PC
		@(posedge clk);

		// Verify that PC jumps to the correct address (16)
		if (PC != 16) begin
			$display("Error: PC did not jump to address 16 after jump instruction. Current PC: %d", PC);
		end else begin
			$display("Success: PC correctly jumped to address 16 after jump instruction");
		end

		// Additional checks can be added here for other instructions

		// Finish simulation after some time
		#200;

	end

endmodule
