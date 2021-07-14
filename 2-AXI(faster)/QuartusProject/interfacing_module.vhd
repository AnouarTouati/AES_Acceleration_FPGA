library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity interfacing_module is port (
      clk       :    in std_logic;
	   read_data_bus :  in std_logic_vector(127 downto 0);
      write_data_bus : out std_logic_vector(127 downto 0);
      addr_data_bus :  out std_logic_vector(5 downto 0);
      write_signal :   out std_logic;
		byteenable :     out std_logic_vector(15 downto 0);
		ackn_signal : in std_logic;
		read_signal : out std_logic;
		
      reset_aes     : out std_logic;
      start_aes     : out std_logic;
      mode_aes      : out std_logic; 
      load_aes      : out std_logic; 
      key_aes       : out std_logic_vector(127 downto 0);
      data_in_aes   : out std_logic_vector(127 downto 0);
      data_out_aes  : in std_logic_vector(127 downto 0);
      done_aes      : in std_logic

     );
end entity;

architecture arch of interfacing_module is 

type state_type is (A,B,c,D,E,F,G,H,I,J,K,L,M,N); 
signal state : state_type :=A;
	
signal  reset_aes_inter     : std_logic;
signal  start_aes_inter     : std_logic;
signal  mode_aes_inter      : std_logic; 
signal  load_aes_inter      : std_logic; 
signal  key_aes_inter       : std_logic_vector(127 downto 0);
signal  data_in_aes_inter   : std_logic_vector(127 downto 0);
signal  data_out_aes_inter  : std_logic_vector(127 downto 0);
signal  done_aes_inter      : std_logic;



begin
  process(clk) 
    begin
	 
		if clk'event and clk='1' then
			case state is 
						when A =>   reset_aes_inter <='1';
								      addr_data_bus<="110000";
						    		   write_signal<='0';
									   read_signal<='1';
										load_aes_inter<='0';
								      state <= B;

						when B =>   if ackn_signal='1' then
										if read_data_bus(0) = '1' then  --means data and key_aes has been placed in memory addr_data_bus 00 and 01 respectively
											reset_aes_inter <='0'; 
											mode_aes_inter <= read_data_bus(1);
											read_signal<='0';
										   load_aes_inter<='0';
											state <= C;
											else state <= A;
										 end if;
									  else state<=B;
									end if;

						when C =>   if ackn_signal='0' then
						           addr_data_bus<="000000";
							     	  write_signal<='0';
									  read_signal<='1';
								     state <= D;
                              else state<=C;
										end if;
										
						when D =>  if ackn_signal='1' then
						          data_in_aes_inter <= read_data_bus;
									 read_signal<='0';
									load_aes_inter<='0';
								    state <= E;
									else state<=D;
								 end if;	

						when E =>  if ackn_signal='0' then
					            	addr_data_bus<="010000";
							       	write_signal<='0';
										read_signal<='1';
								      state <= F;
										else state<=E;
										end if;

						when F =>  if ackn_signal='1' then
						         key_aes_inter <= read_data_bus;
									write_signal<='0';
									read_signal<='0';
								   state <= G; 	
									else state<=F;
									end if;
									 
						when G =>  if ackn_signal='0' then
						          load_aes_inter<='1';
							    	 state <= H;
									 else state<=G;
									 end if;
									 
						when H => load_aes_inter<='0';
			                   state <=I;
									 
						when I => start_aes_inter <='1';
			                   state <=J;
									 
						when J => start_aes_inter <='0';
			                   state <=k;			 
									 
						when K => if done_aes = '1' then
											addr_data_bus<="100000";
											write_signal<='1';
											read_signal<='0';
											write_data_bus<= data_out_aes;
											state <= L;
								      else state <=K;
                              end if;
						when L =>if ackn_signal='1' then
							         write_signal<='0';
									   read_signal <='0';
										state <=M;
									else state<=L;
								end if;
								
				    	when M => if ackn_signal='0' then
							    	write_signal<='1';
									read_signal <='0';
							     	addr_data_bus<="110000";
							     	write_data_bus<= X"00000000000000000000000000000004";--third bit is the done_aes signal to hps this also clears ready and mode_aes signals
							     	state <= N;
									else state<=M;
									end if;

				     	when N => if ackn_signal='1' then  
						          write_signal<='0';
									 read_signal<='0';
								    state <= A;
									 else state<=N;
									 end if;

					end case;				 		    				   	   
  end if;      	
  end process;		
byteenable   <="1111111111111111";

reset_aes <= reset_aes_inter;   
start_aes <=start_aes_inter;    
mode_aes <=mode_aes_inter;     
load_aes <=load_aes_inter;   
  
key_aes <=key_aes_inter;      
data_in_aes <=data_in_aes_inter;
  
data_out_aes_inter <=data_out_aes;
done_aes_inter     <=done_aes;
end architecture arch;
 