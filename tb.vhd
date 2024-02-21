library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb is
end;


architecture rtl of tb is


signal clk: std_logic := '1';
signal din: std_logic_vector( 15 downto 0 );
signal dout: std_logic_vector( 15 downto 0 );
component top
port (
  clk: in std_logic;
  din: in std_logic_vector( 15 downto 0 );
  dout: out std_logic_vector( 15 downto 0 )
);
end component;

constant numInputs:natural := 5;
signal k: natural := 0;
type list is array ( 0 to numInputs - 1 ) of std_logic_vector( 15 downto 0 );
constant dins: list := (
  std_logic_vector( to_unsigned( 4, 16 ) ),
  std_logic_vector( to_unsigned( 7, 16 ) ),
  std_logic_vector( to_unsigned( 9, 16 ) ),
  std_logic_vector( to_unsigned( 1, 16 ) ),
  std_logic_vector( to_unsigned( 2, 16 ) )
);

begin


clk <= not clk after 0.5ns;

process( clk ) is
begin
if rising_edge( clk ) then

  k <= k + 1;
  if k + 1 = numInputs then
    k <= 0;
  end if;
  din <= dins( k );

end if;
end process;

c: top port map ( clk, din, dout );

end;