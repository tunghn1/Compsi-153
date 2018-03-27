library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ADDER_8 is
    Port ( NUM1, NUM2 : in  STD_LOGIC_VECTOR (7 downto 0); -- two inputs
           C: out STD_LOGIC; -- carry out
           S : out  STD_LOGIC_VECTOR (7 downto 0)); -- sum
end ADDER_8;

architecture Behavioral of ADDER_8 is
begin
    
    Process (NUM1, NUM2)
    BEGIN
    -- Carry out 
     IF (NUM1(7) = '1' OR NUM2(7) = '1') THEN
        IF (((NUM1(7) AND NUM2(7)) OR (NUM1(6) AND NUM2(6))) = '1') THEN
        
            C <= '1';
        
        ELSE 
        
            C <= '0';
        
        END IF; 
        
     ELSE 
     
        C <= '0';
        
      END IF;
    
    -- Sum    
    S <= NUM1 + NUM2;
    
    END PROCESS;
    

end Behavioral;


