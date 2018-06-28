`timescale 1ns/100ps

module ads8331ctrl_tb();

	// TB
	reg	clk;
	reg	sysrst;	
	
	reg run;
	
		
	// ADS8331RX
	reg busy;
	wire go;
	wire [15:0] adc_read_result;
	wire [15:0] command;
	wire [4:0] number_of_sclk;
	
	
	
	// TB
	wire [7:0]	update;
	wire [15:0]	ch1,ch2,ch3,ch4;
	
	
	
	
	parameter PERIOD=24;	
	
	
	// SYSYTEM RESET
	initial begin
		#0   			sysrst <=1;
		#(PERIOD*20) 	sysrst <=0;
	end
	
	

	
	// SYSTEM CLOCK
	initial begin
		clk <=0;
	end
	
	always begin
		#(PERIOD/2) clk = ~clk;
	end
	
	
	




	//TB
	initial begin
		run <=0;
		
		#2000		run <=1;
		#18000		run <=0;
		
		#5000		run <=1;
		#80			run <=0;		
		
	end	
	
	
	
	
	// ADS8331RX Behavior
	
	//busy vs. go
	initial begin
		busy <=1;
	end
	
	always begin
	
		@(posedge go) begin
			busy <=0;
			#445	busy<=1;

		end
	
	end
	
	
	

	
	
	ads8331ctrl UUT_ADS8331CTRL(
		.run(run),
		.update(update),  // auto-count 0~255
		.ch1(ch1),
		.ch2(ch2),
		.ch3(ch3),
		.ch4(ch4),		
		.go(go),  
		.busy(busy),
		.command(command), // CMR(4 bits) + CFR(12 bits)
		.number_of_sclk(number_of_sclk),
		.adc_read_result(adc_read_result),
		.sysrst(sysrst), 
		.clk(clk)
		);

endmodule


