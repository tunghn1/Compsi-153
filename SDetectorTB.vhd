library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SDetectorTB is
end SDetectorTB;

architecture Behavioral of SDetectorTB is

    COMPONENT SDetector IS 
        Port ( b : in STD_LOGIC;
               clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               o1 : out STD_LOGIC);
    END COMPONENT;
    
    SIGNAL b_s, clk_s, rst_s, o_s: STD_LOGIC;

begin
    
    COMPTOTEST: SDetector PORT MAP (b_s, clk_s, rst_s, o_s);
    
    ClkProcess: PROCESS
    BEGIN
        Clk_s <= '0';
        WAIT FOR 10 NS;
        Clk_s <= '1'; 
        WAIT FOR 10 NS;
    END PROCESS ClkProcess;
    
    VectorProcess: PROCESS
    BEGIN
        
        rst_s <= '1';
        b_s <= '0';
        WAIT UNTIL Clk_s='1' AND Clk_s'EVENT;
        WAIT FOR 5 NS;
        ASSERT o_s = '0' REPORT "Reset failed" SEVERITY WARNING ;
        
        rst_s <= '0';
        b_s <= '0';
        WAIT UNTIL Clk_s='1' AND Clk_s'EVENT;
        WAIT FOR 5 NS;
        ASSERT o_s = '0' REPORT "S0 failed" SEVERITY WARNING;
        
        b_s <= '1'; 
        WAIT UNTIL Clk_s='1' AND Clk_s'EVENT;
        WAIT FOR 5 NS;
        ASSERT o_s = '0' REPORT "S1 failed" SEVERITY WARNING;
        
        b_s <= '1';
        WAIT UNTIL Clk_s='1' AND Clk_s'EVENT;
        WAIT FOR 5 NS;   
        ASSERT o_s = '0' REPORT "S2 failed" SEVERITY WARNING;
        
        b_s <= '0';
        WAIT UNTIL Clk_s='1' AND Clk_s'EVENT;
        WAIT FOR 5 NS;
        ASSERT o_s = '0' REPORT "S3 failed" SEVERITY WARNING;
        
        b_s <= '1';
        WAIT UNTIL Clk_s='1' AND Clk_s'EVENT;
        WAIT FOR 5 NS;  
        ASSERT o_s = '0' REPORT "S4 failed" SEVERITY WARNING;
        
        b_s <= '1';
        WAIT UNTIL Clk_s='1' AND Clk_s'EVENT;
        WAIT FOR 5 NS;
        ASSERT o_s = '1' REPORT "S5 failed" SEVERITY WARNING;
       
               
    END PROCESS VectorProcess;

end Behavioral;
