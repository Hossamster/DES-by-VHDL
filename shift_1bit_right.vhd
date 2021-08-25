library ieee;

use ieee.std_logic_1164.all;

entity shift_1bit_right is
    port(data_in: in std_logic_vector(0 to 27);
        data_out: out std_logic_vector(0 to 27));
    end shift_1bit_right;
    
    
architecture behavior of shift_1bit_right is
    
    begin

        process(data_in)

            begin

                    -- shifting input half key one bit to the right
                    data_out(1 to 27) <= data_in(0 to 26);
		            data_out(0) <= data_in(27);

        end process;

end behavior;