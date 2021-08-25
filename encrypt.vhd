library ieee;

use ieee.std_logic_1164.all;

entity encrypt is
    port(data_in: in std_logic_vector(0 to 63);
	data_out: out std_logic_vector(0 to 63));
end encrypt;

architecture behavior of encrypt is

    component initial_permutation is
        port(data_in: in std_logic_vector(0 to 63);
	    permuted_left_half,permuted_right_half: out std_logic_vector(0 to 31));
    end component;

    component key_transformation is
        port(data_in: in std_logic_vector(0 to 63);
        left_half_key,right_half_key: out std_logic_vector(0 to 27));
    end component;

    component key_generator is
        generic(
		shifting_parameter: in std_logic;
		left_or_right: in std_logic);
	    port(left_key_in,right_key_in:in std_logic_vector(0 to 27);
		left_key_out,right_key_out:out std_logic_vector(0 to 27);
		sub_key:out std_logic_vector(0 to 47));
    end component;

    component round is
        port(left_plain_text,right_plain_text: in std_logic_vector(0 to 31);
        sub_key: in std_logic_vector(0 to 47);
        left_data_out,right_data_out: out std_logic_vector(0 to 31));
    end component;

    component swap_left_right_32_bits is
        port(data_in_left,data_in_right: in std_logic_vector(0 to 31);
        data_out_left,data_out_right: out std_logic_vector(0 to 31));
    end component;

    component reverse_initial_permutation is
        port(left_half: in std_logic_vector(0 to 31);
        right_half: in std_logic_vector(0 to 31);
        data_out: out  std_logic_vector(0 to 63));
    end component;

    type W16x48 is
        array (0 to 15) of std_logic_vector(0 to 47);
    type W17x32 is
        array (0 to 16) of std_logic_vector(0 to 31);
    type W17x28 is
        array (0 to 16) of std_logic_vector(0 to 27);
        
    signal subkey: w16x48;
    signal left_plain_text,right_plain_text: w17x32;
    signal left_key,right_key: w17x28;
    signal swaped_left_text,swapped_right_text: std_logic_vector(0 to 31);
    
    constant key : std_logic_vector(0 to 63) := x"5ab67849b6dd4e96";

    begin

        s1: initial_permutation port map(data_in,left_plain_text(0),right_plain_text(0));
        s2: key_transformation port map(key,left_key(0),right_key(0));

        -- generating 16 rounds of key generation and encryption
        gen_rounds:for i in 0 to 15 generate

            -- shifting by one bit for rounds 1, 2, 9, 16.
            gen0:if ((i = 0) or (i = 1) or (i = 8) or (i = 15)) generate

                gen0: key_generator generic map('0','0')
                port map(left_key(i),right_key(i),left_key(i+1),right_key(i+1),subkey(i));
            
            end generate gen0;
        
            -- shifting by two bits for other rounds.
            gen1:if ((i /= 0) and (i /= 1) and (i /= 8) and (i /= 15)) generate

                gen1: key_generator generic map('1','0')
                port map(left_key(i),right_key(i),left_key(i+1),right_key(i+1),subkey(i));

            end generate gen1;
    
            gen2: round port map(left_plain_text(i),right_plain_text(i),subkey(i),left_plain_text(i+1),right_plain_text(i+1));
            
        end generate gen_rounds;

        s3: swap_left_right_32_bits port map(left_plain_text(16),right_plain_text(16),swaped_left_text,swapped_right_text);
        s4: reverse_initial_permutation port map(swaped_left_text,swapped_right_text,data_out);

end behavior;