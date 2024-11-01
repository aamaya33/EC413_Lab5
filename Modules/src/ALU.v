`timescale 1ns / 1ns


module ALU(
    a,
    b,
	 func,
    out,
    zero_flag,
    not_zero
    );


	 parameter size = 32;
	 
    input [size-1:0] a;
    input [size-1:0] b;
	 input [2:0] func;
    output reg [size-1:0] out;
    output reg zero_flag;
	output reg not_zero; 
	 	
	always @(*) begin
	case (out) 
	0: zero_flag = 1'b1;
	default: zero_flag = 1'b0;
	endcase
	end
	
	always @(*) begin
	case (out) 
	0: not_zero = 1'b0;
	default: not_zero = 1'b1;
	endcase
	end
	
	always @(*) begin
		if (func == 3'd0) 
		out = a+b;
		else if (func == 3'd1)
		out = a-b;
		else if (func == 3'd2)
		out = a&b;
		else if (func == 3'd3)
		out = a|b;
		else if (func == 3'd4)
		out = ~(a|b);
		else if (func == 3'd5) 
		out = ((a<b) ? 1:0); // add the SLT instruction 
		else
		out = 0;
   end



endmodule
