`timescale 1ns / 1ps



module phu_slave_top_tb(
    );
	
	
	// reset
	reg	rst;
	
	initial begin
		rst <= 1'b1;
		#770;
		rst <= 1'b0;
	end
	
	
	
	// clock
	reg clk;
	
	initial begin
		clk <= 1'b0;
	end
	
	always begin
		#5 clk <= ~clk;
	end
	
	
	
	
	
	phu_slave_top UUT_TOP(
	.FPGA_EXT_CLK(clk),
	.FPGA_EXT_RESET(rst)
    );
	
	
endmodule
