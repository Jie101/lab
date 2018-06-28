`timescale 1ns/100ps

module ads8331rx_tb();


	reg	clk;
	reg	sysrst;
	
	wire cs;
	wire cnv;
	wire sclk;
	wire sdi;
	wire busy;

	reg sdo;
	reg eoc;
	reg go;
	wire [15:0] adc_read_result;
	
	
	reg [15:0] adc2sdo;  // ADC
	reg [15:0] command;
	reg [4:0] number_of_sclk;
	
	
	
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
	
	
	

// ADS8331 Behavior


	// EOC
	initial begin
		eoc <=1'b1;		
	end
	
	always begin

			@(negedge cnv) begin
				eoc <=1'b0;
				#(PERIOD*21)  	eoc <=1'b1;			
			
			end
	end

	
	// SDO (ADC VALUE)
	always begin
		sdo <= 1'b0;	
		@(negedge cs) begin
			sdo <= 1'b0;		
			#(PERIOD*1) 	sdo <= adc2sdo[15];
			#(PERIOD*2) 	sdo <= adc2sdo[14];
			#(PERIOD*2) 	sdo <= adc2sdo[13];
			#(PERIOD*2) 	sdo <= adc2sdo[12];
			#(PERIOD*2) 	sdo <= adc2sdo[11];
			#(PERIOD*2) 	sdo <= adc2sdo[10];
			#(PERIOD*2) 	sdo <= adc2sdo[9];
			#(PERIOD*2) 	sdo <= adc2sdo[8];
			#(PERIOD*2) 	sdo <= adc2sdo[7];
			#(PERIOD*2) 	sdo <= adc2sdo[6];
			#(PERIOD*2) 	sdo <= adc2sdo[5];
			#(PERIOD*2) 	sdo <= adc2sdo[4];			
			#(PERIOD*2) 	sdo <= adc2sdo[3];
			#(PERIOD*2) 	sdo <= adc2sdo[2];
			#(PERIOD*2) 	sdo <= adc2sdo[1];				
			#(PERIOD*2) 	sdo <= adc2sdo[0];				
		    #(PERIOD*2)		sdo <= 1'b0;			

		end
		
	end
	
	
	
	initial begin
		go <=1'b0;
	end
	
	initial begin
			adc2sdo <= 16'h0000;  
						
			#(PERIOD*100)	go<=1'b1;  adc2sdo <= 16'ha001;  number_of_sclk<=5'd16;		command<= 16'b1110_0110_1111_1101;   // WRITE CFR
			#(PERIOD*3)		go<=1'b0;
			
			
			
			#(PERIOD*100)	go<=1'b1;  adc2sdo <= 16'hb002;  number_of_sclk<=5'd4;		command<= 16'b0000_0000_0000_0000;	// MUX 000
			#(PERIOD*3)		go<=1'b0;
			
			#(PERIOD*100)	go<=1'b1;  adc2sdo <= 16'hc003;  number_of_sclk<=5'd16;		command<= 16'b1101_0000_0000_0000;	// READ 000
			#(PERIOD*3)		go<=1'b0;
			
			
	
	
			#(PERIOD*100)	go<=1'b1;  adc2sdo <= 16'hd004;  number_of_sclk<=5'd4;		command<= 16'b0001_0000_0000_0000;   // MUX 001
			#(PERIOD*3)		go<=1'b0;

			#(PERIOD*100)	go<=1'b1;  adc2sdo <= 16'he005;  number_of_sclk<=5'd16;		command<= 16'b1101_0000_0000_0000;	// READ 001
			#(PERIOD*3)		go<=1'b0;

			
			
			
			#(PERIOD*100)	go<=1'b1;  adc2sdo <= 16'hf006;  number_of_sclk<=5'd4;		command<= 16'b0010_0000_0000_0000;   // MUX 010
			#(PERIOD*3)		go<=1'b0;			

			#(PERIOD*100)	go<=1'b1;  adc2sdo <= 16'hf007;  number_of_sclk<=5'd16;		command<= 16'b1101_0000_0000_0000;	// READ 010
			#(PERIOD*3)		go<=1'b0;		
			
			
			
			
			
			#(PERIOD*100)	go<=1'b1;  adc2sdo <= 16'hf008;  number_of_sclk<=5'd4;		command<= 16'b0011_0000_0000_0000;   // MUX 011
			#(PERIOD*3)		go<=1'b0;			

			#(PERIOD*100)	go<=1'b1;  adc2sdo <= 16'hf009;  number_of_sclk<=5'd16;		command<= 16'b1101_0000_0000_0000;	// READ 011
			#(PERIOD*3)		go<=1'b0;				
			
			
			
	end


	

	
	
	ads8331rx UUT_ADS8331RX(
		.sclk(sclk), 
		.cnv(cnv), 
		.cs(cs), 
		.sdi(sdi), 
		.sdo(sdo), 
		.eoc(eoc), 
		.busy(busy), 
		.go(go), 
		.command(command), 
		.number_of_sclk(number_of_sclk),
		.adc_read_result(adc_read_result),
		.sysrst(sysrst), 
		.clk(clk)
		);

endmodule


