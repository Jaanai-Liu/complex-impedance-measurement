--------------------------------------------------------------
 --     Copyright (c) 2012-2023 Anlogic Inc.
 --  All Right Reserved.
--------------------------------------------------------------
 -- Log	:	This file is generated by Anlogic IP Generator.
 -- File	:	E:/project/dds/al_ip/dsp8.vhd
 -- Date	:	2023 10 03
 -- TD version	:	5.6.71036
--------------------------------------------------------------

LIBRARY ieee;
USE work.ALL;
	USE ieee.std_logic_1164.all;
LIBRARY eagle_macro;
	USE eagle_macro.EAGLE_COMPONENTS.all;

ENTITY dsp8 IS
PORT (
	p		: OUT STD_LOGIC_VECTOR(29 DOWNTO 0);

	a		: IN STD_LOGIC_VECTOR(14 DOWNTO 0);
	b		: IN STD_LOGIC_VECTOR(14 DOWNTO 0)	);
END dsp8;

ARCHITECTURE struct OF dsp8 IS

	BEGIN
	inst : EG_LOGIC_MULT
		GENERIC MAP (
			INPUT_WIDTH_A	=> 15,
			INPUT_WIDTH_B	=> 15,
			OUTPUT_WIDTH		=> 30,
			INPUTFORMAT		=> "UNSIGNED",
			INPUTREGA		=> "DISABLE",
			INPUTREGB		=> "DISABLE",
			OUTPUTREG		=> "DISABLE",
			IMPLEMENT		=> "AUTO"
		)
		PORT MAP (
			a		=> a,
			b		=> b,
			p		=> p,
			cea		=> '0',
			ceb		=> '0',
			cepd		=> '0',
			clk		=> '0',
			rstan		=> '0',
			rstbn		=> '0',
			rstpdn	=> '0'
			);

END struct;
