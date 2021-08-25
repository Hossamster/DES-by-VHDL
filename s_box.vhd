library ieee;

use ieee.std_logic_1164.all;

entity s_box is
	port(data_in: in std_logic_vector(0 to 47);
	data_out: out std_logic_vector(0 to 31));
end s_box;

-- this function splits 48 bits into eight 6 bit groups and distributes them across the 8 s-boxes then collects the 32 bit output;

architecture behavior of s_box is

	component s_box1
		port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
	end component;

	component s_box2
		port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
	end component;

	component s_box3
		port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
	end component;

	component s_box4
		port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
	end component;

	component s_box5
		port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
	end component;

	component s_box6
		port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
	end component;

	component s_box7
		port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
	end component;

	component s_box8
		port(data_in: in std_logic_vector(0 to 5);
		data_out: out std_logic_vector(0 to 3));
	end component;


begin


	s1: s_box1 port map(data_in(0 to 5),data_out(0 to 3));
	s2: s_box2 port map(data_in(6 to 11),data_out(4 to 7));
	s3: s_box3 port map(data_in(12 to 17),data_out(8 to 11));
	s4: s_box4 port map(data_in(18 to 23),data_out(12 to 15));
	s5: s_box5 port map(data_in(24 to 29),data_out(16 to 19));
	s6: s_box6 port map(data_in(30 to 35),data_out(20 to 23));
	s7: s_box7 port map(data_in(36 to 41),data_out(24 to 27));
	s8: s_box8 port map(data_in(42 to 47),data_out(28 to 31));

end behavior;