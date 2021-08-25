library ieee;

use ieee.std_logic_1164.all;

entity straight_permutation is 
port(data_in: in std_logic_vector(0 to 31);
    data_out:out std_logic_vector(0 to 31));
end straight_permutation;


architecture behavior of straight_permutation is
	
	type sp_array is array(0 to 31) of integer range 0 to 31;
	
	-- straight permutation algorism as array
	constant sp: sp_array :=
		((15,6,19,20,28,11,27,16,0,14,22,25,4,17,30,9,1,7,23,13,31,26,2,8,18,12,29,5,21,10,3,24));
	begin

	process(data_in) is
		
		variable permuted : std_logic_vector(0 to 31);

		begin
			

			-- applying permutation algorism using for loop
			for i in 0 to 31 loop
				permuted(i):=data_in(sp(i));
			end loop;

			-- assigning data to output
            data_out <= permuted;
		
	end process;
	
end behavior;