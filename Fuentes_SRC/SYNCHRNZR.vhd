library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;

entity SYNCHRNZR is 
port (  
    CLK : in  std_logic; 
    ASYNC_IN_1 : in  std_logic; 
    ASYNC_IN_2 : in  std_logic;
    ASYNC_IN_3 : in  std_logic;
    ASYNC_IN_4 : in  std_logic;
    SYNC_OUT_1 : out std_logic;
    SYNC_OUT_2 : out std_logic;
    SYNC_OUT_3 : out std_logic;
    SYNC_OUT_4 : out std_logic
); 
end SYNCHRNZR; 

architecture BEHAVIORAL of SYNCHRNZR is 
    signal sreg_1 : std_logic_vector(1 downto 0); 
    signal sreg_2 : std_logic_vector(1 downto 0);
    signal sreg_3 : std_logic_vector(1 downto 0);
    signal sreg_4 : std_logic_vector(1 downto 0);
    begin 
    process (CLK) 
    begin 
        if rising_edge(CLK) then   
        SYNC_OUT_1 <= sreg_1(1); 
        SYNC_OUT_2 <= sreg_2(1);
        SYNC_OUT_3 <= sreg_3(1);
        SYNC_OUT_4 <= sreg_4(1);
        sreg_1 <= sreg_1(0) & ASYNC_IN_1; 
        sreg_2 <= sreg_2(0) & ASYNC_IN_2;
        sreg_3 <= sreg_3(0) & ASYNC_IN_3;
        sreg_4 <= sreg_4(0) & ASYNC_IN_4;
        end if; 
    end process; 
end BEHAVIORAL; 

