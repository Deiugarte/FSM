`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    20:10:53 02/18/2016
// Design Name:
// Module Name:    fullAdder_4b
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module fullAdder_4b(a, b, cin, clk, reset, sseg, AN);

//										G_F_E_D_C_B_A_p		Hexadecimal
localparam
					 V0 = 	 8'b1_0_0_0_0_0_0_1,	// 81
					 V1 = 	 8'b1_1_1_1_0_0_1_1,	// F3
					 V2 = 	 8'b0_1_0_0_1_0_0_1,	// 49
					 V3 = 	 8'b0_1_1_0_0_0_0_1,	// 61
					 V4 = 	 8'b0_0_1_1_0_0_1_1,	// 33
					 V5 = 	 8'b0_0_1_0_0_1_0_1,	// 25
					 V6 = 	 8'b0_0_0_0_0_1_0_1,	// 05
					 V7 = 	 8'b1_1_1_1_0_0_0_1,	// F1
					 V8 = 	 8'b0_0_0_0_0_0_0_1,	// 01
					 V9 = 	 8'b0_0_1_1_0_0_0_1,	// 31
					 VA = 	 8'b0_0_0_1_0_0_0_1,	// 11
					 VB = 	 8'b0_0_0_0_0_1_1_1,	// 07
					 VC = 	 8'b1_0_0_0_1_1_0_1,	// 8D
					 VD = 	 8'b0_1_0_0_0_0_1_1,	// 43
					 VE = 	 8'b0_0_0_0_1_1_0_1,	// 0D
					 VF = 	 8'b0_0_0_1_1_1_0_1,	// 1D
					 VU = 	 8'b0_0_0_1_0_0_1_1;	// 13

localparam 	STATE_0 = 3'd0,
						STATE_1 = 3'd1,
						STATE_2 = 3'd2,
						STATE_3 = 3'd3;

input [3:0] a;
input [3:0] b;
input cin;
input clk;
input reset;

// -----------------------------------------------------------------------------
// Representaciones de LED's
// -----------------------------------------------------------------------------
output reg [7:0] sseg;	// cátodos de un 7 segmentos
output reg [3:0] AN;	// control de ánodos para habilitar cada 7 segmentos
// -----------------------------------------------------------------------------

wire cout1, cout2, cout3;
wire [3:0] db_a, db_b;
wire [3:0] sum;

reg [2:0] state, nxtState; // current and next state
// reg [3:0] seg0, seg1, seg2, seg3;

function [7:0] binTo7Seg;
	input [3:0] bin;
	case (bin)
		4'h0: binTo7Seg = V0;
		4'h1: binTo7Seg = V1;
		4'h2: binTo7Seg = V2;
		4'h3: binTo7Seg = V3;
		4'h4: binTo7Seg = V4;
		4'h5: binTo7Seg = V5;
		4'h6: binTo7Seg = V6;
		4'h7: binTo7Seg = V7;
		4'h8: binTo7Seg = V8;
		4'h9: binTo7Seg = V9;
		4'ha: binTo7Seg = VA;
		4'hb: binTo7Seg = VB;
		4'hc: binTo7Seg = VC;
		4'hd: binTo7Seg = VD;
		4'he: binTo7Seg = VE;
		4'hf: binTo7Seg = VF;
		default: binTo7Seg = VU;
	endcase
endfunction

initial begin
	state = 0;
end

always @ ( posedge clk ) begin
	if (reset)
		state <= STATE_0;
	else begin
		state <= nxtState;
	end
end


always @ ( * ) begin
	nxtState = state;
	case (state)
		STATE_0:	// primer display
		begin
			AN = 4'b1110;
			sseg = binTo7Seg(db_a);
			nxtState = STATE_1;
		end
		STATE_1:	// segundo display
		begin
			AN = 4'b1101;
			sseg = binTo7Seg(db_b);
			nxtState = STATE_2;
		end
		STATE_2:	// tercer display
		begin
			AN = 4'b1011;
			sseg = binTo7Seg(sum);
			nxtState = STATE_3;
		end
		STATE_3:	// cuarto display
		begin
			AN = 4'b0111;
			sseg = binTo7Seg(cout3);
			nxtState = STATE_0;
		end
		default:
		begin
			AN = 4'b1111;
			sseg = binTo7Seg(VU);
			nxtState = STATE_0;
		end
	endcase
end


// Instantiate the module

debounce db_a0 (
    .clk(clk),
    .reset(reset),
    .sw(a[0]),
    .db_level(db_a[0])
    );

debounce db_a1 (
    .clk(clk),
    .reset(reset),
    .sw(a[1]),
    .db_level(db_a[1])
    );

debounce db_a2 (
    .clk(clk),
    .reset(reset),
    .sw(a[2]),
    .db_level(db_a[2])
    );

debounce db_a3 (
    .clk(clk),
    .reset(reset),
    .sw(a[3]),
    .db_level(db_a[3])
    );

debounce db_b0 (
    .clk(clk),
    .reset(reset),
    .sw(b[0]),
    .db_level(db_b[0])
    );

debounce db_b1 (
    .clk(clk),
    .reset(reset),
    .sw(b[1]),
    .db_level(db_b[1])
    );

debounce db_b2 (
    .clk(clk),
    .reset(reset),
    .sw(b[2]),
    .db_level(db_b[2])
    );

debounce db_b3 (
    .clk(clk),
    .reset(reset),
    .sw(b[3]),
    .db_level(db_b[3])
    );


fullAdder_1b fA_0 (
    .a(db_a[0]),
    .b(db_b[0]),
    .cin(cin),
    .sum(sum[0]),
    .cout(cout0)
    );

fullAdder_1b fA_1 (
    .a(db_a[1]),
    .b(db_b[1]),
    .cin(cout0),
    .sum(sum[1]),
    .cout(cout1)
    );

fullAdder_1b fA_2 (
    .a(db_a[2]),
    .b(db_b[2]),
    .cin(cout1),
    .sum(sum[2]),
    .cout(cout2)
    );

fullAdder_1b fA_3 (
    .a(db_a[3]),
    .b(db_b[3]),
    .cin(cout2),
    .sum(sum[3]),
    .cout(cout3)
    );

endmodule
