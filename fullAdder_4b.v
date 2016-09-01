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
module fullAdder_4b(a,progre,regre,cin,clk, reset, sseg, AN);


localparam 	STATE_0 = 3'd0,
						STATE_1 = 3'd1,
						STATE_2 = 3'd2,
						STATE_3 = 3'd3,
						STATE_4 = 3'd4,
						STATE_5 = 3'd5;


input cin;
input [3:0] a;
input progre;
input regre;
input clk;
input reset;

// -----------------------------------------------------------------------------
// Representaciones de LED's
// -----------------------------------------------------------------------------
output [7:0] sseg;	// cátodos de un 7 segmentos
output  [3:0] AN;	// control de ánodos para habilitar cada 7 segmentos
// -----------------------------------------------------------------------------

reg [3:0] resultado = 4'd0;
wire [3:0] suma;
wire [3:0] resta;
reg initSignalProgresive =1'b0;
wire finalSignalProgresive;
reg initSignalRegresive=1'b0;
wire finalSignalRegresive=1'b0;



reg [2:0] state, nextState; 
initial begin
	state = 0;
end

always @ ( posedge clk_out ) begin
	if (reset)
		state <= STATE_0;
	else begin
		state <= nextState;
	end
end


always @ ( * ) begin
	nextState = state;
	case (state)
//		STATE_0:	
//		begin
//		if(cin)
//			begin
//			initSignalProgresive=1'b1;
//			nextState = STATE_1;
//			resultado=4'b0101;
//			end
//		else nextState = STATE_0;
//		end
//		STATE_1:
//		begin
//			resultado=4'b0101;
//			if(finalSignalProgresive)
//			begin
//			nextState = STATE_0;
//			initSignalRegresive=1'b1;
//			resultado=4'b0101;
//			end
//			else nextState = STATE_1;
//		end
//		STATE_2:	
//		begin
//			resultado=resta;
//			if(finalSignalRegresive) nextState = STATE_3;
//			else nextState = STATE_2;
//		end
//		STATE_3:	
//		begin			
//			if(progre)
//			begin
//			nextState = STATE_4;
//			initSignalProgresive=1'b1;
//			resultado=suma;
//			end
//			else if(regre)
//			begin
//			nextState = STATE_5;
//			initSignalRegresive=1'b1;
//			resultado=resta;
//			end
//			else nextState = STATE_3;
//		end
//		STATE_4:	
//		begin
//			resultado=suma;
//			if(finalSignalProgresive) nextState = STATE_0;
//			else nextState = STATE_4;
//		end
//		STATE_5:	
//		begin
//			resultado=resta;
//			if(finalSignalRegresive) nextState = STATE_0;
//			else nextState = STATE_5;
//		end
		default:
		begin
			nextState = STATE_0;
		end
	endcase
end





// Instantiate the module
printer printer (
    .suma(a), 
    .clk(clk), 
    .reset(reset), 
    .sseg(sseg), 
    .AN(AN)
    );

// Instantiate the module
div_frec div_fsm (
    .clk_in(clk),
    .clk_out(clk_out)
    );
// Instantiate the module
progresiveCount progresiveCount (
    .initSignal(initSignalProgresive), 
    .finalSignal(finalSignalProgresive), 
    .clk(clk), 
    .reset(reset), 
    .suma(suma)
    );

//// Instantiate the module
//regresiveCount regresiveCount (
//    .initSignal(initSignalRegresive), 
//    .finalSignal(finalSignalRegresive), 
//    .clk_out(clk_out), 
//    .reset(reset), 
//    .resta(resta)
//    );






endmodule
