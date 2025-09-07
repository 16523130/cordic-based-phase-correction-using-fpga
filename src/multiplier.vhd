-- ========================================= MULTIPLIER ===================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

-- Definisi Entity
entity multiplier24to16bit is
    Port (
        Bilangan         : in  signed(7 downto 0);  -- Bilangan yang akan dikalikan format Q1.2.5
        Pengoperasi      : in  signed(15 downto 0); -- Bilangan pengali format Q.1.2.13
        Result           : out signed(15 downto 0); -- Hasil operasi yang telah dilakukan bitslice untuk mencegah overflow dalam format Q1.2.13
        enablemultiplier : in  std_logic;           -- Memperbolehkan operasi perkalian bekerja
        multdone         : out std_logic            -- Penanda jika operasi perkalian telah selesai (untuk mencegah perkalian dilakukan pada bilangan yang bukan target operasi)
    );
end multiplier24to16bit;

-- Definisi Architecture
architecture Behavioral of multiplier24to16bit is
    signal temp_result  : signed(23 downto 0); -- Hasil sementara. (Oleh karena 8 bit dikalikan dengan 16 bit, maka hasil maksimumnya ialah 24 bit)
    signal v_multdone   : std_logic := '0';    -- Inisiasi sinyal multdone
begin
    process(enablemultiplier, Bilangan, Pengoperasi)
    begin
        if enablemultiplier = '1' then -- Operasi perkalian bekerja jika enableperkalian = '1'
            -- Lakukan operasi perkalian
            temp_result <= Bilangan * Pengoperasi; -- hasil disini memiliki format Q2.4.18 (bit sign ada 2 mengikuti algoritma perkalian VHDL)
            v_multdone <= '1'; -- pendanda selesai
        else
            -- Nonaktifkan multdone jika tidak ada operasi
            v_multdone <= '0';
        end if;
    end process;

    -- Konversi hasil operasi ke format Q3.13 agar tidak terjadi overflow
    Result <= (temp_result(23) & temp_result(19 downto 5)); 
    -- Slice bit yang relevan (1 sign pada bit 23 atau 22, 2 integer bit 19 ampai 18, 13 pecahan dari bit 17 sampai 5). Integer pada bit ke 22 dan 21 tidak dihiraukan karena batas input yang menyebabkan 2 bilangan itu tidak bernilai ("0" untuk positif atau "1" untuk negatif)
    multdone <= v_multdone; -- Outputkan sinyal multdone
end Behavioral;