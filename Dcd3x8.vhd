
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


ENTITY Dcd3x8 IS
   PORT (i: IN std_logic_vector(2 downto 0);
         d: OUT std_logic_vector(7 downto 0));
END Dcd3x8;

ARCHITECTURE Beh OF Dcd3x8 IS
BEGIN

PROCESS (i)
BEGIN
      IF (i = "000") THEN
        d <= "00000001";
        
      ELSIF (i = "001") THEN
	    d <= "00000010";
	    
      ELSIF  (i = "010") THEN
	    d <= "00000100";
	    
      ELSIF (i = "011") THEN
	    d <= "00001000";
	    
     ELSIF (i = "100") THEN
	    d <= "00010000";
	    
     ELSIF (i = "101") THEN
	    d <= "00100000";
	    
     ELSIF (i = "110") THEN
	    d <= "01000000";
	    
     ELSE
	    d <= "10000000";
	    
     END IF;
END PROCESS;
END Beh;