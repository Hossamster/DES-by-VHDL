library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity s_box1 is
port(	data_in: in std_logic_vector(0 to 5);
	data_out: out std_logic_vector(0 to 3));
end s_box1;


architecture behavior of s_box1 is

	type sbox is array(0 to 3,0 to 15) of integer range 0 to 15;
	constant box: sbox:= 
		((14,4,13,1,2,15,11,8,3,10,6,12,5,9,0,7),
		(0,15,7,4,14,2,13,1,10,6,12,11,9,5,3,8),
		(4,1,14,8,13,6,2,11,15,12,9,7,3,10,5,0),
		(15,12,8,2,4,9,1,7,5,11,3,14,10,0,6,13));

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