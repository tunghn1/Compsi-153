library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;
--use IEEE.NUMERIC_STD.ALL;

entity SDetector is
    Port ( b : in STD_LOGIC_VECTOR(31 DOWNTO 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           o1 : out STD_LOGIC_VECTOR(31 DOWNTO 0));
end SDetector;

architecture Behav of SDetector is

    SIGNAL output: STD_LOGIC_VECTOR (31 DOWNTO 0);


begin
    StateReg: PROCESS (clk)
    BEGIN
        IF (clk = '1' AND clk'EVENT) THEN -- On the rising edge of the clock
             IF (rst = '1') THEN -- If the reset is on
                output <= x"00000000"; -- Then we assign all bits in the output signal to 0 at the beginning
             ELSE -- Else 
                FOR index IN 31 DOWNTO 4 LOOP -- We will go through 32 bits
                    FOR index1 IN 5 DOWNTO 0 LOOP -- For each bit, we will check the sequence
                        IF (b(index - 0) = '1' AND -- bit 0
                            b(index - 1) = '1' AND -- bit 1
                            b(index - 2) = '0' AND -- bit 2
                            b(index - 3) = '1' AND -- bit 3
                            b(index - 4) = '1') THEN -- bit 4                     
                            output(index - 4) <= '1'; -- Assign the 4th bit of output to 1 if sequence is detected
                         END IF;
                    END LOOP;
                END LOOP;
                o1 <= output; -- Assign output to o1       
             END IF;
          END IF;
    END PROCESS StateReg;
    
    

end Behav;
