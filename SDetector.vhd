library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SDetector is
    Port ( b : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           o1 : out STD_LOGIC);
end SDetector;

architecture Behavioral of SDetector is
    
    -- Type declaration
    SUBTYPE StateType IS STD_LOGIC_VECTOR (2 DOWNTO 0);
    
    -- Constant initialization
    CONSTANT S_0: StateType := "000";
    
    -- Signal declaration
    SIGNAL CurrState, NextState: StateType; 
    
begin
    REG: PROCESS (clk) -- Synchronous reset
    BEGIN
         IF (clk = '1' AND clk'EVENT) THEN
            IF (rst = '1') THEN
                   CurrState <= S_0;
            ELSE
                   Currstate <= NextState;
            END IF;
         END IF;
    END PROCESS;
    
    COMBINATIONAL: PROCESS (CurrState, b) -- Capture structure
    BEGIN
        o1 <= CurrState(2) AND (NOT CurrState(1)) AND CurrState(0);
        NextState(2) <= ((NOT CurrState(2)) AND CurrState(1) AND CurrState(0) AND b) 
                            OR (CurrState(2) AND (NOT CurrState(1)) AND (NOT CurrState(0)) AND b);
        NextState(1) <= ((NOT CurrState(2)) AND(NOT CurrState(1)) AND CurrState(0) AND b) 
                            OR ((NOT CurrState(2)) AND CurrState(1) AND (NOT CurrState(0)));
        NextState(0) <= ((NOT CurrState(2)) AND CurrState(1) AND (NOT CurrState(0)) AND (NOT b)) 
                            OR (CurrState(2) AND (NOT CurrState(1)) AND (NOT CurrState(0)) AND b)
                            OR ((NOT CurrState(2)) AND(NOT CurrState(1)) AND (NOT CurrState(0)) AND b);
    END PROCESS;

end Behavioral;
