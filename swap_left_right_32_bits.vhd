library ieee;

use ieee.std_logic_1164.all;

entity swap_left_right_32_bits is
	port(data_in_left,data_in_right: in std_logic_vector(0 to 31);
		data_out_left,data_out_right: out std_logic_vector(0 to 31));
end swap_left_right_32_bits;

-- This function is used right after the final round. The encrypted plain text goes under this operation, then in reverse IP and the encryption is completed.

architecture behavior of swap_left_right_32_bits is

begin

	process(data_in_left,data_in_right)

		begin
                
				data_out_left<=data_in_right;
				data_out_right<=data_in_left;

	end process;
	
end behavior;