
module add_test(

	input	[15:0] A,
	input  	[15:0] B,
	output  [15:0] S
);



c_addsub_0 ADD_FABRIC(
  .A(A),  // input wire [15 : 0] A
  .B(B),  // input wire [15 : 0] B
  .S(S)  // output wire [15 : 0] S
);




endmodule