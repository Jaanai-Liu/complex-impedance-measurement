--------------------------------------------------------------
 --     Copyright (c) 2012-2023 Anlogic Inc.
 --  All Right Reserved.
--------------------------------------------------------------
 -- Log	:	This file is generated by Anlogic IP Generator.
 -- File	:	E:/project/dds/al_ip/rom_dac.vhd
 -- Date	:	2023 09 13
 -- TD version	:	5.6.71036
--------------------------------------------------------------

LIBRARY ieee;
USE work.ALL;
	USE ieee.std_logic_1164.all;
LIBRARY eagle_macro;
	USE eagle_macro.EAGLE_COMPONENTS.all;

ENTITY rom_dac IS
PORT (
	doa		: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

	addra	: IN STD_LOGIC_VECTOR(10 DOWNTO 0);
	clka		: IN STD_LOGIC
	);
END rom_dac;

ARCHITECTURE struct OF rom_dac IS

	BEGIN
	inst : EG_LOGIC_BRAM
		GENERIC MAP (
			DATA_WIDTH_A	=> 8,
			ADDR_WIDTH_A	=> 11,
			DATA_DEPTH_A	=> 2048,
			DATA_WIDTH_B	=> 8,
			ADDR_WIDTH_B	=> 11,
			DATA_DEPTH_B	=> 2048,
			MODE			=> "SP",
			REGMODE_A	=> "NOREG",
			IMPLEMENT	=> "9K",
			DEBUGGABLE	=> "NO",
			PACKABLE		=> "NO",
			INIT_FILE	=> "../src/dds_2048x8b_wave.mif",
			FILL_ALL		=> "NONE"
		)
		PORT MAP (
			dia		=> (others=>'0'),
			dib		=> (others=>'0'),
			addra	=> addra,
			addrb	=> (others=>'0'),
			cea		=> '1',
			ceb		=> '0',
			clka		=> clka,
			clkb		=> '0',
			web		=> '0',
			rsta		=> '0',
			rstb		=> '0',
			doa		=> doa,
			dob		=> OPEN,
			ocea		=> '0',
			oceb		=> '0'
		);

END struct;
