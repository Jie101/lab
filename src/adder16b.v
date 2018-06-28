// Jie
// 16 bit adder

module adder16b(

	output	[15:0]	s,
	output	co, //Carry output
	
	input	[15:0]	a,
	input	[15:0]	b,
	input	ci	// Carry input

);

	wire [15:0] carry;
	
	assign co = carry[15];
	
		full_adder g0(
			.a(a[0]),
			.b(b[0]),
			.s(s[0]),
			.ci(ci),
			.co(carry[0])
		);


		full_adder g1(
			.a(a[1]),
			.b(b[1]),
			.s(s[1]),
			.ci(carry[0]),
			.co(carry[1])
		);

		full_adder g2(
			.a(a[2]),
			.b(b[2]),
			.s(s[2]),
			.ci(carry[1]),
			.co(carry[2])
		);

		full_adder g3(
			.a(a[3]),
			.b(b[3]),
			.s(s[3]),
			.ci(carry[2]),
			.co(carry[3])
		);

		full_adder g4(
			.a(a[4]),
			.b(b[4]),
			.s(s[4]),
			.ci(carry[3]),
			.co(carry[4])
		);

		full_adder g5(
			.a(a[5]),
			.b(b[5]),
			.s(s[5]),
			.ci(carry[4]),
			.co(carry[5])
		);

		full_adder g6(
			.a(a[6]),
			.b(b[6]),
			.s(s[6]),
			.ci(carry[5]),
			.co(carry[6])
		);

		full_adder g7(
			.a(a[7]),
			.b(b[7]),
			.s(s[7]),
			.ci(carry[6]),
			.co(carry[7])
		);

		full_adder g8(
			.a(a[8]),
			.b(b[8]),
			.s(s[8]),
			.ci(carry[7]),
			.co(carry[8])
		);

		full_adder g9(
			.a(a[9]),
			.b(b[9]),
			.s(s[9]),
			.ci(carry[8]),
			.co(carry[9])
		);
		
		full_adder g10(
			.a(a[10]),
			.b(b[10]),
			.s(s[10]),
			.ci(carry[9]),
			.co(carry[10])
		);
		
		full_adder g11(
			.a(a[11]),
			.b(b[11]),
			.s(s[11]),
			.ci(carry[10]),
			.co(carry[11])
		);

		full_adder g12(
			.a(a[12]),
			.b(b[12]),
			.s(s[12]),
			.ci(carry[11]),
			.co(carry[12])
		);

		full_adder g13(
			.a(a[13]),
			.b(b[13]),
			.s(s[13]),
			.ci(carry[12]),
			.co(carry[13])
		);

		full_adder g14(
			.a(a[14]),
			.b(b[14]),
			.s(s[14]),
			.ci(carry[13]),
			.co(carry[14])
		);
		
		
		full_adder g15(
			.a(a[15]),
			.b(b[15]),
			.s(s[15]),
			.ci(carry[14]),
			.co(carry[15])
		);
	



endmodule