`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2017 12:05:13 PM
// Design Name: 
// Module Name: flop
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


module flop(
    input clk,
    input reset,
    input d,
    output reg q
    );
    
    
    always@(posedge clk) begin
    	if(reset == 1) begin
    		q <= 0;
    	end else begin
    		q <= d;
    	end
    end
endmodule
