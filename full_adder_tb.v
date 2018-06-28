`timescale 1ns/100ps

module full_adder_tb();


	reg a,b,ci;
	wire s,co;


	initial	begin
		#0				a<=1'b0;  b<=1'b0;  ci<=1'b0;
		#100			a<=1'b0;  b<=1'b1;  ci<=1'b0;
		#100			a<=1'b1;  b<=1'b0;  ci<=1'b0;
		#100			a<=1'b1;  b<=1'b1;  ci<=1'b0;

		#100			a<=1'b0;  b<=1'b0;  ci<=1'b1;
		#100			a<=1'b0;  b<=1'b1;  ci<=1'b1;
		#100			a<=1'b1;  b<=1'b0;  ci<=1'b1;
		#100			a<=1'b1;  b<=1'b1;  ci<=1'b1;	
	
	end


	full_adder UUT_full_adder(
		.a(a),
		.b(b),
		.s(s),
		.ci(ci),
		.co(co)
	);
	
	

endmodule