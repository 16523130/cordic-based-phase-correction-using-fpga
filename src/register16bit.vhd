-- ========================================= REGISTER 16 BIT ====================================================
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Definisi Entity
entity register16bit is
    port (
        Number  : in    signed(15 downto 0);    -- Bilangan biner yang akan disimpan
        En      : in    std_logic;              -- Izin untuk menyimpan
        Res     : in    std_logic;              -- Reset register menjadi nilai default "0000000000000000"
        Clk     : in    std_logic;              -- Clock
        Data    : out   signed(15 downto 0);    -- Bilangan yang telah disimpan
        regdone : out   std_logic               -- Status penyimpanan (sudah selesai menyimpan atau belum)
    );
end register16bit;

-- Definisi Architecture
architecture behavior of register16bit is
    signal v_data    : signed(15 downto 0) := (others => '0'); -- inisiasi sinyal untuk menyimpan data sementara dengan nilai default "0000000000000000"
    signal v_regdone : std_logic := '0'; -- inisiasi status penyimpanan awal ("0" berarti belum menyimpan bilangan)
begin
    process (Clk) -- Proses berjalan berdasarkan sinyal Clk
    begin
        if rising_edge(Clk) then
            if (Res = '1') then
                -- Reset register dan sinyal regdone menjadi nilai defaultnya
                v_data <= (others => '0'); -- antisipasi kesalahan input (kemungkinan hampir tidak terjadi);
                v_regdone <= '0';
            elsif (En = '1') then
                -- Simpan nilai dan aktifkan regdone, tanda kalau proses penyimpanan telah selesai
                v_data <= Number;
                v_regdone <= '1';
            else
                -- Nonaktifkan regdone jika tidak ada aktivitas penyimpanan
                v_regdone <= '0';
            end if;
        end if;
    end process;

    -- Output data dan status regdone
    Data <= v_data;
    regdone <= v_regdone;

end behavior;