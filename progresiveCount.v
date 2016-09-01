`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:05 08/31/2016 
// Design Name: 
// Module Name:    progresiveCount 
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
module progresiveCount(initSignal,finalSignal,clk,reset,suma
    );

input initSignal;
output reg finalSignal;
input clk;
input reset;
output reg [3:0] suma;	

localparam 	STATE_0 = 3'd0,
						STATE_1 = 3'd1,
						STATE_2 = 3'd2;
reg [2:0] state, nxtState; 
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
		STATE_0:	
		begin
			suma=4'd0;
			finalSignal=1'b0;
			if(initSignal) nxtState = STATE_1;
			else nxtState = STATE_0;
		end
		STATE_1:
		begin
			if(suma<15)
			begin 
				suma= suma+4'd1;
				nxtState = STATE_1;
			end
			else nxtState = STATE_2;
		end
		STATE_2:	
		begin
			finalSignal=1'b1;
			if(initSignal) nxtState = STATE_0;
			else nxtState = STATE_2;
		end
		default:
		begin
			nxtState = STATE_0;
		end
	endcase
end

// Instantiate the module
div_frec div_progre (
    .clk_in(clk), 
    .clk_out(clk_out)
    );



endmodule
