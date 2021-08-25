library ieee;

use ieee.std_logic_1164.all;

entity decrypt_tb is
end decrypt_tb;

architecture behavior of decrypt_tb is

    component decrypt is
        port(data_in: in std_logic_vector(63 downto 0);
        data_out: out std_logic_vector(63 downto 0));
    end component;

    signal data_in,data_out: std_logic_vector(63 downto 0);

    begin

        data_in <= x"3B7AC2FB38864994" , x"EBC3A5AE6A8E2D51" after 200 ns , x"7DBFC53663F25700" after 400 ns , x"609EB8092F7133E5" after 600 ns , x"E10D5272D4B91905" after 800 ns;

        dut: decrypt port map(data_in,data_out);

end behavior;