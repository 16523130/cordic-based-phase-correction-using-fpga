-- ========================================= CEK TANDA ===================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

-- Definisi Entity
entity getsign is
    Port (
        Parameter   : in  signed(15 downto 0); -- Bilangan yang akan dicek tandanya
        Result      : out std_logic;           -- Tanda dari Parameter
        cekdone     : out std_logic;           -- Penanda jika pengecekan telah selesai 
        enablecek   : in  std_logic            -- Memperbolehkan adanya pengecekan tanda atau tidak (untuk mencegah adanya penumpukan operasi dari bilangan-bilangan yang bukan target)
    );
end getsign;

-- Definisi Architecture
architecture Behavioral of getsign is
    signal v_cekdone : std_logic := '0'; -- Inisiasi status pengecekan 
begin
    process(enablecek, Parameter)
    begin
        if enablecek = '1' then -- pengecekan dilakukan jika enablecek = '1'
            -- Ambil tanda dari Parameter. Karena format bilangan yang digunakan ialah signed, maka cukup ambil LSB dari bilangan biner
            Result <= Parameter(15);
            v_cekdone <= '1'; -- Berikan tanda selesai
        else
            -- Matikan cekdone jika tidak ada operasi
            v_cekdone <= '0';
        end if;
    end process;
    -- Assign cekdone output
    cekdone <= v_cekdone;
end Behavioral;