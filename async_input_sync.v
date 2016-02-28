`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    02:03:06 02/25/2016
// Design Name:
// Module Name:    synchronizer
// Project Name:
// Target Devices:
// Tool versions:
// Description:
// The following code is an example of double registering an asynchronous input
// of a design to reduce the probability of metastability affecting a circuit.
// Several synthesis and implementation attributes are added to the code in
// order improve the characteristics of the implementation:
//
//  ASYNC_REG="TRUE" - Specifies registers will be receiving asynchronous data
//                     input to allow for better timing simulation
//                     characteristics
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Taken from "Language Templates" from ISE.
//
////////////////////////////////////////////////////////////////////////////////

module async_input_sync(
   input clk,
   input async_in,
   output reg sync_out
);

   (* ASYNC_REG="TRUE" *) reg [1:0] sreg;
   always @(posedge clk) begin
     sync_out <= sreg[1];
     sreg <= {sreg[0], async_in};
   end

endmodule
