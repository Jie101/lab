


module phu_slave_top(
	output	MONI_0,
	output	MONI_1,
	output	MONI_2,
	output	MONI_3,	
	input	FPGA_EXT_CLK,
	input	FPGA_EXT_RESET
    );
	
	
	
	
	
	
	wire locked;
	
	wire clk_100m;
	wire clk_50m;
	wire rst_n;
	
	
	assign 	MONI_0 = rst_n;
	assign  MONI_1 = locked;
	assign  MONI_2 = clk_100m;
	assign  MONI_3 = clk_50m;
	
	
	clk_wiz_0 MMCM_CLK_0
   (
    // Clock out ports
    .clk_out1(clk_100m),     // output clk_out1
    .clk_out2(clk_50m),     // output clk_out2
    // Status and control signals
    .reset(FPGA_EXT_RESET), // input reset
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(FPGA_EXT_CLK));      // input clk_in1
	
	
	
	ctrled_rst UUT_RST(
		.rst_n(rst_n),
		.locked(locked),   // signal from PLL
		.clk(clk_100m)
    );
	
	
	
endmodule
