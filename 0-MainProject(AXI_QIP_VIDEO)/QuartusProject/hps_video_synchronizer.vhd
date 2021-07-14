library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.numeric_std.ALL;

entity hps_video_synchronizer is port (
  
  read_data_bus :  in std_logic_vector(31 downto 0);
  write_data_bus : out std_logic_vector(31 downto 0);
  addr_data_bus :  out std_logic_vector(6 downto 0);
  write_signal :   out std_logic;
  byteenable :     out std_logic_vector(3 downto 0);
  ackn_signal : in std_logic;
  read_signal : out std_logic;
  --led : out std_logic;
  clock_50mhz :in std_logic;
  rst :in std_logic
); 
end entity;
architecture arch of hps_video_synchronizer is 

signal count: integer:=1;
signal freq : integer :=1250000;
signal tmp : std_logic := '0';
signal is_enabled : std_logic;
signal clock_slow : std_logic;
begin 

process(clock_50mhz,rst)
		begin
		if rst='0' then 
			clock_slow<='1';
			count <= 1;
			freq<=1250000;
			elsif(clock_50mhz'event and clock_50mhz='1') then
				if (count > freq) then
					clock_slow<='1';
					count <= 1;
				else 	
				  clock_slow<='0';
				  count <=count+1;
				end if;
		  end if;
	end process;

process(clock_slow)
	 begin
			if rising_edge(clock_slow) then
			   if is_enabled = '0' then
			 write_data_bus<=x"00000000";--disbale
			 addr_data_bus<="1001100";
			 byteenable<="1111";
			 write_signal<='1';
			 is_enabled<='1';
			-- led<='1';
			else 
			 write_data_bus<=x"00000004";--enable
			 addr_data_bus<="1001100";
			 byteenable<="1111";
			 write_signal<='1';
			 is_enabled<='0';
			-- led<='0';
		 end if;	 
      end if;
	 end process;

end architecture ;