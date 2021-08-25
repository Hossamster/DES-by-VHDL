library ieee;

use ieee.std_logic_1164.all;

entity encrypt_tb is
end encrypt_tb;

architecture behavior of encrypt_tb is

    component encrypt is
        port(data_in: in std_logic_vector(63 downto 0);
        data_out: out std_logic_vector(63 downto 0));
    end component;

    signal data_in,data_out: std_logic_vector(63 downto 0);

    begin

        data_in <= x"bfa4e7b4c47e58f3" , x"e61dfba986f98977" after 200 ns , x"eb36d131c4af99dd" after 400 ns , x"7d541eddcb142c8a" after 600 ns , x"06e7d9dc05a996bc" after 800 ns;

        dut: encrypt port map(data_in,data_out);
            
end behavior;