-- ========================================= 2i TABEL ===================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

-- Definisi Architecture
entity mux2i is
    Port (
        i           : in  std_logic_vector(3 downto 0); -- index 
        keluaran    : out  signed(15 downto 0);         -- bilangan biner signed fixed point Q1.2.13 dari 2^-i
        enablemux   : in std_logic                      -- memperbolehkan adanya pengambilan data dari mux
    );

end mux2i;

-- Definisi Erchitecture
architecture Behavioral of mux2i is
    begin
        process(i, enablemux)
        begin
            if enablemux = '1' then 
                case i is -- mux memilih berdasarkan index
                    when "0000" => keluaran <= "0010000000000000"; --2^0
                    when "0001" => keluaran <= "0001000000000000"; --2^-1
                    when "0010" => keluaran <= "0000100000000000"; -- 
                    when "0011" => keluaran <= "0000010000000000"; --
                    when "0100" => keluaran <= "0000001000000000"; --
                    when "0101" => keluaran <= "0000000100000000"; --
                    when "0110" => keluaran <= "0000000010000000"; --
                    when "0111" => keluaran <= "0000000001000000"; --
                    when "1000" => keluaran <= "0000000000100000"; --
                    when "1001" => keluaran <= "0000000000010000"; --
                    when "1010" => keluaran <= "0000000000001000"; --
                    when "1011" => keluaran <= "0000000000000100"; --2^-11 Iterasi terakhir
                    when others => keluaran <= "0000000000000000"; --
                end case;
            end if;
        end process;
end Behavioral;