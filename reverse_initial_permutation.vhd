library ieee;

use ieee.std_logic_1164.all;

entity reverse_initial_permutation is 
    port(left_half: in std_logic_vector(0 to 31);
	right_half: in std_logic_vector(0 to 31);
	data_out: out  std_logic_vector(0 to 63));
end reverse_initial_permutation;

architecture behavior of reverse_initial_permutation is

    type reverse_ip_array is array(0 to 63) of integer range 0 to 63;
	
	-- reverse initial permutation algorism as array
	constant reverse_ip: reverse_ip_array :=
		((39,7,47,15,55,23,63,31,38,6,46,14,54,22,62,30,37,5,45,13,53,21,61,29,36,4,44,12,52,20,60,28,35,3,43,11,51,19,59,27,34,2,42,10,50,18,58,26,33,1,41,9,49,17,57,25,32,0,40,8,48,16,56,24));
    begin

        process(left_half,right_half)

            variable final_data,encrypted_data: std_logic_vector(0 to 63);

            begin

                -- combining two hlafs into one
                encrypted_data := left_half &  right_half;

                -- applying permutation algorism using for loop
                for i in 0 to 63 loop
                    final_data(i):=encrypted_data(reverse_ip(i));
                end loop;

                -- assigning data to ouput
                data_out <= final_data;
        
        end process;

end behavior;