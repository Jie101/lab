// Jie
// Jie
// 16 bit Subtractor

module subtractor16b(

	output	[15:0]	s,
	output	co, //Carry output
	
	input	[15:0]	a,
	input	[15:0]	b,
	input	ci	// Carry input

);

	wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c15,c14;
	wire [15:0] inv_b;
	
		assign inv_b = ~b;
	
	
		full_adder g0(
			.a(a[0]),
			.b(inv_b[0]),
			.s(s[0]),
			.ci(1'b1),
			.co(c0)
		);


		full_adder g1(
			.a(a[1]),
			.b(inv_b[1]),
			.s(s[1]),
			.ci(c0),
			.co(c1)
		);

		full_adder g2(
			.a(a[2]),
			.b(inv_b[2]),
			.s(s[2]),
			.ci(c1),
			.co(c2)
		);

		full_adder g3(
			.a(a[3]),
			.b(inv_b[3]),
			.s(s[3]),
			.ci(c2),
			.co(c3)
		);

		full_adder g4(
			.a(a[4]),
			.b(inv_b[4]),
			.s(s[4]),
			.ci(c3),
			.co(c4)
		);

		full_adder g5(
			.a(a[5]),
			.b(inv_b[5]),
			.s(s[5]),
			.ci(c4),
			.co(c5)
		);

		full_adder g6(
			.a(a[6]),
			.b(inv_b[6]),
			.s(s[6]),
			.ci(c5),
			.co(c6)
		);

		full_adder g7(
			.a(a[7]),
			.b(inv_b[7]),
			.s(s[7]),
			.ci(c6),
			.co(c7)
		);

		full_adder g8(
			.a(a[8]),
			.b(inv_b[8]),
			.s(s[8]),
			.ci(c7),
			.co(c8)
		);

		full_adder g9(
			.a(a[9]),
			.b(inv_b[9]),
			.s(s[9]),
			.ci(c8),
			.co(c9)
		);
		
		full_adder g10(
			.a(a[10]),
			.b(inv_b[10]),
			.s(s[10]),
			.ci(c9),
			.co(c10)
		);
		
		full_adder g11(
			.a(a[11]),
			.b(inv_b[11]),
			.s(s[11]),
			.ci(c10),
			.co(c11)
		);

		full_adder g12(
			.a(a[12]),
			.b(inv_b[12]),
			.s(s[12]),
			.ci(c11),
			.co(c12)
		);

		full_adder g13(
			.a(a[13]),
			.b(inv_b[13]),
			.s(s[13]),
			.ci(c12),
			.co(c13)
		);

		full_adder g14(
			.a(a[14]),
			.b(inv_b[14]),
			.s(s[14]),
			.ci(c13),
			.co(c14)
		);
		
		
		full_adder g15(
			.a(a[15]),
			.b(inv_b[15]),
			.s(s[15]),
			.ci(c14),
			.co(co)
		);
	



endmodule