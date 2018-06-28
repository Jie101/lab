// Jie
// RST_N delay locked signal 32 cycles.

module ctrled_rst(
	output	reg rst_n,
	input	locked,   // signal from PLL
	input	clk
    );
	
	
	parameter delay_cycle = 8'd32;
	reg [7:0] cnt;
	
	
	always@(posedge clk) begin
	
		if(~locked) begin
			cnt <= 8'd0;
			rst_n <=1'b0;
		
		end else begin
		
			if(cnt < delay_cycle) begin
				cnt <= cnt +1;
				rst_n <=1'b0;
			end else begin
			    rst_n <=1'b1;
			end
		
		end
	
	end
	
endmodule
