`timescale 1ns/100ps

module adder32b_tb();


	reg [31:0]	a,b;
	reg ci;
	
	wire [31:0] s;
	wire co;


	initial	begin
		#0				a<=0;  	b<=0;  		ci<=0;
		#500			a<=32'd110;  	b<=32'd12;  		ci<=1'b0;
		#500			a<=32'd89;  	b<=32'd999;  		ci<=1'b0;
		#500			a<=32'd1;  		b<=32'd1;  			ci<=1'b0;

		#500			a<=32'd0;  		b<=32'd0;  			ci<=1'b0;
		#500			a<=32'd44550;  	b<=32'd6677;  		ci<=1'b0;
		#500			a<=32'd11;  	b<=32'd6533;  		ci<=1'b0;
		#500			a<=32'd4455;  	b<=32'd7788;  		ci<=1'b1;	
	
	end


	adder32b UUT_addr32b(
		.a(a),
		.b(b),
		.s(s),
		.ci(ci),
		.co(co)
	);
	


endmodule