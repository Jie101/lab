// Jie 
// 1 bit Full Adder

module full_adder(

	output	s,
	output	co, //Carry output
	
	input	a,
	input	b,
	input	ci	// Carry input
);

	wire x;
	wire y;
	wire z;
	
	
	assign x = a ^ b;
	assign s = x ^ ci;
	assign y = x & ci;
	assign z = a & b;
	assign co = y | z;


endmodule
