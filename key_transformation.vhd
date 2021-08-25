library ieee;
use ieee.std_logic_1164.all;

entity key_transformation is
	port(data_in: in std_logic_vector(0 to 63);
	left_half_key,right_half_key: out std_logic_vector(0 to 27));
end key_transformation;

architecture behavior of key_transformation is

	type PC_array is array(0 to 55) of integer range 0 to 63;

	-- PC-1 permutation algorism as array
	constant PC_1: PC_array := 
		((56,48,40,32,24,16,8,0,57,49,41,33,25,17,9,1,58,50,42,34,26,18,10,2,59,51,43,35,62,54,46,38,30,22,14,6,61,53,45,37,29,21,13,5,60,52,44,36,28,20,12,4,27,19,11,3));

	begin

		process(data_in)
	
			variable key: std_logic_vector(0 to 55);

			begin
        		-- appyling PC-1 permutation algorism using for loop
				for i in 0 to 55 loop
					key(i):=data_in(PC_1(i));
				end loop;
			
				-- splitting the permuted key into two 28 bit halfs
				left_half_key<=key(0 to 27);
				right_half_key<=key(28 to 55);

		end process;

end behavior;