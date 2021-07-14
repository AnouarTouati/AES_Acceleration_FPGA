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
		
		data_out(127 downto 120)=>data_out_signal(71 downto 64),
		data_out(119 downto 112)=>data_out_signal(79 downto 72),
		data_out(111 downto 104)=>data_out_signal(87 downto 80),
		data_out(103 downto 96)=>data_out_signal(95 downto 88),
		
		data_out(71 downto 64)=>data_out_signal(127 downto 120),
		data_out(79 downto 72)=>data_out_signal(119 downto 112),
		data_out(87 downto 80)=>data_out_signal(111 downto 104),
		data_out(95 downto 88)=>data_out_signal(103 downto 96),
		
		data_out(63 downto 56)=>data_out_signal(7 downto 0),
		data_out(55 downto 48)=>data_out_signal(15 downto 8),
		data_out(47 downto 40)=>data_out_signal(23 downto 16),
		data_out(39 downto 32)=>data_out_signal(31 downto 24),
		
		data_out(7 downto 0)=>data_out_signal(63 downto 56),
		data_out(15 downto 8)=>data_out_signal(55 downto 48),
		data_out(23 downto 16)=>data_out_signal(47 downto 40),
		data_out(31 downto 24)=>data_out_signal(39 downto 32)
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
		  
        when "00" => key_signal(127 downto 120)<=avs_s0_writedata(71 downto 64);
		               key_signal(119 downto 112)<=avs_s0_writedata(79 downto 72);
						   key_signal(111 downto 104)<=avs_s0_writedata(87 downto 80);
						   key_signal(103 downto 96)<=avs_s0_writedata(95 downto 88);
							
							key_signal(71 downto 64)<=avs_s0_writedata(127 downto 120);
		               key_signal(79 downto 72)<=avs_s0_writedata(119 downto 112);
						   key_signal(87 downto 80)<=avs_s0_writedata(111 downto 104);
						   key_signal(95 downto 88)<=avs_s0_writedata(103 downto 96);
							
							key_signal(63 downto 56)<=avs_s0_writedata(7 downto 0);
		               key_signal(55 downto 48)<=avs_s0_writedata(15 downto 8);
						   key_signal(47 downto 40)<=avs_s0_writedata(23 downto 16);
						   key_signal(39 downto 32)<=avs_s0_writedata(31 downto 24);
							
							key_signal(7 downto 0)<=avs_s0_writedata(63 downto 56);
		               key_signal(15 downto 8)<=avs_s0_writedata(55 downto 48);
						   key_signal(23 downto 16)<=avs_s0_writedata(47 downto 40);
						   key_signal(31 downto 24)<=avs_s0_writedata(39 downto 32);
							
		               load_internal<='1';
							
        when "01" => data_in_signal(127 downto 120)<=avs_s0_writedata(71 downto 64);
		               data_in_signal(119 downto 112)<=avs_s0_writedata(79 downto 72);
						   data_in_signal(111 downto 104)<=avs_s0_writedata(87 downto 80);
						   data_in_signal(103 downto 96)<=avs_s0_writedata(95 downto 88);
							
							data_in_signal(71 downto 64)<=avs_s0_writedata(127 downto 120);
		               data_in_signal(79 downto 72)<=avs_s0_writedata(119 downto 112);
						   data_in_signal(87 downto 80)<=avs_s0_writedata(111 downto 104);
						   data_in_signal(95 downto 88)<=avs_s0_writedata(103 downto 96);
							
							data_in_signal(63 downto 56)<=avs_s0_writedata(7 downto 0);
		               data_in_signal(55 downto 48)<=avs_s0_writedata(15 downto 8);
						   data_in_signal(47 downto 40)<=avs_s0_writedata(23 downto 16);
						   data_in_signal(39 downto 32)<=avs_s0_writedata(31 downto 24);
							
							data_in_signal(7 downto 0)<=avs_s0_writedata(63 downto 56);
		               data_in_signal(15 downto 8)<=avs_s0_writedata(55 downto 48);
						   data_in_signal(23 downto 16)<=avs_s0_writedata(47 downto 40);
						   data_in_signal(31 downto 24)<=avs_s0_writedata(39 downto 32);
							
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


         

  
  
  









