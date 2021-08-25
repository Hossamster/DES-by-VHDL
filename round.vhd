library ieee;

use ieee.std_logic_1164.all;

entity round is
    port(left_plain_text,right_plain_text: in std_logic_vector(0 to 31);
    sub_key: in std_logic_vector(0 to 47);
	left_data_out,right_data_out: out std_logic_vector(0 to 31));
end round;

-- this function represents what happens in every round of encryption.

architecture behavior of round is

	component expand
	port(data_in: in std_logic_vector(0 to 31);
		data_out: out std_logic_vector(0 to 47));
	end component;

	component xor_48_bits
	port(key,data_in: in std_logic_vector(0 to 47);
		data_out: out std_logic_vector(0 to 47));
	end component;

	component s_box
	port(data_in: in std_logic_vector(0 to 47);
		data_out: out std_logic_vector(0 to 31));
	end component;

	component straight_permutation
	port(data_in: in std_logic_vector(0 to 31);
		data_out: out std_logic_vector(0 to 31));
	end component;

	component xor_32_bits 
	port(key,data_in: in std_logic_vector(0 to 31);
		data_out: out std_logic_vector(0 to 31));
	end component;

	signal expanded_data: std_logic_vector(0 to 47);
	signal xored_data: std_logic_vector(0 to 47);
	signal s_boxed_data: std_logic_vector(0 to 31);
    signal permuted_data: std_logic_vector(0 to 31);
begin

    s0: expand port map (right_plain_text,expanded_data);
    s1: xor_48_bits port map(sub_key,expanded_data,xored_data);
    s2: s_box port map(xored_data,s_boxed_data);
    s3: straight_permutation port map(s_boxed_data,permuted_data);
    s4: xor_32_bits port map(permuted_data,left_plain_text,right_data_out);

	left_data_out<=right_plain_text;

end behavior;