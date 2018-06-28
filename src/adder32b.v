// Jie
// 16 bit adder

module adder32b(

	output	[31:0]	s,
	output	co, //Carry output
	
	input	[31:0]	a,
	input	[31:0]	b,
	input	ci	// Carry input

);

	wire [31:0] carry;
	
	assign co = carry[31];
	
	
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
	
	
	// 
	

		full_adder g16(
			.a(a[16]),
			.b(b[16]),
			.s(s[16]),
			.ci(carry[15]),
			.co(carry[16])
		);


		full_adder g17(
			.a(a[17]),
			.b(b[17]),
			.s(s[17]),
			.ci(carry[16]),
			.co(carry[17])
		);

		full_adder g18(
			.a(a[18]),
			.b(b[18]),
			.s(s[18]),
			.ci(carry[17]),
			.co(carry[18])
		);

		full_adder g19(
			.a(a[19]),
			.b(b[19]),
			.s(s[19]),
			.ci(carry[18]),
			.co(carry[19])
		);

		full_adder g20(
			.a(a[20]),
			.b(b[20]),
			.s(s[20]),
			.ci(carry[19]),
			.co(carry[20])
		);

		full_adder g21(
			.a(a[21]),
			.b(b[21]),
			.s(s[21]),
			.ci(carry[20]),
			.co(carry[21])
		);

		full_adder g22(
			.a(a[22]),
			.b(b[22]),
			.s(s[22]),
			.ci(carry[21]),
			.co(carry[22])
		);

		full_adder g23(
			.a(a[23]),
			.b(b[23]),
			.s(s[23]),
			.ci(carry[22]),
			.co(carry[23])
		);

		full_adder g24(
			.a(a[24]),
			.b(b[24]),
			.s(s[24]),
			.ci(carry[23]),
			.co(carry[24])
		);

		full_adder g25(
			.a(a[25]),
			.b(b[25]),
			.s(s[25]),
			.ci(carry[24]),
			.co(carry[25])
		);
		
		full_adder g26(
			.a(a[26]),
			.b(b[26]),
			.s(s[26]),
			.ci(carry[25]),
			.co(carry[26])
		);
		
		full_adder g27(
			.a(a[27]),
			.b(b[27]),
			.s(s[27]),
			.ci(carry[26]),
			.co(carry[27])
		);

		full_adder g28(
			.a(a[28]),
			.b(b[28]),
			.s(s[28]),
			.ci(carry[27]),
			.co(carry[28])
		);

		full_adder g29(
			.a(a[29]),
			.b(b[29]),
			.s(s[29]),
			.ci(carry[28]),
			.co(carry[29])
		);

		full_adder g30(
			.a(a[30]),
			.b(b[30]),
			.s(s[30]),
			.ci(carry[29]),
			.co(carry[30])
		);
		
		
		full_adder g31(
			.a(a[31]),
			.b(b[31]),
			.s(s[31]),
			.ci(carry[30]),
			.co(carry[31])
		);

endmodule