library ieee;
use ieee.std_logic_1164.all;


package pkg is

constant widthData: natural := 16;
type t_word is
record
  reset: std_logic;
  valid: std_logic;
  data: std_logic_vector( widthData - 1 downto 0 );
end record;
function nulll return t_word;


end;



package body pkg is

  
function nulll return t_word is begin return ( '0', '0', ( others => '0' ) ); end function;

end;