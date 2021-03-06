module shift_regiter_8bit_tb();

	reg [7:0] parallel_load;
	reg msb,clock;
	reg [1:0] control;
	wire lsb;
	wire [7:0] parallel_read;
	/* control
		00	right shift
		01	left shift
		10	parallel load
	*/

	shift_register_8bits s1(.lsb(lsb),.msb(msb),.control(control),.clock(clock),.parallel_load(parallel_load),.parallel_read(parallel_read));

	initial
	begin
	msb=0;

	#5 clock=0;
	parallel_load=8'b01101001;
	control=2'b10;
	#5 clock=1;

	#5 clock=0;
	control=2'b00;
	#5 clock=1;

	#5 clock=0;
	control=2'b01;
	#5 clock=1;
	
	end

endmodule
	

