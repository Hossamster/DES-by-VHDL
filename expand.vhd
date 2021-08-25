library ieee;

use ieee.std_logic_1164.all;

entity expand is
	port(	data_in: in std_logic_vector(0 to 31);
		data_out: out std_logic_vector(0 to 47));
end expand;


architecture behavior of expand is

	begin 

		process(data_in)

			begin

    			-- converting 32 bit half text into 48 bit expanded text using expantion permutation
				data_out(0) <= data_in(31);
				data_out(1 to 5) <= data_in(0 to 4);
				data_out(6 to 11) <= data_in(3 to 8);
				data_out(12 to 17) <= data_in(7 to 12);
				data_out(18 to 23) <= data_in(11 to 16);
				data_out(24 to 29) <= data_in(15 to 20);
				data_out(30 to 35) <= data_in(19 to 24);
				data_out(36 to 41) <= data_in(23 to 28);
				data_out(42 to 46) <= data_in(27 to 31);
				data_out(47) <= data_in(0);

		end process;
end behavior;