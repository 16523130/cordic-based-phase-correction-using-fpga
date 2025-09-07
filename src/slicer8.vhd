-- ========================================= Slicer 8 ===================================================
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  

-- Definisi Entity
entity slicer8 is
    Port (
        Bilangan       : in  signed(15 downto 0); -- Bilangan yang akan dislice bit nya
        Result         : out signed(7 downto 0)   -- Hasil slice
    );

end slicer8;

-- Definisi Architecture
architecture Behavioral of slicer8 is
begin
    Result <= Bilangan(15 downto 8); -- proses slice
end Behavioral;