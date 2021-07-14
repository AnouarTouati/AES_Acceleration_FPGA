-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/30/2021 00:24:20"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          aes_core
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY aes_core_vhd_vec_tst IS
END aes_core_vhd_vec_tst;
ARCHITECTURE aes_core_arch OF aes_core_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL avs_s0_address : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL avs_s0_read : STD_LOGIC;
SIGNAL avs_s0_readdata : STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL avs_s0_write : STD_LOGIC;
SIGNAL avs_s0_writedata : STD_LOGIC_VECTOR(127 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT aes_core
	PORT (
	avs_s0_address : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	avs_s0_read : IN STD_LOGIC;
	avs_s0_readdata : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
	avs_s0_write : IN STD_LOGIC;
	avs_s0_writedata : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
	clk : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : aes_core
	PORT MAP (
-- list connections between master ports and signals
	avs_s0_address => avs_s0_address,
	avs_s0_read => avs_s0_read,
	avs_s0_readdata => avs_s0_readdata,
	avs_s0_write => avs_s0_write,
	avs_s0_writedata => avs_s0_writedata,
	clk => clk,
	reset => reset
	);
-- avs_s0_address[1]
t_prcs_avs_s0_address_1: PROCESS
BEGIN
	avs_s0_address(1) <= '0';
	WAIT FOR 170000 ps;
	avs_s0_address(1) <= '1';
WAIT;
END PROCESS t_prcs_avs_s0_address_1;
-- avs_s0_address[0]
t_prcs_avs_s0_address_0: PROCESS
BEGIN
	avs_s0_address(0) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_address(0) <= '1';
	WAIT FOR 150000 ps;
	avs_s0_address(0) <= '0';
	WAIT FOR 70000 ps;
	avs_s0_address(0) <= '1';
	WAIT FOR 230000 ps;
	avs_s0_address(0) <= '0';
	WAIT FOR 30000 ps;
	avs_s0_address(0) <= '1';
WAIT;
END PROCESS t_prcs_avs_s0_address_0;
-- avs_s0_writedata[127]
t_prcs_avs_s0_writedata_127: PROCESS
BEGIN
	avs_s0_writedata(127) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_127;
-- avs_s0_writedata[126]
t_prcs_avs_s0_writedata_126: PROCESS
BEGIN
	avs_s0_writedata(126) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_126;
-- avs_s0_writedata[125]
t_prcs_avs_s0_writedata_125: PROCESS
BEGIN
	avs_s0_writedata(125) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_125;
-- avs_s0_writedata[124]
t_prcs_avs_s0_writedata_124: PROCESS
BEGIN
	avs_s0_writedata(124) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_124;
-- avs_s0_writedata[123]
t_prcs_avs_s0_writedata_123: PROCESS
BEGIN
	avs_s0_writedata(123) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_123;
-- avs_s0_writedata[122]
t_prcs_avs_s0_writedata_122: PROCESS
BEGIN
	avs_s0_writedata(122) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_122;
-- avs_s0_writedata[121]
t_prcs_avs_s0_writedata_121: PROCESS
BEGIN
	avs_s0_writedata(121) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_121;
-- avs_s0_writedata[120]
t_prcs_avs_s0_writedata_120: PROCESS
BEGIN
	avs_s0_writedata(120) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_120;
-- avs_s0_writedata[119]
t_prcs_avs_s0_writedata_119: PROCESS
BEGIN
	avs_s0_writedata(119) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_119;
-- avs_s0_writedata[118]
t_prcs_avs_s0_writedata_118: PROCESS
BEGIN
	avs_s0_writedata(118) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_118;
-- avs_s0_writedata[117]
t_prcs_avs_s0_writedata_117: PROCESS
BEGIN
	avs_s0_writedata(117) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_117;
-- avs_s0_writedata[116]
t_prcs_avs_s0_writedata_116: PROCESS
BEGIN
	avs_s0_writedata(116) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(116) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(116) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_116;
-- avs_s0_writedata[115]
t_prcs_avs_s0_writedata_115: PROCESS
BEGIN
	avs_s0_writedata(115) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_115;
-- avs_s0_writedata[114]
t_prcs_avs_s0_writedata_114: PROCESS
BEGIN
	avs_s0_writedata(114) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_114;
-- avs_s0_writedata[113]
t_prcs_avs_s0_writedata_113: PROCESS
BEGIN
	avs_s0_writedata(113) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_113;
-- avs_s0_writedata[112]
t_prcs_avs_s0_writedata_112: PROCESS
BEGIN
	avs_s0_writedata(112) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(112) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(112) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_112;
-- avs_s0_writedata[111]
t_prcs_avs_s0_writedata_111: PROCESS
BEGIN
	avs_s0_writedata(111) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_111;
-- avs_s0_writedata[110]
t_prcs_avs_s0_writedata_110: PROCESS
BEGIN
	avs_s0_writedata(110) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_110;
-- avs_s0_writedata[109]
t_prcs_avs_s0_writedata_109: PROCESS
BEGIN
	avs_s0_writedata(109) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(109) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(109) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_109;
-- avs_s0_writedata[108]
t_prcs_avs_s0_writedata_108: PROCESS
BEGIN
	avs_s0_writedata(108) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_108;
-- avs_s0_writedata[107]
t_prcs_avs_s0_writedata_107: PROCESS
BEGIN
	avs_s0_writedata(107) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_107;
-- avs_s0_writedata[106]
t_prcs_avs_s0_writedata_106: PROCESS
BEGIN
	avs_s0_writedata(106) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_106;
-- avs_s0_writedata[105]
t_prcs_avs_s0_writedata_105: PROCESS
BEGIN
	avs_s0_writedata(105) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(105) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(105) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_105;
-- avs_s0_writedata[104]
t_prcs_avs_s0_writedata_104: PROCESS
BEGIN
	avs_s0_writedata(104) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_104;
-- avs_s0_writedata[103]
t_prcs_avs_s0_writedata_103: PROCESS
BEGIN
	avs_s0_writedata(103) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_103;
-- avs_s0_writedata[102]
t_prcs_avs_s0_writedata_102: PROCESS
BEGIN
	avs_s0_writedata(102) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_102;
-- avs_s0_writedata[101]
t_prcs_avs_s0_writedata_101: PROCESS
BEGIN
	avs_s0_writedata(101) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(101) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(101) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_101;
-- avs_s0_writedata[100]
t_prcs_avs_s0_writedata_100: PROCESS
BEGIN
	avs_s0_writedata(100) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(100) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(100) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_100;
-- avs_s0_writedata[99]
t_prcs_avs_s0_writedata_99: PROCESS
BEGIN
	avs_s0_writedata(99) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_99;
-- avs_s0_writedata[98]
t_prcs_avs_s0_writedata_98: PROCESS
BEGIN
	avs_s0_writedata(98) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_98;
-- avs_s0_writedata[97]
t_prcs_avs_s0_writedata_97: PROCESS
BEGIN
	avs_s0_writedata(97) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(97) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(97) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_97;
-- avs_s0_writedata[96]
t_prcs_avs_s0_writedata_96: PROCESS
BEGIN
	avs_s0_writedata(96) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(96) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(96) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_96;
-- avs_s0_writedata[95]
t_prcs_avs_s0_writedata_95: PROCESS
BEGIN
	avs_s0_writedata(95) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_95;
-- avs_s0_writedata[94]
t_prcs_avs_s0_writedata_94: PROCESS
BEGIN
	avs_s0_writedata(94) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(94) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(94) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_94;
-- avs_s0_writedata[93]
t_prcs_avs_s0_writedata_93: PROCESS
BEGIN
	avs_s0_writedata(93) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_93;
-- avs_s0_writedata[92]
t_prcs_avs_s0_writedata_92: PROCESS
BEGIN
	avs_s0_writedata(92) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_92;
-- avs_s0_writedata[91]
t_prcs_avs_s0_writedata_91: PROCESS
BEGIN
	avs_s0_writedata(91) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_91;
-- avs_s0_writedata[90]
t_prcs_avs_s0_writedata_90: PROCESS
BEGIN
	avs_s0_writedata(90) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(90) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(90) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_90;
-- avs_s0_writedata[89]
t_prcs_avs_s0_writedata_89: PROCESS
BEGIN
	avs_s0_writedata(89) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_89;
-- avs_s0_writedata[88]
t_prcs_avs_s0_writedata_88: PROCESS
BEGIN
	avs_s0_writedata(88) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_88;
-- avs_s0_writedata[87]
t_prcs_avs_s0_writedata_87: PROCESS
BEGIN
	avs_s0_writedata(87) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_87;
-- avs_s0_writedata[86]
t_prcs_avs_s0_writedata_86: PROCESS
BEGIN
	avs_s0_writedata(86) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(86) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(86) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_86;
-- avs_s0_writedata[85]
t_prcs_avs_s0_writedata_85: PROCESS
BEGIN
	avs_s0_writedata(85) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_85;
-- avs_s0_writedata[84]
t_prcs_avs_s0_writedata_84: PROCESS
BEGIN
	avs_s0_writedata(84) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(84) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(84) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_84;
-- avs_s0_writedata[83]
t_prcs_avs_s0_writedata_83: PROCESS
BEGIN
	avs_s0_writedata(83) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_83;
-- avs_s0_writedata[82]
t_prcs_avs_s0_writedata_82: PROCESS
BEGIN
	avs_s0_writedata(82) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(82) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(82) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_82;
-- avs_s0_writedata[81]
t_prcs_avs_s0_writedata_81: PROCESS
BEGIN
	avs_s0_writedata(81) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_81;
-- avs_s0_writedata[80]
t_prcs_avs_s0_writedata_80: PROCESS
BEGIN
	avs_s0_writedata(80) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(80) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(80) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_80;
-- avs_s0_writedata[79]
t_prcs_avs_s0_writedata_79: PROCESS
BEGIN
	avs_s0_writedata(79) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_79;
-- avs_s0_writedata[78]
t_prcs_avs_s0_writedata_78: PROCESS
BEGIN
	avs_s0_writedata(78) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(78) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(78) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_78;
-- avs_s0_writedata[77]
t_prcs_avs_s0_writedata_77: PROCESS
BEGIN
	avs_s0_writedata(77) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(77) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(77) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_77;
-- avs_s0_writedata[76]
t_prcs_avs_s0_writedata_76: PROCESS
BEGIN
	avs_s0_writedata(76) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_76;
-- avs_s0_writedata[75]
t_prcs_avs_s0_writedata_75: PROCESS
BEGIN
	avs_s0_writedata(75) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_75;
-- avs_s0_writedata[74]
t_prcs_avs_s0_writedata_74: PROCESS
BEGIN
	avs_s0_writedata(74) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(74) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(74) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_74;
-- avs_s0_writedata[73]
t_prcs_avs_s0_writedata_73: PROCESS
BEGIN
	avs_s0_writedata(73) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(73) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(73) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_73;
-- avs_s0_writedata[72]
t_prcs_avs_s0_writedata_72: PROCESS
BEGIN
	avs_s0_writedata(72) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_72;
-- avs_s0_writedata[71]
t_prcs_avs_s0_writedata_71: PROCESS
BEGIN
	avs_s0_writedata(71) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_71;
-- avs_s0_writedata[70]
t_prcs_avs_s0_writedata_70: PROCESS
BEGIN
	avs_s0_writedata(70) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(70) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(70) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_70;
-- avs_s0_writedata[69]
t_prcs_avs_s0_writedata_69: PROCESS
BEGIN
	avs_s0_writedata(69) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(69) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(69) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_69;
-- avs_s0_writedata[68]
t_prcs_avs_s0_writedata_68: PROCESS
BEGIN
	avs_s0_writedata(68) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(68) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(68) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_68;
-- avs_s0_writedata[67]
t_prcs_avs_s0_writedata_67: PROCESS
BEGIN
	avs_s0_writedata(67) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_67;
-- avs_s0_writedata[66]
t_prcs_avs_s0_writedata_66: PROCESS
BEGIN
	avs_s0_writedata(66) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(66) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(66) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_66;
-- avs_s0_writedata[65]
t_prcs_avs_s0_writedata_65: PROCESS
BEGIN
	avs_s0_writedata(65) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(65) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(65) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_65;
-- avs_s0_writedata[64]
t_prcs_avs_s0_writedata_64: PROCESS
BEGIN
	avs_s0_writedata(64) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(64) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(64) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_64;
-- avs_s0_writedata[63]
t_prcs_avs_s0_writedata_63: PROCESS
BEGIN
	avs_s0_writedata(63) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(63) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(63) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_63;
-- avs_s0_writedata[62]
t_prcs_avs_s0_writedata_62: PROCESS
BEGIN
	avs_s0_writedata(62) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_62;
-- avs_s0_writedata[61]
t_prcs_avs_s0_writedata_61: PROCESS
BEGIN
	avs_s0_writedata(61) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_61;
-- avs_s0_writedata[60]
t_prcs_avs_s0_writedata_60: PROCESS
BEGIN
	avs_s0_writedata(60) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_60;
-- avs_s0_writedata[59]
t_prcs_avs_s0_writedata_59: PROCESS
BEGIN
	avs_s0_writedata(59) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(59) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(59) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_59;
-- avs_s0_writedata[58]
t_prcs_avs_s0_writedata_58: PROCESS
BEGIN
	avs_s0_writedata(58) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_58;
-- avs_s0_writedata[57]
t_prcs_avs_s0_writedata_57: PROCESS
BEGIN
	avs_s0_writedata(57) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_57;
-- avs_s0_writedata[56]
t_prcs_avs_s0_writedata_56: PROCESS
BEGIN
	avs_s0_writedata(56) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_56;
-- avs_s0_writedata[55]
t_prcs_avs_s0_writedata_55: PROCESS
BEGIN
	avs_s0_writedata(55) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(55) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(55) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_55;
-- avs_s0_writedata[54]
t_prcs_avs_s0_writedata_54: PROCESS
BEGIN
	avs_s0_writedata(54) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_54;
-- avs_s0_writedata[53]
t_prcs_avs_s0_writedata_53: PROCESS
BEGIN
	avs_s0_writedata(53) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_53;
-- avs_s0_writedata[52]
t_prcs_avs_s0_writedata_52: PROCESS
BEGIN
	avs_s0_writedata(52) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(52) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(52) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_52;
-- avs_s0_writedata[51]
t_prcs_avs_s0_writedata_51: PROCESS
BEGIN
	avs_s0_writedata(51) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(51) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(51) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_51;
-- avs_s0_writedata[50]
t_prcs_avs_s0_writedata_50: PROCESS
BEGIN
	avs_s0_writedata(50) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_50;
-- avs_s0_writedata[49]
t_prcs_avs_s0_writedata_49: PROCESS
BEGIN
	avs_s0_writedata(49) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_49;
-- avs_s0_writedata[48]
t_prcs_avs_s0_writedata_48: PROCESS
BEGIN
	avs_s0_writedata(48) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(48) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(48) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_48;
-- avs_s0_writedata[47]
t_prcs_avs_s0_writedata_47: PROCESS
BEGIN
	avs_s0_writedata(47) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(47) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(47) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_47;
-- avs_s0_writedata[46]
t_prcs_avs_s0_writedata_46: PROCESS
BEGIN
	avs_s0_writedata(46) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_46;
-- avs_s0_writedata[45]
t_prcs_avs_s0_writedata_45: PROCESS
BEGIN
	avs_s0_writedata(45) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(45) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(45) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_45;
-- avs_s0_writedata[44]
t_prcs_avs_s0_writedata_44: PROCESS
BEGIN
	avs_s0_writedata(44) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_44;
-- avs_s0_writedata[43]
t_prcs_avs_s0_writedata_43: PROCESS
BEGIN
	avs_s0_writedata(43) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(43) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(43) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_43;
-- avs_s0_writedata[42]
t_prcs_avs_s0_writedata_42: PROCESS
BEGIN
	avs_s0_writedata(42) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_42;
-- avs_s0_writedata[41]
t_prcs_avs_s0_writedata_41: PROCESS
BEGIN
	avs_s0_writedata(41) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(41) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(41) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_41;
-- avs_s0_writedata[40]
t_prcs_avs_s0_writedata_40: PROCESS
BEGIN
	avs_s0_writedata(40) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_40;
-- avs_s0_writedata[39]
t_prcs_avs_s0_writedata_39: PROCESS
BEGIN
	avs_s0_writedata(39) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(39) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(39) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_39;
-- avs_s0_writedata[38]
t_prcs_avs_s0_writedata_38: PROCESS
BEGIN
	avs_s0_writedata(38) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_38;
-- avs_s0_writedata[37]
t_prcs_avs_s0_writedata_37: PROCESS
BEGIN
	avs_s0_writedata(37) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(37) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(37) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_37;
-- avs_s0_writedata[36]
t_prcs_avs_s0_writedata_36: PROCESS
BEGIN
	avs_s0_writedata(36) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(36) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(36) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_36;
-- avs_s0_writedata[35]
t_prcs_avs_s0_writedata_35: PROCESS
BEGIN
	avs_s0_writedata(35) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(35) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(35) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_35;
-- avs_s0_writedata[34]
t_prcs_avs_s0_writedata_34: PROCESS
BEGIN
	avs_s0_writedata(34) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_34;
-- avs_s0_writedata[33]
t_prcs_avs_s0_writedata_33: PROCESS
BEGIN
	avs_s0_writedata(33) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(33) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(33) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_33;
-- avs_s0_writedata[32]
t_prcs_avs_s0_writedata_32: PROCESS
BEGIN
	avs_s0_writedata(32) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(32) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(32) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_32;
-- avs_s0_writedata[31]
t_prcs_avs_s0_writedata_31: PROCESS
BEGIN
	avs_s0_writedata(31) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(31) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(31) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_31;
-- avs_s0_writedata[30]
t_prcs_avs_s0_writedata_30: PROCESS
BEGIN
	avs_s0_writedata(30) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(30) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(30) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_30;
-- avs_s0_writedata[29]
t_prcs_avs_s0_writedata_29: PROCESS
BEGIN
	avs_s0_writedata(29) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_29;
-- avs_s0_writedata[28]
t_prcs_avs_s0_writedata_28: PROCESS
BEGIN
	avs_s0_writedata(28) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_28;
-- avs_s0_writedata[27]
t_prcs_avs_s0_writedata_27: PROCESS
BEGIN
	avs_s0_writedata(27) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(27) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(27) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_27;
-- avs_s0_writedata[26]
t_prcs_avs_s0_writedata_26: PROCESS
BEGIN
	avs_s0_writedata(26) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(26) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(26) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_26;
-- avs_s0_writedata[25]
t_prcs_avs_s0_writedata_25: PROCESS
BEGIN
	avs_s0_writedata(25) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_25;
-- avs_s0_writedata[24]
t_prcs_avs_s0_writedata_24: PROCESS
BEGIN
	avs_s0_writedata(24) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_24;
-- avs_s0_writedata[23]
t_prcs_avs_s0_writedata_23: PROCESS
BEGIN
	avs_s0_writedata(23) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(23) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(23) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_23;
-- avs_s0_writedata[22]
t_prcs_avs_s0_writedata_22: PROCESS
BEGIN
	avs_s0_writedata(22) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(22) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(22) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_22;
-- avs_s0_writedata[21]
t_prcs_avs_s0_writedata_21: PROCESS
BEGIN
	avs_s0_writedata(21) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_21;
-- avs_s0_writedata[20]
t_prcs_avs_s0_writedata_20: PROCESS
BEGIN
	avs_s0_writedata(20) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(20) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(20) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_20;
-- avs_s0_writedata[19]
t_prcs_avs_s0_writedata_19: PROCESS
BEGIN
	avs_s0_writedata(19) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(19) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(19) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_19;
-- avs_s0_writedata[18]
t_prcs_avs_s0_writedata_18: PROCESS
BEGIN
	avs_s0_writedata(18) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(18) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(18) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_18;
-- avs_s0_writedata[17]
t_prcs_avs_s0_writedata_17: PROCESS
BEGIN
	avs_s0_writedata(17) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_17;
-- avs_s0_writedata[16]
t_prcs_avs_s0_writedata_16: PROCESS
BEGIN
	avs_s0_writedata(16) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(16) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(16) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_16;
-- avs_s0_writedata[15]
t_prcs_avs_s0_writedata_15: PROCESS
BEGIN
	avs_s0_writedata(15) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(15) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(15) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_15;
-- avs_s0_writedata[14]
t_prcs_avs_s0_writedata_14: PROCESS
BEGIN
	avs_s0_writedata(14) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(14) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(14) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_14;
-- avs_s0_writedata[13]
t_prcs_avs_s0_writedata_13: PROCESS
BEGIN
	avs_s0_writedata(13) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(13) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(13) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_13;
-- avs_s0_writedata[12]
t_prcs_avs_s0_writedata_12: PROCESS
BEGIN
	avs_s0_writedata(12) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_12;
-- avs_s0_writedata[11]
t_prcs_avs_s0_writedata_11: PROCESS
BEGIN
	avs_s0_writedata(11) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(11) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(11) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_11;
-- avs_s0_writedata[10]
t_prcs_avs_s0_writedata_10: PROCESS
BEGIN
	avs_s0_writedata(10) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(10) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(10) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_10;
-- avs_s0_writedata[9]
t_prcs_avs_s0_writedata_9: PROCESS
BEGIN
	avs_s0_writedata(9) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(9) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(9) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_9;
-- avs_s0_writedata[8]
t_prcs_avs_s0_writedata_8: PROCESS
BEGIN
	avs_s0_writedata(8) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_8;
-- avs_s0_writedata[7]
t_prcs_avs_s0_writedata_7: PROCESS
BEGIN
	avs_s0_writedata(7) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(7) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(7) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_7;
-- avs_s0_writedata[6]
t_prcs_avs_s0_writedata_6: PROCESS
BEGIN
	avs_s0_writedata(6) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(6) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(6) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_6;
-- avs_s0_writedata[5]
t_prcs_avs_s0_writedata_5: PROCESS
BEGIN
	avs_s0_writedata(5) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(5) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(5) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_5;
-- avs_s0_writedata[4]
t_prcs_avs_s0_writedata_4: PROCESS
BEGIN
	avs_s0_writedata(4) <= '0';
	WAIT FOR 130000 ps;
	avs_s0_writedata(4) <= '1';
	WAIT FOR 40000 ps;
	avs_s0_writedata(4) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_4;
-- avs_s0_writedata[3]
t_prcs_avs_s0_writedata_3: PROCESS
BEGIN
	avs_s0_writedata(3) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(3) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(3) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_3;
-- avs_s0_writedata[2]
t_prcs_avs_s0_writedata_2: PROCESS
BEGIN
	avs_s0_writedata(2) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(2) <= '1';
	WAIT FOR 140000 ps;
	avs_s0_writedata(2) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_2;
-- avs_s0_writedata[1]
t_prcs_avs_s0_writedata_1: PROCESS
BEGIN
	avs_s0_writedata(1) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(1) <= '1';
	WAIT FOR 170000 ps;
	avs_s0_writedata(1) <= '0';
	WAIT FOR 20000 ps;
	avs_s0_writedata(1) <= '1';
	WAIT FOR 30000 ps;
	avs_s0_writedata(1) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_1;
-- avs_s0_writedata[0]
t_prcs_avs_s0_writedata_0: PROCESS
BEGIN
	avs_s0_writedata(0) <= '0';
	WAIT FOR 60000 ps;
	avs_s0_writedata(0) <= '1';
	WAIT FOR 110000 ps;
	avs_s0_writedata(0) <= '0';
	WAIT FOR 80000 ps;
	avs_s0_writedata(0) <= '1';
	WAIT FOR 10000 ps;
	avs_s0_writedata(0) <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_writedata_0;

-- avs_s0_write
t_prcs_avs_s0_write: PROCESS
BEGIN
	avs_s0_write <= '0';
	WAIT FOR 70000 ps;
	avs_s0_write <= '1';
	WAIT FOR 40000 ps;
	avs_s0_write <= '0';
	WAIT FOR 30000 ps;
	avs_s0_write <= '1';
	WAIT FOR 10000 ps;
	avs_s0_write <= '0';
	WAIT FOR 30000 ps;
	avs_s0_write <= '1';
	WAIT FOR 10000 ps;
	avs_s0_write <= '0';
	WAIT FOR 10000 ps;
	avs_s0_write <= '1';
	WAIT FOR 20000 ps;
	avs_s0_write <= '0';
	WAIT FOR 10000 ps;
	avs_s0_write <= '1';
	WAIT FOR 10000 ps;
	avs_s0_write <= '0';
	WAIT FOR 10000 ps;
	avs_s0_write <= '1';
	WAIT FOR 10000 ps;
	avs_s0_write <= '0';
	WAIT FOR 10000 ps;
	avs_s0_write <= '1';
	WAIT FOR 10000 ps;
	avs_s0_write <= '0';
WAIT;
END PROCESS t_prcs_avs_s0_write;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- avs_s0_read
t_prcs_avs_s0_read: PROCESS
BEGIN
	avs_s0_read <= '0';
	WAIT FOR 290000 ps;
	avs_s0_read <= '1';
WAIT;
END PROCESS t_prcs_avs_s0_read;
END aes_core_arch;
