// Jie
// y=ax+b

module linear_function(
	output	[15:0]  y,		// Result: y=a*x+b
	input	[15:0]	x,		// range: 0-65535	
	input	[31:0]	a,		// single precision floating point.
	input	[31:0]	b,		// single precision floating point.
	input	tvalid,
	output	rvalid,
	input  	[3:0] iid,
	input	[3:0] oid,
	input	sysrst,
	input	clk
);



	reg [31:0]	a1,a2,a3,a4,a5,a6;
	reg [31:0]  b1,b2,b3,b4,b5,b6,b7,b8,b9,b10,b11,b12,b13,b14;
	reg va1,va2,va3,va4,va5,va6;
	reg vb1,vb2,vb3,vb4,vb5,vb6,vb7,vb8,vb9,vb10,vb11,vb12,vb13,vb14;
	
	reg [3:0] id1,id2,id3,id4,id5,id6,id7,id8,id9,id10,id11,id12,id13,id14,id15,id16,id17,id18,id19,id20,id21,id22,id23,id24,id25,id26,id27,id28,id29,id30,id31;


	// a
	// input pipe
	always@(posedge clk) begin
		if(~sysrst) begin
			a1 <= 0;
			a2 <= 0;
			a3 <= 0;
			a4 <= 0;
			a5 <= 0;
			a6 <= 0;	
	
		end else begin
		
			a1 <= a;
			a2 <= a1;
			a3 <= a2;
			a4 <= a3;
			a5 <= a4;
			a6 <= a5;		
			
		end

	end
	
	// b
	// input pipe
	always@(posedge clk) begin
		if(~sysrst) begin
			b1 <= 0;
			b2 <= 0;
			b3 <= 0;
			b4 <= 0;
			b5 <= 0;
			b6 <= 0;		
			b7 <= 0;
			b8 <= 0;
			b9 <= 0;
			b10 <= 0;
			b11 <= 0;	
			b12 <= 0;
			b13 <= 0;
			b14 <= 0;
	
		end else begin
				
			b1 <= b;
			b2 <= b1;
			b3 <= b2;
			b4 <= b3;
			b5 <= b4;
			b6 <= b5;		
			b7 <= b6;
			b8 <= b7;
			b9 <= b8;
			b10 <= b9;
			b11 <= b10;	
			b12 <= b11;
			b13 <= b12;
			b14 <= b13;

		end

	end
	
	
	// a valid
	// input pipe
	always@(posedge clk) begin
		if(~sysrst) begin

			va1 <=0;
			va2 <=0;
			va3 <=0;
			va4 <=0;
			va5 <=0;
			va6 <=0;	

		end else begin
					
			va1 <= tvalid;
			va2 <= va1;
			va3 <= va2;
			va4 <= va3;
			va5 <= va4;
			va6 <= va5;	
	
		end

	end	


	// b valid
	// input pipe
	always@(posedge clk) begin
		if(~sysrst) begin

			vb1 <=0;
			vb2 <=0;
			vb3 <=0;
			vb4 <=0;
			vb5 <=0;
			vb6 <=0;	
			vb7 <=0;
			vb8 <=0;
			vb9 <=0;
			vb10 <=0;
			vb11 <=0;
			vb12 <=0;	
			vb13 <=0;
			vb14 <=0;

		end else begin

			vb1 <= tvalid;
			vb2 <= vb1;
			vb3 <= vb2;
			vb4 <= vb3;
			vb5 <= vb4;
			vb6 <= vb5;	
			vb7 <= vb6;
			vb8 <= vb7;
			vb9 <= vb8;
			vb10 <= vb9;
			vb11 <= vb10;
			vb12 <= vb11;	
			vb13 <= vb12;
			vb14 <= vb13;
	
		end

	end	
	

	always@(posedge clk) begin
		if(~sysrst) begin
			id1 <= 0;
			id2 <= 0;
			id3 <= 0;
			id4 <= 0;
			id5 <= 0;
			id6 <= 0;
			id7 <= 0;
			id8 <= 0;
			id9 <= 0;
			id10 <= 0;
			id11 <= 0;
			id12 <= 0;
			id13 <= 0;
			id14 <= 0;
			id15 <= 0;
			id16 <= 0;
			id17 <= 0;
			id18 <= 0;
			id19 <= 0;
			id20 <= 0;
			id21 <= 0;
			id22 <= 0;
			id23 <= 0;
			id24 <= 0;
			id25 <= 0;
			id26 <= 0;
			id27 <= 0;
			id28 <= 0;
			id29 <= 0;
			id30 <= 0;
			id31 <= 0;
		
		end else begin
			id1 <= iid;
			id2 <= id1;
			id3 <= id2;
			id4 <= id3;
			id5 <= id4;
			id6 <= id5;
			id7 <= id6;
			id8 <= id7;
			id9 <= id8;
			id10 <= id9;
			id11 <= id10;
			id12 <= id11;
			id13 <= id12;
			id14 <= id13;
			id15 <= id14;
			id16 <= id15;
			id17 <= id16;
			id18 <= id17;
			id19 <= id18;
			id20 <= id19;
			id21 <= id20;
			id22 <= id21;
			id23 <= id22;
			id24 <= id23;
			id25 <= id24;
			id26 <= id25;
			id27 <= id26;
			id28 <= id27;
			id29 <= id28;
			id30 <= id29;
			id31 <= id30;
		
		end
	
	end

	assign oid = id31;





	wire [31:0] int2f_x;
	wire int2f_valid;

	// non-blocking, latency:6
	floating_point_0_fixed2float fixed2float(
		  .aclk(clk),                                  // input wire aclk
		  .aresetn(sysrst),                            // input wire aresetn
		  .s_axis_a_tvalid(tvalid),            // input wire s_axis_a_tvalid
		  .s_axis_a_tdata({16'h0000,x}),              // input wire [31 : 0] s_axis_a_tdata
		  .m_axis_result_tvalid(int2f_valid),  // output wire m_axis_result_tvalid
		  .m_axis_result_tdata(int2f_x)    // output wire [31 : 0] m_axis_result_tdata
		);


	wire [31:0] mult_x;
	wire mult_valid;

	//non-blocking, latency: 8
	floating_point_0_multiply multiply(
	  .aclk(clk),                                  // input wire aclk
	  .aresetn(sysrst),                            // input wire aresetn
	  .s_axis_a_tvalid(va6),            // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(a6),              // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(int2f_valid),            // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(int2f_x),              // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_result_tvalid(mult_valid),  // output wire m_axis_result_tvalid
	  .m_axis_result_tdata(mult_x)    // output wire [31 : 0] m_axis_result_tdata
	);
	
	
	wire [31:0] adder_x;
	wire adder_valid;

	// non-blocking, latency:11
	floating_point_0_adder Adder (
	  .aclk(clk),                                  // input wire aclk
	  .aresetn(sysrst),                            // input wire aresetn
	  .s_axis_a_tvalid(mult_valid),            // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(mult_x),              // input wire [31 : 0] s_axis_a_tdata
	  .s_axis_b_tvalid(vb14),            // input wire s_axis_b_tvalid
	  .s_axis_b_tdata(b14),              // input wire [31 : 0] s_axis_b_tdata
	  .m_axis_result_tvalid(adder_valid),  // output wire m_axis_result_tvalid
	  .m_axis_result_tdata(adder_x)    // output wire [31 : 0] m_axis_result_tdata
	);

	wire [31:0] result_y;
	wire result_valid;

	// non-blocking, latency:6
	floating_point_0_float2fixed float2fixed (
	  .aclk(clk),                                  // input wire aclk
	  .aresetn(sysrst),                            // input wire aresetn
	  .s_axis_a_tvalid(adder_valid),            // input wire s_axis_a_tvalid
	  .s_axis_a_tdata(adder_x),              // input wire [31 : 0] s_axis_a_tdata
	  .m_axis_result_tvalid(result_valid),  // output wire m_axis_result_tvalid
	  .m_axis_result_tdata(result_y)    // output wire [31 : 0] m_axis_result_tdata
	);


	assign y = result_y[15:0];
	assign rvalid = result_valid;


endmodule