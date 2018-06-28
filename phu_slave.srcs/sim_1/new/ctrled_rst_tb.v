`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/28 10:54:59
// Design Name: 
// Module Name: ctrled_rst_tb
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


module ctrled_rst_tb(
);
	
	
	
	
	reg clk;
	
	initial begin
		clk <=1'b0;
	end
	
	always begin
		#5 clk <= ~clk;
	end
	
	
	
	reg locked;
	
	initial begin
		locked <= 1'b0;
		#1127;
		locked <= 1'b1;
	end
	
	
	
	wire rst_n;
	
	// CTRLED RST
	ctrled_rst UUT_RST(
		.rst_n(rst_n),
		.locked(locked),   // signal from PLL
		.clk(clk)
    );
	
	
	
	
endmodule
