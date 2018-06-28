`timescale 1ns/100ps

module add_test_tb();

	
	reg [15:0] a,b,c;	
	
	initial begin
		#0		a =16'd34;   b =16'd88;
		#500	a =16'd34;   b =16'd88;
		#800	a =16'd134;  b =16'd78;
		#900	a =16'd234;  b =16'd58;	
	
	end
	

	
	

	add_test UUT_ADD(
		.A(a),
		.B(b),
		.C(s)
	);
	

endmodule

