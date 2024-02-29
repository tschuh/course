library ieee;
use ieee.std_logic_1164.all;
use work.pkg.all;


entity top is
port (
  clk: in std_logic;
  din: in t_word;
  dout: out t_word
);
end;


architecture rtl of top is


signal word: t_word := nulll;


begin


dout <= word;

process ( clk ) is
begin
if rising_edge( clk ) then

  word <= din;

end if;
end process;


end;