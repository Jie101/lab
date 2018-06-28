`timescale 1ns/100ps

module math_tb();


	// system reset
	reg sysrst;
	
	initial begin
		#0;
		sysrst <=0;
		#200;
		sysrst <=1;
	end


	// clk
	reg	clk;
	
	initial begin
		clk <=0;
	end
	
	always 	#10 clk <= ~clk;





	reg	[31:0]	a;
	reg [31:0]  b;
	reg [15:0]	x;  // range: 0-65535
	wire [15:0]  y; // result: float to fixed
	
	reg	tvalid;
	wire rvalid;
	
	reg [3:0] iid;
	wire [3:0] oid;
	
	
	linear_function linear_function (
		.y(y),		// Result: y=a*x+b
		.x(x),		// range: 0-65535		
		.a(a),		// single precision floating point.
		.b(b),		// single precision floating point.
		.tvalid(tvalid),
		.rvalid(rvalid),
		.iid(iid),
		.oid(oid),
		.sysrst(sysrst),
		.clk(clk)
	);	
	
	
	// data
	initial begin
		#0;
		tvalid <=0;
		a <= 32'h3f800000; // 1.00
		b <= 32'h3f800000; // 1.00
		x <= 16'h0035;
		iid <=4'hf;
		
		
		
		
		#540;
		tvalid <=1;
	
		a <=32'h3f8e353f;  // 1.111
		b <=32'h40a00000;  // 5.00
		iid <=4'h0;
		
		#20;
		a <=32'h400e353f;  // 2.222
		b <=32'h3fe53f7d;  // 1.791
		iid <=4'h1;
		
		#20;
		a <=32'h40554fdf;  // 3.333
		b <=32'h40551eb8;  // 3.33
		iid <=4'h2;
		
		#20;
		a <=32'h408e353f;  // 4.444
		b <=32'h408e353f;  // 4.444
		iid <=4'h3;
		
		#20;
		a <=32'h40b1c28f;  // 5.555
		b <=32'h3f4a7efa;  //0.791		
		iid <=4'h4;
		
		#20;
		a <=32'h40d54fdf;  // 6.666
		b <=32'h3f7db22d;  // 0.991
		iid <=4'h5;
		
		#20;
		a <=32'h40f8dd2f;  // 7.777
		b <=32'h42078d50;  // 33.888
		iid <=4'h6;
		
		#20;
		a <=32'h410e353f;  // 8.888
		b <=32'h42c7c6a8;  //99.888		
		iid <=4'h7;


		#20;		
		tvalid <=0;
		iid <=4'hf;

	end
	

endmodule