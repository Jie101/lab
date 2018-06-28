`timescale 1ns/100ps


module smv16b_tb();

	// ~~
	reg clk, sysrst;
	reg run;
	
	initial begin
		#0		sysrst=0;  clk=0;
		#200	sysrst=1;
	end

	
	
	

	always begin
		#10	clk=~clk;
	end
	
	
	initial begin
		#0		run=0;
		#1000	run=1;
	end
	
	
	
	
	
	// read file
	integer data_file,i,cnt;
	reg [16:0] value;


	initial begin
		data_file = $fopen("wave.txt","r");
	    i=0;

		#1010;
		
		
			while(! $feof(data_file)) begin
		//		@(negedge clk) begin
					if(~sysrst) begin
						value =0;
					end else begin
						cnt=$fscanf(data_file,"%d",value);
					//	$display("i:%d %d\n",i,value);
						i=i+1;	
					end
		//		end
			#700;
			end

		
		$fclose(data_file);
	
	end
	
	
	

	
	
	// UUT
	wire [15:0] dout_inst, dout_avg;

	smv16b UUT_SMV(
		.dout_inst(dout_inst),
		.dout_avg(dout_avg),
		.din(value),
//		.din( {16'd699} ),
		.run(run),
		.sysrst(sysrst),		
		.clk(clk)	
	);


endmodule