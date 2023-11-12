/************************************************************\
 **     Copyright (c) 2012-2023 Anlogic Inc.
 **  All Right Reserved.\
\************************************************************/
/************************************************************\
 ** Log	:	This file is generated by Anlogic IP Generator.
 ** File	:	E:/project/dds/al_ip/rom_dac.v
 ** Date	:	2023 09 13
 ** TD version	:	5.6.71036
\************************************************************/

`timescale 1ns / 1ps

module rom_dac ( doa, addra, clka );

	output [7:0] doa;

	input  [10:0] addra;
	input  clka;



	EG_LOGIC_BRAM #( .DATA_WIDTH_A(8),
				.ADDR_WIDTH_A(11),
				.DATA_DEPTH_A(2048),
				.DATA_WIDTH_B(8),
				.ADDR_WIDTH_B(11),
				.DATA_DEPTH_B(2048),
				.MODE("SP"),
				.REGMODE_A("NOREG"),
				.IMPLEMENT("9K"),
				.DEBUGGABLE("NO"),
				.PACKABLE("NO"),
				.INIT_FILE("../src/dds_2048x8b_wave.mif"),
				.FILL_ALL("NONE"))
			inst(
				.dia({8{1'b0}}),
				.dib({8{1'b0}}),
				.addra(addra),
				.addrb({11{1'b0}}),
				.cea(1'b1),
				.ceb(1'b0),
				.ocea(1'b0),
				.oceb(1'b0),
				.clka(clka),
				.clkb(1'b0),
				.wea(1'b0),
				.web(1'b0),
				.bea(1'b0),
				.beb(1'b0),
				.rsta(1'b0),
				.rstb(1'b0),
				.doa(doa),
				.dob());


endmodule