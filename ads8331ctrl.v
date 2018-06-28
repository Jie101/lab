// 


module ads8331ctrl(

	input	run,
	output	reg [7:0] update,  // auto-count 0~255
	
	output	reg [15:0] ch1,
	output	reg [15:0] ch2,
	output	reg [15:0] ch3,
	output	reg [15:0] ch4,	
	
	// ads8331rx
    output	reg go,  
    input	busy,
    output	reg	[15:0]	command, // CMR(4 bits) + CFR(12 bits)
	output	reg [4:0] number_of_sclk,
	input	[15:0]  adc_read_result,
	
	// ckt
	input	sysrst,		
	input	clk	
);

	
	
	reg [3:0]	state;
	parameter	S0=4'd0;
	parameter	S1=4'd1;
	parameter	S2=4'd2;
	parameter	S3=4'd3;
	parameter	S4=4'd4;
	parameter	S5=4'd5;
	parameter	S6=4'd6;	
	parameter	S7=4'd7;	

	
	
	reg [3:0]	ch;
	reg latch;
	
	
	
	// Latch w/ MUX
	always@(posedge latch) begin
		if(sysrst) begin
			ch1 <=0;
			ch2 <=0;
			ch3 <=0;
			ch4 <=0;
		
		end else begin
			
			case(latch)
			
				4'd0:	begin
							ch1 <= adc_read_result;
						end
				
				4'd1:	begin
							ch2 <= adc_read_result;
						end
						
				4'd2:	begin
							ch3 <= adc_read_result;
						end
				
				4'd3:	begin
							ch4 <= adc_read_result;
						end
				
				
				default: 	begin
							end
			
			
			endcase
		
		
		
		end
	
	
	end
	
	
	
	
	
	// FSM: MAIN SEQUENCY CONTROL
    //state register + next state logic	
	always@(posedge clk) begin
		if(sysrst) begin
			state <=S0;
		
		end else begin
		
			case(state)
			
				S0:	begin  // monitor "run" signal from CPU
						if(~run) begin
							state <= S0;  
						end else begin
							state <= S1;
						end
					
					end
				
				
				
				
				// CMD:1110(CFR WIRTE)
				S1:	begin	
						state <= S2;
					end
				
				S2:	begin	
						if(~busy) begin
							state <= S2;
						end else begin
							state <= S3;
						end
					end
					
					
					
				// CMD:MUX CHANNEL	
				S3:	begin	
						state <= S4;
					end
				
				S4:	begin	
						if(~busy) begin
							state <= S4;
						end else begin
							state <= S5;
						end
					end					
					
					
				// CMD:MUX READ ADC VALUE(CH0)	
				S5:	begin	
						state <= S6;
					end
				
				S6:	begin	
						if(~busy) begin
							state <= S6;
						end else begin
							state <= S7;
						end
					end	
					
					

				// NEXT
				S7:	begin
						if(~run && ch==4'b0011) begin
							state <= S0;  
						end else begin
							state <= S3; // LOOPS
						end		
					end
				
				
					
				default : 	begin
							end


				
			endcase
		
		end

	end
	
	
	// output logic w/ dff
	always@(posedge clk) begin
		if(sysrst) begin
			update <=8'd0;
			go <=1'b0;
			ch <=0;
			command <= 0;  
			number_of_sclk <= 0;	
			latch <=0;			
			
		
		end else begin
		
			case(state)
			
				S0:	begin  
						latch<=0;
					end
				
				
				
				
				S1:	begin	
						command <= 16'b1110_0110_1111_1101;  // CMR=1110, CFR=0110_1111_1101
						number_of_sclk <= 5'd16;
						ch <=0;
						go <=1'b1;
						
					end
				
				S2:	begin	
						go <=1'b0;
					end
					
					

					
					
					
				S3:	begin	
						command <= {ch, 12'b0000_0000_0000};  // CMR[15:12]=CHANNEL, CFR[11:0]=Don't care
						number_of_sclk <= 5'd4;
						go <=1'b1;
						latch<=0;
					end					
				
				S4:	begin	
						go <=1'b0;
					end		
					
					
					
					
					

				S5:	begin	
						command <= 16'b1101_0000_0000_0000;  // CMR=1101, CFR=Don't care
						number_of_sclk <= 5'd16;
						go <=1'b1;
					end		

				S6:	begin	
						go <=1'b0;
						
						if(busy) begin
							latch<=1;
						end
						
					end		
					
					

				
				S7:	begin	
						if(ch < 4'b0011) begin
							ch <= ch +1;
						//	latch<=1;
						end else begin
							ch <=0;
							update <= update +1;
						end
				
					end		


				default:	begin
							end

				
			endcase
		
		end

	end




endmodule
