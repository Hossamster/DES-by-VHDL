library ieee;

use ieee.std_logic_1164.all;

entity shift_1bit_left is
    port(data_in: in std_logic_vector(0 to 27);
        data_out: out std_logic_vector(0 to 27));
    end shift_1bit_left;
    
    
architecture behavior of shift_1bit_left is
    
    begin

        process(data_in)

            begin

                    -- shifting input half key one bit to the left
                    data_out(0 to 26) <= data_in(1 to 27);
		            data_out(27) <= data_in(0);

        end process;

end behavior;