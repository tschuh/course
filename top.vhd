library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity top is
port (
  clk: in std_logic;
  din: in std_logic_vector( 15 downto 0 );
  out_valid: out std_logic;
  out_data: out std_logic_vector( 15 downto 0 )
);
end;



architecture rtl of top is


begin


process( clk ) is
begin
if rising_edge( clk ) then

  --dout <= din;

end if;
end process;




end;