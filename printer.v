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
module printer(suma, clk, reset, sseg, AN);

//										G_F_E_D_C_B_A_p		Hexadecimal
localparam
					 V0 = 	 8'b1_0_0_0_0_0_0_1,	// 81
					 V1 = 	 8'b1_1_1_1_0_0_1_1,	// F3
					 VU = 	 8'b0_0_0_1_1_0_1_1;	// 13

localparam 	STATE_0 = 3'd0,
						STATE_1 = 3'd1,
						STATE_2 = 3'd2,
						STATE_3 = 3'd3; 
						

input [3:0] suma;
input clk;
input reset;

// -----------------------------------------------------------------------------
// Representaciones de LED's
// -----------------------------------------------------------------------------
output reg [7:0] sseg;	// cátodos de un 7 segmentos
output reg [3:0] AN;	// control de ánodos para habilitar cada 7 segmentos
// -----------------------------------------------------------------------------


reg [2:0] state, nxtState; // current and next state

function [7:0] binTo7Seg;
	input [1:0] bin;
	case (bin)
		4'h0: binTo7Seg = V0;
		4'h1: binTo7Seg = V1;
		default: binTo7Seg = VU;
	endcase
endfunction

initial begin
	state = 0;
end

always @ ( posedge clk_out ) begin
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
			sseg = binTo7Seg(suma[0]);
			nxtState = STATE_1;
		end
		STATE_1:	// segundo display
		begin
			AN = 4'b1101;
			sseg = binTo7Seg(suma[1]);
			nxtState = STATE_2;
		end
		STATE_2:	// tercer display
		begin
			AN = 4'b1011;
			sseg = binTo7Seg(suma[2]);
			nxtState = STATE_3;
		end
		STATE_3:	// cuarto display
		begin
			AN = 4'b0111;
			sseg = binTo7Seg(suma[3]);
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
div_frec div_printer (
    .clk_in(clk), 
    .clk_out(clk_out)
    );



endmodule
