library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB is
end TB;

architecture Behavioral of TB is

    COMPONENT SDetector IS 
        Port ( b : in STD_LOGIC_VECTOR (31 DOWNTO 0);
               clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               o1 : out STD_LOGIC_VECTOR (31 DOWNTO 0));
    END COMPONENT;
    
    SIGNAL b_s, o_s: STD_LOGIC_VECTOR(31 DOWNTO 0);
    SIGNAL clk_s, rst_s: STD_LOGIC;

begin
    
    COMPTOTEST: SDetector PORT MAP (b_s, clk_s, rst_s, o_s);
    
    ClkProcess: PROCESS
    BEGIN
        clk_s <= '0';
          WAIT FOR 1 NS;
          clk_s <= '1'; 
          WAIT FOR 1 NS;
    END PROCESS ClkProcess;
    
    VectorProcess: PROCESS
    BEGIN
        -- Testing reset
        rst_s <= '1';
        b_s <= "00000000000000000000011011011011";
        WAIT FOR 5 NS; -- Wait for the output to be stable 
        ASSERT o_s = x"00000000" REPORT "Reset failed" SEVERITY WARNING;
        
        -- Testing the actual input
        -- Within a clock cycle the nested for loop will run total of 168 times to check all the possible sequence
        rst_s <= '0';
        b_s <= "00000000000000000000011011011011";
        WAIT FOR 5 NS; -- Wait for the output to be stable 
        ASSERT o_s = "00000000000000000000000100001001" REPORT "O_s failed" SEVERITY WARNING;
                      
    END PROCESS VectorProcess;

end Behavioral;
