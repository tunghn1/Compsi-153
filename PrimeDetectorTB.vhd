library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY PrimeTest IS 
END ENTITY;

ARCHITECTURE BevTb OF PrimeTest IS 

-- Component declaration
COMPONENT PrimeVersion2 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           check : out STD_LOGIC;
           num1 : in STD_LOGIC_VECTOR (15 downto 0));
end COMPONENT;

-- Signal declaration
SIGNAL clk_s, reset_s, check_s: STD_LOGIC;
SIGNAL num1_s: STD_LOGIC_VECTOR (15 DOWNTO 0);

BEGIN
Prime1: PrimeVersion2 PORT MAP (clk_s, reset_s, check_s, num1_s);-- PORT MAP

clkProcess: PROCESS -- Process to control the clock
BEGIN

    clk_s <= '0';
    WAIT FOR 10 NS;
    clk_s <= '1';
    WAIT FOR 10 NS;
    
END PROCESS;

PrimeProcess: PROCESS -- Process to input prime number
BEGIN
    -- Test when reset_s = '1'
    reset_s <= '1';
    num1_s <= x"0001";
    
    -- Test when reset_s = '1'   
    -- 1
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;     
    reset_s <= '0';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0
    num1_s <= x"0001";
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD
    Wait FOR 40 NS;      
    
        
    -- 2
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0
    reset_s <= '0';    
    num1_s <= x"0002";
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD                
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- IS_2
    WAIT FOR 40 NS;  

    
    -- Reset 
    -- 121
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"0079";
    FOR count IN 0 TO 120 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;
    
    -- Reset 
    -- 83
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"0053";
    FOR count IN 0 TO 82 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;


    -- 4
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0
    reset_s <= '0';    
    num1_s <= x"0004";
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD                
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- DONE_LOOP
    WAIT FOR 40 NS;  
  
    -- 6
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0
    reset_s <= '0';    
    num1_s <= x"0006";
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD                
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- KEEP_LOOP
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- DONE_LOOP
    WAIT FOR 40 NS;  
  
    -- 9
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0
    reset_s <= '0';    
    num1_s <= x"0009";
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD                
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- KEEP_LOOP
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- DONE_LOOP
    WAIT FOR 40 NS;  

    -- 5
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0
    reset_s <= '0';    
    num1_s <= x"0005";
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD                
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- KEEP_LOOP
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- KEEP_LOOP
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START
    WAIT FOR 40 NS; 

    -- Reset 
    -- 7
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"0007";
    FOR count IN 0 TO 7 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;
    
    -- Reset 
    -- 11
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"000B";
    FOR count IN 0 TO 11 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;
    
    -- Reset 
    -- 13
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"000D";
    FOR count IN 0 TO 13 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;

    -- Reset 
    -- 17
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"0011";
    FOR count IN 0 TO 17 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;
    
    -- Reset 
    -- 19
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"0013";
    FOR count IN 0 TO 19 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;
    
    -- Reset 
    -- 23
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"0017";
    FOR count IN 0 TO 23 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;
    
    -- Reset 
    -- 15
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"000f";
    FOR count IN 0 TO 15 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;              
    
    -- Reset 
    -- 21
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"0015";
    FOR count IN 0 TO 21 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;    

    -- Reset 
    -- 25
    
    reset_s <= '1';
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT;
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START0 
    reset_s <= '0'; 
    WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- HOLD  
    num1_s <= x"0019";
    FOR count IN 0 TO 25 LOOP
        WAIT UNTIL clk_s = '1' AND clk_s'EVENT; -- START = ? -- KeepLoop = ?
    END LOOP;        
    
    WAIT;
END PROCESS;

END ARCHITECTURE; 
