library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
entity EDGEDTCTR is 
port (  
    CLK      : in  std_logic; 
    SYNC_IN_1 : in  std_logic; 
    SYNC_IN_2 : in  std_logic; 
    SYNC_IN_3 : in  std_logic; 
    SYNC_IN_4 : in  std_logic; 
    EDGE_1    : out std_logic;
    EDGE_2    : out std_logic;
    EDGE_3    : out std_logic;
    EDGE_4    : out std_logic
); 
end EDGEDTCTR;
architecture BEHAVIORAL of EDGEDTCTR is 
signal sreg_1 : std_logic_vector(2 downto 0); 
signal sreg_2 : std_logic_vector(2 downto 0);
signal sreg_3 : std_logic_vector(2 downto 0);
signal sreg_4 : std_logic_vector(2 downto 0);
begin 
    process (CLK) 
    begin 
    if rising_edge(CLK) then 
        sreg_1 <= sreg_1(1 downto 0) & SYNC_IN_1; 
        sreg_2 <= sreg_2(1 downto 0) & SYNC_IN_2;
        sreg_3 <= sreg_3(1 downto 0) & SYNC_IN_3;
        sreg_4 <= sreg_4(1 downto 0) & SYNC_IN_4;
    end if; 
    end process; 
    with sreg_1 select 
       EDGE_1 <= '1' when "100", 
        '0' when others; 
    with sreg_2 select 
       EDGE_2 <= '1' when "100", 
        '0' when others; 
   with sreg_3 select 
       EDGE_3 <= '1' when "100", 
        '0' when others; 
   with sreg_4 select 
       EDGE_4 <= '1' when "100", 
        '0' when others; 
end BEHAVIORAL;
