-- ========================================= ARCTAN TABEL ===================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

-- Definisi Enitity
entity muxarctantable is
    Port (
        i           : in  std_logic_vector(3 downto 0); -- Index
        atan        : out signed(15 downto 0);          -- bilangan biner signed fixed point Q1.2.13 dari arctan(2^-i)
        enablemux   : in  std_logic                     -- memperbolehkan adanya pemilihan oleh multiplexer
    );

end muxarctantable;

-- Definisi Architecture
architecture Behavioral of muxarctantable is
    begin
        process(i, enablemux)
        begin
            if enablemux = '1' then 
                case i is -- mux memilih berdasarkan index
                    when "0000" => atan <= "0001100100100010"; -- arctan(2^0)
                    when "0001" => atan <= "0000111011010110"; -- arctan(2^-1)
                    when "0010" => atan <= "0000011111010110";
                    when "0011" => atan <= "0000001111111010";
                    when "0100" => atan <= "0000000111111111";
                    when "0101" => atan <= "0000000100000000";
                    when "0110" => atan <= "0000000010000000";
                    when "0111" => atan <= "0000000001000000";
                    when "1000" => atan <= "0000000000100000";
                    when "1001" => atan <= "0000000000010000";
                    when "1010" => atan <= "0000000000001000";
                    when "1011" => atan <= "0000000000000100"; -- arctan(2^-11) Iterasi terakhir
                    when others => atan <= "0000000000000000"; 
                end case;
            end if;
        end process;
end Behavioral;