library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity selector_producto is
  Port (
        SW: in std_logic_vector(2 downto 0);
        precio_producto: out std_logic_vector(7 downto 0);
        nombre_producto: out std_logic_vector(7 downto 0);
        error: out std_logic
  );
end selector_producto;

architecture Behavioral of selector_producto is
begin
    process(SW)
    begin
        case SW is
            when "001" =>  -- Cola
                nombre_producto <= "00000001";
                precio_producto <= "10010110"; -- 150 en binario
                error <= '0';
            when "010" =>  -- Agua
                nombre_producto <= "00000010";
                precio_producto <= "01111000"; -- 120 en binario
                error <= '0';
            when "100" =>  -- Café
                nombre_producto <= "00000100";
                precio_producto <= "01101110"; -- 110 en binario
                error <= '0';
            when others =>
                nombre_producto <= "00000000";
                precio_producto <= "00000000";
                error <= '1';
        end case;
    end process;
end Behavioral;

