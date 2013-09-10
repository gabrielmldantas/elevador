library ieee;
use ieee.std_logic_1164.all;
use work.util.all;

entity elevador is
port(call: in andar;
	  n_andar: in andar;
	  clk, reset: in std_logic;
	  andar_atual: out andar;
	  y : out integer);
end elevador;	  

architecture arch of elevador is
signal pr_andar, next_andar, pr_call, pr_n_andar: andar;
begin
process (clk, reset)
begin
	if reset = '1' then
		pr_andar <= andar0;
	elsif (clk'event and clk = '1') then
		pr_andar <= next_andar;
	end if;
end process;

process (call, n_andar, pr_andar)
begin
	case pr_andar is
		when andar0 => 
			andar_atual <= andar0;
			if n_andar /= andar0 then
				next_andar <= n_andar;
				pr_call <= call;
				y <= 1;
			elsif call /= andar0 then
				next_andar <= call;
				pr_n_andar <= n_andar;
				y <= 2;
			else
				next_andar <= andar0;
				y <= 3;
			end if;
		when andar1 => 
			andar_atual <= andar1;
			if n_andar /= andar1 then
				next_andar <= n_andar;
				pr_call <= call;
			elsif call /= andar1 then
				next_andar <= call;
				pr_n_andar <= n_andar;
			else
				next_andar <= andar1;
			end if;
		when andar2 => 
			andar_atual <= andar2;
			if n_andar /= andar2 then
				next_andar <= n_andar;
				pr_call <= call;
			elsif call /= andar2 then
				next_andar <= call;
				pr_n_andar <= n_andar;
			else
				next_andar <= andar2;
			end if;
		when andar3 => 
			andar_atual <= andar3;
			if n_andar /= andar3 then
				next_andar <= n_andar;
				pr_call <= call;
			elsif call /= andar3 then
				next_andar <= call;
				pr_n_andar <= n_andar;
			else
				next_andar <= andar3;
			end if;
		when andar4 => 
			andar_atual <= andar4;
			if n_andar /= andar4 then
				next_andar <= n_andar;
				pr_call <= call;
			elsif call /= andar4 then
				next_andar <= call;
				pr_n_andar <= n_andar;
			else
				next_andar <= andar4;
			end if;
		when andar5 => 
			andar_atual <= andar5;
			if n_andar /= andar5 then
				next_andar <= n_andar;
				pr_call <= call;
			elsif call /= andar5 then
				next_andar <= call;
				pr_n_andar <= n_andar;
			else
				next_andar <= andar5;
			end if;
		when andar6 => 
			andar_atual <= andar6;
			if n_andar /= andar6 then
				next_andar <= n_andar;
				pr_call <= call;
			elsif call /= andar6 then
				next_andar <= call;
				pr_n_andar <= n_andar;
			else
				next_andar <= andar6;
			end if;
		end case;
end process;

end arch;