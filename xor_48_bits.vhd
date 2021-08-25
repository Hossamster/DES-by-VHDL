library ieee;

use ieee.std_logic_1164.all;

entity xor_48_bits is
port(key,data_in: in std_logic_vector(0 to 47);
	data_out: out std_logic_vector(0 to 47));
end xor_48_bits;

--XOR is an easy task and can take place everywhere easily. But since in DES it is a separate step, it is implemented separetely.

architecture behavior of xor_48_bits is

begin 

    process(key,data_in)

        begin
            
	        data_out<= key xor data_in;

    end process;

end behavior;