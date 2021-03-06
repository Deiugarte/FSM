`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   20:53:37 08/22/2015
// Design Name:   debounce
// Module Name:
// Project Name:  debounce
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: debounce
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Extracted from Chu: FPGA prototyping by
//    Verilog examples, pag. 146
////////////////////////////////////////////////////////////////////////////////

module debounce (
  input clk,
  input reset,
  input wire sw,
  output reg db_level	// debounced output
	//output reg db_tick		// is a one-clock-cycle enable pulse asserted at the zero-to-one transition
  );

// symbolic state declaration
localparam [1:0]
                 zero			= 2'b00,
					  wait0			= 2'b01,
                 one			= 2'b10,
                 wait1  	= 2'b11;

// number of counter bits (2^N * 20 ns)
localparam N = 3;	// 160 ns

// signal declaration
reg [1:0] state_reg, state_next;
reg [N - 1:0]   q_reg;
wire [N - 1:0]  q_next;
wire q_zero;
reg q_load, q_dec;

// body

// fsmd state & data registers
always @ (posedge clk, posedge reset)
  if (reset) begin
  	state_reg <= zero;
		q_reg <= 0;
  end
	else begin
		state_reg <= state_next;
		q_reg <= q_next;
	end

// FSMD data path (counter) next-state logic
assign q_next = (q_load)	? {N{1'b1}} : // load 1..1
								(q_dec)		? q_reg - 1 : // decrement
														q_reg;
// status signal
assign q_zero = (q_next == 0);

// FSMD control path next-state logic
always @ ( * ) begin
	state_next = state_reg;	// default state: the same
	q_load = 1'b0;					// default output: 0
	q_dec = 1'b0;						// default output: 0
	//db_tick = 1'b0;					// default output: 0
	case (state_reg)
		zero: begin
			db_level = 1'b0;
			if (sw) begin
				state_next = wait1;
				q_load = 1'b1;
			end
		end
		wait1: begin
			db_level = 1'b0;
			if (sw) begin
				q_dec = 1'b1;
				if (q_zero) begin
					state_next = one;
					//db_tick = 1'b1;
				end
			end
			else // sw == 0
				state_next = zero;
		end
		one: begin
			db_level = 1'b1;
			if (~sw) begin
				state_next = wait0;
				q_load = 1'b1;
			end
		end
		wait0: begin
			db_level = 1'b1;
			if (~sw) begin
				q_dec = 1'b1;
				if (q_zero) begin
					state_next = zero;
				end
			end
			else // sw == 1
				state_next = one;
		end
		default: state_next = zero;
	endcase
end
endmodule
