
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comparador is
 Port (
        dinero: in unsigned(7 downto 0);
        precio_prod: in unsigned(7 downto 0);
        CE: in std_logic;
        prod_ok: out std_logic;
        cambio: out unsigned(7 downto 0)
  );
end comparador;

architecture Behavioral of comparador is

begin
process(CE, dinero, precio_prod)
begin
    if CE='1' then --cuando el chip enable está activo se compara
        if dinero=precio_prod then       --si se introduce el dinero exacto
            prod_ok <= '1';              --se entrega el producto
            cambio <= (others=>'0');     --y el cambio es 0
        elsif dinero > precio_prod then  --si se introduce más dinero del necesario
                prod_ok <= '1';          --se entrega el producto
                cambio <= dinero - precio_prod; --y el cambio es la diferencia del
                                                --dinero introducido y el precio del producto
        else
             prod_ok<='0'; --si el dinero introducido es menor que el precio del producto,
                           --no se entrega el producto
        end if;       
    else 
        prod_ok <= '0'; --si el chip enable no está activo, no se realiza comparación
        cambio <= (others=>'0');
end if;
end process;
end Behavioral;
