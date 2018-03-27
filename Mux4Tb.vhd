
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


Entity MuxTb is 
End MuxTb;

Architecture Tb of MuxTb is 
	Component Mux4 is 
		Port (i3, i2, i1, i0: IN std_logic;
              s1, s0: IN std_logic;
         	  d: OUT std_logic);
	End Component;

Signal i3_s, i2_s, i1_s, i0_s, s1_s, s0_s, d_s: std_logic;
Begin 
	CompToTest: Mux4 Port Map (i3_s, i2_s, i1_s, i0_s, s1_s, s0_s, d_s);
	Process
	
	BEGIN
		i3_s <= '0'; i2_s <='0'; i1_s <='1'; i0_s <= '1';
		s1_s <= '0'; s0_s <= '0';
		Wait for 1 ns;

		s1_s <= '0'; s0_s <= '1';
		Wait for 1 ns;

		s1_s <= '1'; s0_s <= '0';
		Wait for 1 ns;

		s1_s <= '1'; s0_s <= '1';
		Wait for 1 ns;
		Wait;
		
	End Process;
	
End Tb;