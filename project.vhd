library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity project is
    port(
        clk: in std_logic;
        reset: in std_logic;
        X: in std_logic;
        Y: in std_logic;
        max_occupancy: in std_logic_vector(5 downto 0);
        Z: out std_logic;
        red_light: out std_logic
    );
end project;

architecture behaviour of project is
    signal count_of_room: std_logic_vector(5 downto 0) := "000000";
    signal max_reached: std_logic := '0';
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            count_of_room <= (others => '0');
            Z <= '0';
            red_light <= '0';
        elsif (clk'event and clk = '1') then
            if (X = '1' and Y = '0') then
                if (count_of_room < max_occupancy) then
                    count_of_room <= count_of_room + 1;
                    max_reached <= '0';
                elsif (count_of_room = max_occupancy) then
                    max_reached <= '1';
                end if;
            elsif (Y = '1' and X = '0') then
                if (count_of_room > "000000") then
                    count_of_room <= count_of_room - 1;
                    max_reached <= '0';
                end if;
            end if;
        end if;

        Z <= max_reached;
        red_light <= max_reached;
    end process;
end behaviour;
