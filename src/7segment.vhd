-- ==================================================== Penampil Ke 7 Segment =================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Definisi Entity
entity asciiHex is
	port	(
				Ascii		:		in		std_logic_vector	(7 downto 0); -- 8bit 
				HEX1		:		out		std_logic_vector	(6 downto 0)  -- 7 bit (representasi a,b,c,d,e,f,g)
			);
end asciiHex;

-- Definisi Architecture
architecture behavior of asciiHex is
    -- Kode Hexadesimal
    CONSTANT NOL     : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110000";
	CONSTANT SATU    : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110001"; 
	CONSTANT DUA     : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110010"; 
	CONSTANT TIGA    : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110011"; 
	CONSTANT EMPAT   : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110100"; 
	CONSTANT LIMA    : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110101"; 
	CONSTANT ENAM    : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110110"; 
	CONSTANT TUJUH   : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110111"; 
	CONSTANT DELAPAN : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00111000"; 
	CONSTANT SEMBILAN: STD_LOGIC_VECTOR(7 DOWNTO 0) := "00111001"; 
	CONSTANT A		 : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00111010"; 
	CONSTANT B		 : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00111011"; 
	CONSTANT C 		 : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00111100"; 
	CONSTANT D		 : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00111101"; 
	CONSTANT E		 : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00111110"; 
	CONSTANT F		 : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00111111"; 
 
begin
	PROCESS(Ascii) 
 	BEGIN 
		CASE Ascii IS  --nilai HIGH saat 0
		WHEN NOL      => HEX1 <= "0000001"; --a,b,c,d,e,f,g -> g mati yang ditengah membentuk angka 0
		WHEN SATU     => HEX1 <= "1001111"; --b,c hidup membentuk angka 1
		WHEN DUA      => HEX1 <= "0010010"; 
		WHEN TIGA     => HEX1 <= "0000110"; 
		WHEN EMPAT    => HEX1 <= "1001100"; 
		WHEN LIMA     => HEX1 <= "0100100"; 
		WHEN ENAM     => HEX1 <= "0100000"; 
		WHEN TUJUH    => HEX1 <= "0001111"; 
		WHEN DELAPAN  => HEX1 <= "0000000"; 
		WHEN SEMBILAN => HEX1 <= "0000100"; 

		WHEN A        => HEX1 <= "0001000"; --a,b,c,d,e,f,g -> d mati yang ditengah bawah membentuk huruf A
		WHEN B        => HEX1 <= "1100000"; --a,b mati membentuk huruf b
		WHEN C        => HEX1 <= "0110001"; 
		WHEN D        => HEX1 <= "1000010"; 
		WHEN E        => HEX1 <= "0110000"; 
		WHEN F        => HEX1 <= "0111000"; 

		WHEN OTHERS   => HEX1 <= "1111111"; 
		END CASE; 
	END PROCESS; 
	
end behavior;