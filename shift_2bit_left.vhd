library ieee;

use ieee.std_logic_1164.all;

entity shift_2bit_left is
    port(data_in: in std_logic_vector(0 to 27);
        data_out: out std_logic_vector(0 to 27));
    end shift_2bit_left;
    
    
architecture behavior of shift_2bit_left is
    
    begin

        process(data_in)

            begin

                    -- shifting input half key two bits to the left
                    data_out(0 to 25) <= data_in(2 to 27);
		            data_out(26 to 27) <= data_in(0 to 1);

        end process;

end behavior;