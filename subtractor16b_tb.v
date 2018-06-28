	
`timescale 1ns/100ps

module subtractor16b_tb();


	reg [15:0]	a,b;
	reg ci;
	
	wire [15:0] s;
	wire co;


	initial	begin
		#0				a<=15'd90;  	b<=15'd70;  		ci<=1'b0;
		#500			a<=15'd110;  	b<=15'd12;  		ci<=1'b0;
		#500			a<=15'd89;  	b<=15'd999;  		ci<=1'b0;
		#500			a<=15'd1;  		b<=15'd1;  			ci<=1'b0;

		#500			a<=15'd0;  		b<=15'd0;  			ci<=1'b0;
		#500			a<=15'd44550;  	b<=15'd6677;  		ci<=1'b0;
		#500			a<=15'd11;  	b<=15'd6533;  		ci<=1'b0;
		#500			a<=15'd4455;  	b<=15'd7788;  		ci<=1'b1;	
	
	end


	subtractor16b UUT_subtractor16b(
		.a(a),
		.b(b),
		.s(s),
		.ci(ci),
		.co(co)
	);
	


endmodule