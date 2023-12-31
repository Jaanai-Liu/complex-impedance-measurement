`timescale 1ns/1ps

module cordic_tb();

parameter PERIOD = 10;
reg clk;
reg rst_n;
reg signed [31:0] x;
reg signed [31:0] y;
reg start;
wire signed [31:0] 	angle;
wire signed [31:0] 	mozhi;
wire finished;
initial begin
	clk = 0;
	rst_n = 0;
	x = 'b0;
	y = 'b0;
	start = 0;
	#100 rst_n = 1;

	#10 @(posedge clk) start = 1;	x = 9'd100 ; 	y = {1'b1, 22'b0, 9'd100} ;
	#10 @(posedge clk) 				x = 9'd10; 		y = 9'd10;
	#10 @(posedge clk) 				x = 9'd3 ; 		y = 9'd4 ;
	#10 @(posedge clk) 				x = 9'd6 ; 		y = 9'd8 ;
    #10 @(posedge clk) 				x = 15'd373 ; 		y = 15'd818 ;
    #10 @(posedge clk) 				x = 15'd818 ; 		y = 15'd373 ;
	start = 0;
	#100000 $stop;	
end

always #(PERIOD/2) clk = ~clk;

cordic inst1(
		.clk(clk),
		.rst_n(rst_n),
		.x(x),
		.y(y),
		.start(start),
		
		.angle(angle),
		.mozhi(mozhi),
		.finished(finished)
		
);
endmodule

