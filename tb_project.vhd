library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_project is
end tb_project;

architecture behaviour of tb_project is
    signal clk: std_logic := '0';
    signal reset: std_logic := '0';
    signal X: std_logic := '0';
    signal Y: std_logic := '0';
    signal max_occupancy: std_logic_vector(5 downto 0) := "111111";
    signal Z: std_logic := '0';
    signal red_light: std_logic := '0';

    component project
    port(
        clk: in std_logic;
        reset: in std_logic;
        X: in std_logic;
        Y: in std_logic;
        max_occupancy: in std_logic_vector(5 downto 0);
        Z: out std_logic;
        red_light: out std_logic
    );
    end component;

begin
    UUT: project
    port map(
        clk => clk,
        reset => reset,
        X => X,
        Y => Y,

        max_occupancy => max_occupancy,
        Z => Z,
        red_light => red_light
    );

    clk_process : process
    begin
        while true loop
           clk <= '1';
           wait for 10 ns;
           clk <= '0';
          wait for 10 ns;  
       end loop;
    end process;

    reset_process : process
     begin
        reset <= '1';
        wait for 10 ns;  
        reset <= '0';
        wait;  
    end process;

    stim_process : process
     begin
       
        wait for 10 ns;

        for i in 0 to 62 loop
            if reset = '1' then
               X <= '0';
               Y <= '0';
           else
               X <= '1';
               Y <= '0';
           end if;
            wait for 10 ns;  
        end loop;

      X <= '0'; Y <= '1';
      wait for 10 ns;


      X <= '0'; Y <= '1';
       wait for 10 ns;

      X <= '0'; Y <= '1';
       wait for 10 ns;

      X <= '0'; Y <= '1';
       wait for 10 ns;

     X <= '0'; Y <= '1';
       wait for 10 ns;

      X <= '0'; Y <= '1';
       wait for 10 ns;
    end process;
end behaviour;