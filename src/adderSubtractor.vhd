-- ========================================= ADDER - SUBTRACTOR ===================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

-- Definisi Entity
entity addsub is
    Port (
        Bilangan       : in  signed(15 downto 0); -- Bilangan yang akan dikurangi atau ditambah
        Pengoperasi    : in  signed(15 downto 0); -- Bilangan yang akan mengurangi atau menambah
        -- Input disetting agar berada pada rentang -1.5 sampai 1.5 sebagai tetapan batas sinyal dan untuk mencegah overflow  
        add_sub        : in  std_logic;           -- Kontrol : '0' untuk penjumlahan, '1' untuk pengurangan. 
        Result         : out signed(15 downto 0); -- Hasil operasi penjumlahan 2 bilangan biner signed
        enableaddsub   : in std_logic             -- Sinyal yang memperbolehkan adanya operasi atau tidak (untuk mencegah adanya penumpukan operasi dari beberapa state sekaligus)
        );

end addsub;


-- Definisi Architecture
architecture Behavioral of addsub is
begin
    process(Bilangan, Pengoperasi, add_sub, enableaddsub)
    begin
        if (enableaddsub = '1') then -- Boleh bekerja bila enableaddsub = '1'
            if add_sub = '0' then
                -- Penjumlahan jika add_sub = '0'
                Result <= Bilangan+Pengoperasi;
            else
                -- Pengurangan jika add sub = '1'
                Result <= Bilangan-Pengoperasi;
            end if;
        end if;
    end process;

end Behavioral;