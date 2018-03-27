
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity Mux4 IS
   Port (i3, i2, i1, i0: IN std_logic;
         s1, s0: IN std_logic;
         d: OUT std_logic);
End Mux4;

Architecture Behavior of Mux4 is 

Begin
	Process (s1, s0)
	Begin
		If (s1 = '0' And s0 = '0') Then -- 00
			d <= i0;
		Elsif (s1 = '0' And s0 = '1') Then -- 01
			d <= i1;
		Elsif (s1 = '1' And s0 = '0') Then -- 10
			d <= i2;
		Else -- 11
			d <=i3;
		End if;
	End Process;
End Behavior;