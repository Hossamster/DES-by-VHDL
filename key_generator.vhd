library ieee;
use ieee.std_logic_1164.all;

entity key_generator IS

	generic(
		shifting_parameter: in std_logic;
		left_or_right: in std_logic);

	port(left_key_in,right_key_in:in std_logic_vector(0 to 27);
		left_key_out,right_key_out:out std_logic_vector(0 to 27);
		sub_key:out std_logic_vector(0 to 47));

end key_generator;

architecture behavior of key_generator IS

	component shift_1bit_left is
		port(data_in: in std_logic_vector(0 to 27);
			data_out: out std_logic_vector(0 to 27));
	end component;

	component shift_2bit_left is
		port(data_in: in std_logic_vector(0 to 27);
			data_out: out std_logic_vector(0 to 27));
	end component;

	component shift_1bit_right is
		port(data_in: in std_logic_vector(0 to 27);
			data_out: out std_logic_vector(0 to 27));
	end component;

	component shift_2bit_right is
		port(data_in: in std_logic_vector(0 to 27);
			data_out: out std_logic_vector(0 to 27));
	end component;

	signal key: std_logic_vector(0 to 55);

	type PC_array is array(0 to 47) of integer range 0 to 55;

	-- PC-2 permutation algorism as array
	constant PC_2: PC_array := 
		((13,16,10,23,0,4,2,27,14,5,20,9,22,18,11,3,25,7,15,6,26,19,12,1,40,51,30,36,46,54,29,39,50,44,32,47,43,48,38,55,33,52,45,41,49,35,28,31));
		
	begin

		-- shifting half key according to round and moving them into one signal to simplify appling PC-2 permutation algorism
		-- shifting by one bit
		shift_by_1: if (shifting_parameter = '0') generate

			--	choosing direction of shift according to encryption or decryption
			-- shifting to the left
			left_shifting: if (left_or_right = '0') generate
				s11: shift_1bit_left port map(left_key_in,key(0 to 27));
				s12: shift_1bit_left port map(right_key_in,key(28 to 55));
			end generate left_shifting;

			-- shifting to the right
			right_shifting: if (left_or_right = '1') generate
				s13: shift_1bit_right port map(left_key_in,key(0 to 27));
				s14: shift_1bit_right port map(right_key_in,key(28 to 55));
			end generate right_shifting;

		end generate shift_by_1;

		-- shifting by two bits
		shift_by_2: if (shifting_parameter = '1') generate

			--	choosing direction of shift according to encryption or decryption
			-- shifting to the left
			left_shifting: if (left_or_right = '0') generate
				s21: shift_2bit_left port map(left_key_in,key(0 to 27));
				s22: shift_2bit_left port map(right_key_in,key(28 to 55));
			end generate left_shifting;

			-- shifting to the right
			right_shifting: if (left_or_right = '1') generate
				s23: shift_2bit_right port map(left_key_in,key(0 to 27));
				s24: shift_2bit_right port map(right_key_in,key(28 to 55));
			end generate right_shifting;

		end generate shift_by_2;

		process(key)

			variable sk: std_logic_vector(0 to 47);

				begin

					--appling PC-2 permutation algorism using for loop
					for i in 0 to 47 loop
						sk(i):=key(PC_2(i));
					end loop;

					sub_key <= sk;

		end process;

		--moving shifted half keys into output to be used in the next sup key genrartor
		right_key_out <= key(28 to 55);
		left_key_out <= key(0 to 27);

end behavior;