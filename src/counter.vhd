-- ========================================= COUNTER 4 BIT ===================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Definisi Entity
entity counter4bit is
    port (
        En         : in    std_logic;                       -- memperbolehkan counter bekerja
        Res        : in    std_logic;                       -- Mereset counter ke nilai default
        Clk        : in    std_logic;                       -- Clock
        Count      : out   std_logic_vector (3 downto 0);   -- Bilangan yang telah dihitung 
        countdone  : out   std_logic                        -- Penanda bahwa satu kali perhitungan telah selesai
    );
end counter4bit;

-- Definisi Architecture
architecture rtl of counter4bit is
    -- Counter akan melakukan satu kali perhitungan setiap 6 clock dan perhitungan dimulai dari "0000". Hal ini karena output counter berfungsi selayaknya index. Perhitungan tiap 6 clock akan mencegah operasi antariterasi bertumpukan sehingga menyebabkan hasil perhitungan yang salah.
    signal count_reg     : unsigned(3 downto 0) := (others => '0'); -- Register internal
    signal clk_div       : unsigned(2 downto 0) := (others => '0'); -- Divider untuk 6 clock
    signal v_countdone   : std_logic := '0';                        -- Inisialisasi dengan nilai default
begin
    process (Clk, Res)
    begin
        if Res = '1' then
            count_reg <= (others => '0'); -- Reset counter ke 0000
            clk_div <= (others => '0');   -- Reset divider
            v_countdone <= '0';           -- Reset sinyal countdone
        elsif rising_edge(Clk) then
            if En = '1' then
                if clk_div = 5 then
                    -- Jika divider mencapai 5, reset divider dan naikkan counter
                    clk_div <= (others => '0');
                    count_reg <= count_reg + 1;
                    v_countdone <= '1';         -- Set countdone menjadi '1' saat count bertambah sebagai penanda bahwa proses satu kali perhitungan telah selesai
                else
                    -- Inkrementasi divider
                    clk_div <= clk_div + 1;
                    v_countdone <= '0'; -- Set countdone kembali ke '0'
                end if;
            else
                v_countdone <= '0'; -- Set countdone kembali ke '0' jika En = '0'
            end if;
        end if;
    end process;

    Count <= std_logic_vector(count_reg);
    countdone <= v_countdone;

end rtl;