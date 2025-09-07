-- ========================================= MUX 2 TO 1  =====================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Definisi Entity
entity mux2to1 is
    port (
        Nprev       : in    signed (15 downto 0); -- Bilangan input awal
        Nnext       : in    signed (15 downto 0); -- Bilangan hasil perhitungan iterasi cordic
        Sel         : in    std_logic;            -- Sinyal untuk memilih antara 2 bilangan
        Data        : out   signed (15 downto 0); -- Bilangan yang diambil
        enablemux   : in    std_logic             -- Memperbolehkan multiplexer bekerja
    );
end mux2to1;

-- Definisi Achitecture
architecture rtl of mux2to1 is
begin
    process (enablemux, Sel, Nprev, Nnext)
    begin
        if enablemux = '1' then
            if (Sel = '1') then
                Data <= Nnext; -- Jika sinyal selektor bernilai 1, maka bilangan hasil perhitungan iterasi akan diambil
            else
                Data <= Nprev; -- Jika sinyal selektor bernilai 0, maka bilangan input awal akan diambil
            end if;
        end if;
    end process;
end rtl;
