// Jie, 
// Simple Moving Average(SMA)
// n=16

module smv16b(

	output	[15:0]	dout_inst,
	output	reg [15:0]	dout_avg,

	input 	[15:0]	din,
	input 	run,
	// ckt
	input	sysrst,		
	input	clk	
);


	reg[2:0] state;
	parameter s0	=3'b000;
	parameter s1	=3'b001;
	parameter s2	=3'b010;
	parameter s3	=3'b011;
	parameter s4	=3'b100;
	parameter s5	=3'b101;	


	
	
	
	reg [15:0] p,p0,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15;
	reg [3:0] cnt;
	reg [4:0] delay;
	
	reg  [31:0] r_sum_i, r_sum_r, r_sum_o;	
	wire [31:0] sum_i,sum_r, sum_o;

	wire [2:0] co;

	
	
	// FSM1 Sequency
	always@(posedge clk) begin
		if(~sysrst) begin
			state <=s0;
			cnt <=0;
			delay<=0;
		
		end else begin
		
			case (state) 
			
				s0 :	// wait RUN
						begin
							cnt <=0;
							delay<=0;
							if(~sysrst) begin
								state <=s0;
							end else begin
								state <=s1;
							end
								
						end
						
						
				s1:		// check "run" status
						begin
							if(run) begin
								state <=s2; // begin...
							end else begin
								state <=s0;
							end						
						end
				
						
						
						
						
						
				s2:		// feed data to pipeline.
						begin
							cnt <=0;
							state <= s3;
						end
			
			
			
			
			
				s3:		// waiting sum_i, sum_r result.
						begin
						
						//	if(delay < 4'b1100) begin
						//		delay <= delay +1;
						//		state <= s3;
						//	end else begin
								state <= s4;
						//	end
						
						end
						
			
				s4:		// change MUX		
						begin
						
							if(cnt < 4'd15) begin
								cnt <= cnt +1;
								delay <=0;
								state <= s3;
							end else begin
								state <= s5;	
							end

						end
						
			
			
			
			
			
				s5:		// waiting sum_o result.
						begin
						
						//	if(delay < 4'b1100) begin
						//		delay <= delay +1;
						//		state <= s4;
						//	end else begin
								state <= s1;
						//	end
							
						end
						

			
			
				default :	begin
							end
			
			endcase
		
		
		
		end
	
	
	end
	
	
	
	
	
	
	
	
	// FSM1 Output logic w/ DFF
	assign  dout_inst = p15;
	
	always@(posedge clk) begin
	
		if(~sysrst) begin
		
				p15	<=0;
				p14 <=0;
				p13 <=0;
				p12 <=0;
				p11 <=0;
				p10 <=0;
				p9 	<=0;
				p8 	<=0;
				p7 	<=0;
				p6 	<=0;
				p5  <=0;
				p4  <=0;
				p3  <=0;
				p2  <=0;
				p1  <=0;
				p0  <=0;	
				
				r_sum_i	<=0;	
				r_sum_r	<=0;	
				r_sum_o	<=0;				
		
		end else begin
		
			case (state) 
			
				s0:	begin
					end
				
				
				s1: begin
					end
				
				
			
				s2:	begin
						p0	<= din;
						p1	<=p0;
						p2	<=p1;			
						p3	<=p2;
						p4	<=p3;		
						p5	<=p4;
						p6	<=p5;		
						p7	<=p6;
						p8	<=p7;		
						p9	<=p8;
						p10	<=p9;		
						p11	<=p10;
						p12	<=p11;		
						p13	<=p12;
						p14	<=p13;		
						p15	<=p14;					
					end
					
					
					
				s3:	begin				
					end
					
					
					
				s4:	begin
						r_sum_i <= sum_i;
						r_sum_r <= sum_r;				
				
					end
					
				s5: begin
						r_sum_i <= 0;
						r_sum_r <= 0;
						dout_avg <= sum_o[15:0];
					end



				default:	begin
							end
			
			
			
			endcase
		
		
		
		end
	
	
	
	end
	
	
	// mux
	always@(*) begin
		case (cnt)
			4'd0:	p =p0;
			4'd1:	p =p1;
			4'd2:	p =p2;
			4'd3:	p =p3;
			4'd4:	p =p4;
			4'd5:	p =p5;						
			4'd6:	p =p6;
			4'd7:	p =p7;
			4'd8:	p =p8;
			4'd9:	p =p9;
			4'd10:	p =p10;
			4'd11:	p =p11;
			4'd12:	p =p12;
			4'd13:	p =p13;
			4'd14:	p =p14;
			4'd15:	p =p15;		
		endcase
	end
	
	

	
	// Part of Interger
	adder32b ADDER_I(
		.s(sum_i),
		.co(co[0]),
		.a( {20'b0000_0000_0000_0000_0000,p[15:4]} ),
		.b(r_sum_i),
		.ci(1'b0)
	);
	
	
	// Part of Remainder
	adder32b ADDER_R(
		.s(sum_r),
		.co(co[1]),
		.a( {28'b0000_0000_0000_0000_0000_0000_0000, p[3:0]} ),
		.b(r_sum_r),
		.ci(1'b0)						
	);	
	
	

	
	// Interger + Remainder	
	adder32b ADDER_O(
		.s(sum_o),
		.co(co[2]),
		.a(r_sum_i),
		.b( {4'b000,r_sum_r[31:4]} ),
		.ci(1'b0)						
	);		
	
	
	

	


endmodule