library ieee;

use ieee.std_logic_1164.all;

entity shift_2bit_right is
    port(data_in: in std_logic_vector(0 to 27);
        data_out: out std_logic_vector(0 to 27));
    end shift_2bit_right;
    
    
architecture behavior of shift_2bit_right is
    
    begin

        process(data_in)

            begin
                
                -- shifting input half key two bits to the right
                data_out(2 to 27) <= data_in(0 to 25);
		        data_out(0 to 1) <= data_in(26 to 27);

        end process;

end behavior;