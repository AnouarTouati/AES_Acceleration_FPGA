library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity aes_core is 
port (
     clk : in std_logic;             
     reset : in std_logic;            
     avs_s0_address: in std_logic_vector(1 downto 0);    
     avs_s0_read : in std_logic;       
     avs_s0_write : in std_logic;      
     avs_s0_readdata : out std_logic_vector (127 downto 0);    
     avs_s0_writedata : in std_logic_vector (127 downto 0)
);
end aes_core;

architecture arch of aes_core is 
component aes128_fast port(
      clk       : in std_logic;
      reset     : in std_logic;
      start     : in std_logic; -- to initiate the encryption/decryption process after loading
      mode      : in std_logic; -- to select encryption or decryption
      load      : in std_logic; -- to load the input and keys.has to 
      key       : in std_logic_vector(127 downto 0);
      data_in   : in std_logic_vector(127 downto 0);
      data_out  : out std_logic_vector(127 downto 0);
      done      : out std_logic
     );
end component;

signal key_signal : std_logic_vector(127 downto 0);
signal data_in_signal  : std_logic_vector(127 downto 0);
signal data_out_signal  : std_logic_vector(127 downto 0);
signal control_signal  : std_logic_vector(2 downto 0);
signal load_internal : std_logic;
begin

submodule : aes128_fast port map (
       clk =>clk,
       reset => reset,
       start => control_signal(0),
       mode  => control_signal(1),
       load  => load_internal,
       done  => control_signal(2),
		 key => key_signal,
		 data_in => data_in_signal,
		 data_out => data_out_signal
);

process(avs_s0_read)
 begin
    if avs_s0_read ='1' then
        case avs_s0_address is 
        when "11" => avs_s0_readdata <=x"0000000000000000000000000000000"&'0' & control_signal;
        when "10" => avs_s0_readdata <=data_out_signal;
        when "01" => avs_s0_readdata <= data_in_signal;
        when "00" => avs_s0_readdata <= key_signal;
        end case;
    else
        avs_s0_readdata <= (others => 'Z');
    end if;
end process;

process (clk)
  begin
    if rising_edge(clk) and avs_s0_write='1' then
        case avs_s0_address is 
		  
        when "00" => key_signal<=avs_s0_writedata;
		               load_internal<='1';
        when "01" => data_in_signal<=avs_s0_writedata;
		               load_internal<='1';
		  when "10" => null;
        when "11" => control_signal(1 downto 0)<= avs_s0_writedata(1 downto 0);
		               
        end case;
		  elsif rising_edge(clk) and load_internal<='1' then 
		     load_internal<='0';
		  elsif rising_edge(clk) and control_signal(0)<='1' then 
		     control_signal(0)<='0';
    end if;
    end process;
end architecture;


         

  
  
  









