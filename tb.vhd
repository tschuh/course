library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use work.pkg.all;



entity tb is
end;



architecture rtl of tb is


constant numDatas: natural := 6;
signal clk: std_logic := '1';
signal din: t_word := nulll;
signal dout: t_word := nulll;
component top
port (
  clk: in std_logic;
  din: in t_word;
  dout: out t_word
);
end component;
type t_data is array ( 0 to numDatas - 1 ) of std_logic_vector( 15 downto 0 );
constant data: t_data := (
  std_logic_vector( to_signed( 48, 16 ) ),
  std_logic_vector( to_signed( 4, 16 ) ),
  std_logic_vector( to_signed( 12, 16 ) ),
  std_logic_vector( to_signed( -4, 16 ) ),
  std_logic_vector( to_signed( 48, 16 ) ),
  std_logic_vector( to_signed( 48, 16 ) )
);
signal k: integer := 0;
shared variable s0, s1: integer := 45;
impure function f_din return std_logic_vector is
  variable r: real;
begin
  UNIFORM( s0, s1, r );
  return std_logic_vector( to_signed( integer( r * 2.0 ** 16 ) - 2 ** 15, 16 ) );
end function;


begin

clk <= not clk after 0.5 ns;

process ( clk ) is
begin
if rising_edge( clk ) then

  k <= k + 1;
  din.reset <= '0';
  din.valid <= '0';
  din.data <= ( others => '0' );
  if k + 1 < numDatas then
    din.valid <= '1';
    din.data <= f_din;
  else
    din.reset <= '1';
    k <= 0;
  end if;

end if;
end process;


c: top port map ( clk, din, dout );


end;