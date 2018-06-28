// Jie, 2018 JAN 

module ads8331rx(
	

	
	// SPI	
	output	reg sclk,
	output	reg cnv,
	output	reg cs,	// low avtive
	output	sdi,
	input	sdo,
	input	eoc,  // end-of-convert
	
	// Ctrl
//	input	sync_cnv,
    output	busy,  // low active
    input	go,  // 0:STOP, 1:RNU

    input	[15:0]	command, // CMR(4 bits) + CFR(12 bits)
	input	[4:0]	number_of_sclk,
	output	reg [15:0]  adc_read_result,
	
	input	sysrst,		
	input	clk			
    );
    
	


	

	
    reg[2:0]	state0;
    parameter	S0_SPI=3'b000;
    parameter	S1_SPI=3'b001;
    parameter	S2_SPI=3'b010;
    parameter	S3_SPI=3'b011;
    parameter	S4_SPI=3'b100;
    parameter	S5_SPI=3'b101;              
    parameter	S6_SPI=3'b110;  	
    parameter	S7_SPI=3'b111; 	

    
    reg	[4:0]	cnt;
	reg [2:0]	dly;
	reg [16:0]  buffer_cmd;
	reg [15:0]  buffer_adc;

	
	reg	go_spi;
	reg go_spi_clear;

	
	assign sdi = buffer_cmd[16]; 
	assign busy = go_spi;
		
	// Monitor
	always@(posedge clk) begin
		if(sysrst || go_spi_clear) begin
			go_spi <=1'b1;
		end else begin
		
			if(go) begin
				go_spi <=1'b0;			
			end
		
		end
	end
	
	
	// FSM: Serial interface
    //state register + next state logic
    always@(posedge clk) begin
    	if(sysrst) begin
    		state0 <= S0_SPI;
			cnt<=0;
			dly <=0;

			
    	end else begin
    		case(state0)
    			S0_SPI:	begin	// Begin SPI 
    						if(~go_spi) begin
    							state0 <= S1_SPI;
							end else begin
								state0 <= S0_SPI;
							end
    					end
    		
    		
    			S1_SPI:	begin
							cnt <= number_of_sclk;
							state0 <= S2_SPI;
    					end
    		

			
    			S2_SPI:	begin  
							if(dly == 3'b100) begin
								if(eoc) begin
									state0 <= S3_SPI;
								end else begin
									state0 <= S2_SPI;
								end
							
							end else begin
								dly <= dly +1;
								state0 <= S2_SPI;
							end
    						
    					end
    		
			
			
			
				S3_SPI: begin	// cs -> low
							dly <=0;
							state0 <= S4_SPI;		
						end
			
			
    			S4_SPI:	begin  // sclk  1->0
    						state0 <= S5_SPI;		
    					end    		
    		
    			S5_SPI:	begin  // sclk  0->1
    						if(cnt == 5'b00001) begin
    							state0 <= S6_SPI;	
    						end else begin
								cnt <= cnt -1;
    							state0 <= S4_SPI; 
    						end			
    					end        		
    					
    					
    			S6_SPI:	begin // cs --> high
    						state0 <= S7_SPI;
    					end		
    					
						
						
    			S7_SPI:	begin // SPI DONE
    						state0 <= S0_SPI;
    					end							
						
						
    			default: begin
    						state0 <= S0_SPI;
    					 end 		
    		
    		endcase
  
    	end
    
    
    end
	
	
	
    
    // output logic w/ dff
    always@(posedge clk) begin
		if(sysrst) begin
			sclk <=1;
			cs <=1;
			buffer_adc<=0;
			buffer_cmd <=0;
			adc_read_result <=0;
			go_spi_clear<=1'b0;
			cnv <=1'b1;

			
			
		end else begin
    		case(state0)
    			S0_SPI:	begin
							buffer_adc <=16'b0000000000000000;
							buffer_cmd <={1'b0, command};
    					end
    			
    			S1_SPI:	begin							
    					end
    					
						
    			S2_SPI:	begin	
							if(dly < 3'b011) begin
								if(command[15:12]== 4'b1101) begin  // Only "Read data" able to generator CNV signal
									cnv <=1'b0;
								end		
							end else begin	
								cnv <=1'b1;
							end
						end

    					
						
				S3_SPI: begin
							cs <=0;
							sclk <=0;
							buffer_cmd <= {buffer_cmd[15:0], 1'b0};		

						end
						
						
						
    			S4_SPI:	begin
    						sclk <=1;
    					end
    					    			
    			S5_SPI:	begin
							sclk <=0;
							buffer_adc <= {buffer_adc[14:0], sdo};
							buffer_cmd <= {buffer_cmd[15:0], 1'b0};								
    					end
    					  
						  
    			S6_SPI:	begin
							cs <=1;
							sclk <=1;
							adc_read_result <= buffer_adc;
							go_spi_clear<=1'b1;
    					end  
						
						
    			S7_SPI:	begin						
							go_spi_clear<=1'b0;		
						end
						
						
						
						
    					
    			default: begin
    					 end			
    		endcase
    	end
    end    
    

    
	
	
	
	

   
    
    
endmodule




