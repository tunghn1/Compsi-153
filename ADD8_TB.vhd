library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AdderTB is 
end AdderTB;

Architecture Adder_8_Architecture of AdderTB is 

	Component Adder_8

          	 	Port ( NUM1, NUM2 : in  STD_LOGIC_VECTOR (7 downto 0);
          	 	C: out STD_LOGIC;
          		S : OUT  STD_LOGIC_VECTOR (7 downto 0));
	end Component;

Signal NUM1_s, NUM2_s, S_s:  STD_LOGIC_VECTOR (7 downto 0);
Signal C_s: std_logic;

Begin
	CompToTes: Adder_8 PORT MAP (NUM1_s, NUM2_s, C_s, S_s);

	Process
	Begin
	
		NUM1_s <= "00000000"; NUM2_s <= "00000001";
		Wait for 10 ns;
		NUM1_s <= "10000000"; NUM2_s <= "10000001";
		Wait for 10 ns;
		NUM1_s <= "10010001"; NUM2_s <= "00000001";
		Wait for 10 ns;
		NUM1_s <= "10000000"; NUM2_s <= "00000101";
		Wait for 10 ns;
		NUM1_s <= "11111111"; NUM2_s <= "11111111";
		Wait for 10 ns;
		Wait;


	End Process;

End Adder_8_Architecture;
