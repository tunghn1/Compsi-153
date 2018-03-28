-- Student name: Tung Hoang Nguyen
-- Student ID: 39291907
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.DividerPackage.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;



entity PrimeVersion2 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           check : out STD_LOGIC;
           num1 : in STD_LOGIC_VECTOR (15 downto 0));
end PrimeVersion2;

architecture Behavioral of PrimeVersion2 is
    -- Type declaration
    TYPE State IS (START0, HOLD, START, IS_2, KEEPLOOP, DONELOOP);
        
    -- Signal declarations for counter
    SIGNAL Count, NextCount: STD_LOGIC_VECTOR (15 DOWNTO 0);
     
    -- Signal declarations for state
    SIGNAL CurrState, NextState: State;
    
begin
    -- Combinational logic process
    CombLogicProcess: PROCESS (num1, CurrState, Count)
    BEGIN
        
        CASE CurrState IS -- Switching between states
            
            WHEN START0 =>
                IF (reset = '1') THEN
                    NextState <= START0;
                ELSE 
                    NextState <= HOLD;
                END IF;
                
            WHEN HOLD => -- NextCount is 2, check is 0, loop back if num1 < 2, else move to other states 
                NextCount <= x"0002"; -- Count register
                check <= '0'; -- output
                IF (TO_INTEGER(UNSIGNED(num1)) < 2) THEN -- State register
                    NextState <= HOLD;
                ELSE 
                    NextState <= START;
                END IF;
            
            WHEN START => -- choose to go back to HOLD, IS_2, KEEPLOOP, OR DONELOOP
                IF (TO_INTEGER(UNSIGNED(num1)) = 2 AND reset = '0') THEN -- num1 is 2
                    NextState <= IS_2;
                ELSIF ((TO_INTEGER(UNSIGNED(num1)) /= 2) AND 
                        (TO_INTEGER(UNSIGNED(Count)) <= (TO_INTEGER(UNSIGNED(num1)))) AND 
                        (module(num1,Count) /= x"0000") AND reset = '0') THEN -- num1 is not 2, count < num1/2, and num1 % count != 0
                     NextState <= KEEPLOOP;                       
                ELSIF ((TO_INTEGER(UNSIGNED(num1)) /= 2) AND 
                        (TO_INTEGER(UNSIGNED(Count)) <= (TO_INTEGER(UNSIGNED(num1)))) AND 
                        (module(num1,Count) = x"0000") AND reset = '0') THEN -- num1 is not 2, count < num1/2, and num1 % count == 0
                    NextState <= DONELOOP;                        
                ELSIF (TO_INTEGER(UNSIGNED(Count)) >= (TO_INTEGER(UNSIGNED(num1)))) THEN
                    NextState <= IS_2;
                ELSE
                    NextState <= START0;
                END IF; 
                                
            WHEN IS_2 => -- check is 1, go back to HOLD if reset_s is 1
                
                check <= '1';
                
                IF (reset = '0') THEN
                    NextState <= IS_2;
                ELSE         
                    NextState <= Start0;
                END IF;
            
            WHEN KEEPLOOP => -- check is 1, NextCount is Count + 1, go to START 
                
                check <= '1';
                NextCount <= Count + x"0001";
                
                IF (reset = '0' AND (NOT (TO_INTEGER(UNSIGNED(Count)) <= ((TO_INTEGER(UNSIGNED(num1))))))) THEN
                    NextState <= IS_2;               
                ELSIF (reset = '0' AND ((TO_INTEGER(UNSIGNED(Count)) <= ((TO_INTEGER(UNSIGNED(num1))))))) THEN
                    NextState <= START;
                ELSE 
                    NextState <= START0;
                END IF;
                
            WHEN DONELOOP => -- check is 0, go back to HOLD
                check <= '0';
                
                IF (reset = '0') THEN
                    NextState <= DONELOOP;
                ELSE 
                    NextState <= Start0;
                END IF;
        
        END CASE;
        
    END PROCESS;
    
    -- Clock process
    ClockProcess: PROCESS (clk, reset)
    BEGIN

        IF (reset = '1') THEN -- If reset is on, go back to Hold state
            CurrState <= Start0;
            Count <= x"0002";
        ELSE 
            IF (clk = '1' AND clk'EVENT) THEN -- On the rising edge of the clock, go to the next state
                CurrState <= NextState;
                Count <= NextCount;
            END IF;
        END IF;
        
    END PROCESS;
    
end Behavioral;
