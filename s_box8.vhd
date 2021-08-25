library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity s_box8 is
	port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
end s_box8;


architecture behavior of s_box8 is

	type sbox is array(0 to 3,0 to 15) of integer range 0 to 15;
	constant box: sbox:= 
		((13,2,8,4,6,15,11,1,10,9,3,14,5,0,12,7),
		(1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2),
		(7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8),
		(2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11));

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