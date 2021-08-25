library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity s_box4 is
	port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
end s_box4;


architecture behavior of s_box4 is

	type sbox is array(0 to 3,0 to 15) of integer range 0 to 15;
	constant box: sbox:= 
		((7,13,14,3,0,6,9,10,1,2,8,5,11,12,4,15),
		(13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9),
		(10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4),
		(3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14));

	begin
	
		process(data_in) is

			variable column: integer range 0 to 15; -- this variable holds bits 4 to 1 of the input in decimal representation.
			variable row: integer range 0 to 3;	-- this variable holds bits first and last bit of the input in decimal representation.
			variable tmp: std_logic_vector(0 to 1); --this variable holds the first and last bit of the input that represents the row.
	
			variable data_out_decimal: integer range 0 to 15; --this variable contains the output data in decimal representation.
	
			begin
	
				column:=to_integer(unsigned(data_in(1 to 4))); -- converting from std_logic_vector to integer.
				tmp:=data_in(0)&data_in(5);
				row:=to_integer(unsigned(tmp)); -- converting from std_logic_vector to integer.
				data_out_decimal:=box(row,column);
	
				data_out<=std_logic_vector(to_unsigned(data_out_decimal,data_out'length)); -- converting from integer to std_logic_vector.
	
		end process;

end behavior;