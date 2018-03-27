library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY DcdTb IS
END DcdTb;
 
ARCHITECTURE beh of DcdTb is
   COMPONENT Dcd3x8
       PORT (
    i: IN  STD_LOGIC_VECTOR(2 downto 0);   -- inputs
    d: OUT  STD_LOGIC_VECTOR(7 downto 0));  -- outputs

END COMPONENT;
    signal i_s :  STD_LOGIC_VECTOR(2 downto 0);  -- signals
    signal d_s :  STD_LOGIC_VECTOR(7 downto 0);  -- output signals
BEGIN  -- beh

CompToTest : Dcd3x8 port map ( i_s, d_s);

PROCESS
BEGIN

       i_s<="000";
       WAIT FOR 5 ns;
       
       i_s<="001";
       WAIT FOR 5 ns;
       
       i_s<="010";
       WAIT FOR 5 ns;
       
       i_s<="011";
       WAIT FOR 5 ns;
       
       i_s<="100";
       WAIT FOR 5 ns;
       
       i_s<="101";
       WAIT FOR 5 ns;
       
       i_s<="110";
       WAIT FOR 5 ns;
       
       i_s<="111";
       WAIT FOR 5 ns;
       
       WAIT;
       
END PROCESS;
    
 END beh;

