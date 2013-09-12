library ieee;
use ieee.std_logic_1164.all;
use work.util.all;

entity elevador is
port(
	clk, reset, button_call, button_andar : in std_logic;
	call_andar, c_andar: in andar;
	andar_out : out andar;
	down, up : out std_logic
);
end elevador;	  

architecture arch of elevador is
signal pr_andar, nx_andar : andar;
signal pr_up, pr_down, nx_down, nx_up : std_logic;
begin
process (clk, reset)
begin
	if reset = '1' then
		pr_andar <= andar0;
		pr_up <= '1';
		pr_down <= '0';
	elsif (clk'event and clk = '1') then
		pr_andar <= nx_andar;
		pr_up <= nx_up;
		pr_down <= nx_down;
	end if;
end process;

process (pr_andar)
begin
	case pr_andar is
		when andar0 =>
			andar_out <= andar0;
			nx_up <= '1';
			nx_down <= '0';
			down <= nx_down;
			up <= nx_up;
			if button_andar = '1' then
				nx_andar <= c_andar;
			elsif button_call = '1' then
				nx_andar <= call_andar;
			else
				nx_andar <= andar1;
			end if;
		when andar1 =>
			andar_out <= andar1;
			nx_up <= pr_up;
			nx_down <= pr_down;
			down <= nx_down;
			up <= nx_up;
			if button_andar = '1' then
				if c_andar > andar1 and pr_up = '1' then
					nx_andar <= c_andar;
				elsif c_andar < andar1 and pr_down = '1' then
					nx_andar <= c_andar;
				elsif pr_up = '1' then
					nx_andar <= andar2;
				elsif pr_down = '1' then
					nx_andar <= andar0;
				end if;
			elsif button_call = '1' then
				if call_andar > andar1 and pr_up = '1' then
					nx_andar <= call_andar;
				elsif call_andar < andar1 and pr_down = '1' then
					nx_andar <= call_andar;
				elsif pr_up = '1' then
					nx_andar <= andar2;
				elsif pr_down = '1' then
					nx_andar <= andar0;
				end if;
			else
				if pr_up = '1' then
					nx_andar <= andar2;
				elsif pr_down = '1' then
					nx_andar <= andar0;
				end if;
			end if;
		when andar2 =>
			andar_out <= andar2;
			nx_up <= pr_up;
			nx_down <= pr_down;
			down <= nx_down;
			up <= nx_up;
			if button_andar = '1' then
				if c_andar > andar2 and pr_up = '1' then
					nx_andar <= c_andar;
				elsif c_andar < andar2 and pr_down = '1' then
					nx_andar <= c_andar;
				elsif pr_up = '1' then
					nx_andar <= andar3;
				elsif pr_down = '1' then
					nx_andar <= andar1;
				end if;
			elsif button_call = '1' then
				if call_andar > andar2 and pr_up = '1' then
					nx_andar <= call_andar;
				elsif call_andar < andar2 and pr_down = '1' then
					nx_andar <= call_andar;
				elsif pr_up = '1' then
					nx_andar <= andar3;
				elsif pr_down = '1' then
					nx_andar <= andar1;
				end if;
			else
				if pr_up = '1' then
					nx_andar <= andar3;
				elsif pr_down = '1' then
					nx_andar <= andar1;
				end if;
			end if;
		when andar3 =>
			andar_out <= andar3;
			nx_up <= pr_up;
			nx_down <= pr_down;
			down <= nx_down;
			up <= nx_up;
			if button_andar = '1' then
				if c_andar > andar3 and pr_up = '1' then
					nx_andar <= c_andar;
				elsif c_andar < andar3 and pr_down = '1' then
					nx_andar <= c_andar;
				elsif pr_up = '1' then
					nx_andar <= andar4;
				elsif pr_down = '1' then
					nx_andar <= andar2;
				end if;
			elsif button_call = '1' then
				if call_andar > andar3 and pr_up = '1' then
					nx_andar <= call_andar;
				elsif call_andar < andar3 and pr_down = '1' then
					nx_andar <= call_andar;
				elsif pr_up = '1' then
					nx_andar <= andar4;
				elsif pr_down = '1' then
					nx_andar <= andar2;
				end if;
			else
				if pr_up = '1' then
					nx_andar <= andar4;
				elsif pr_down = '1' then
					nx_andar <= andar2;
				end if;
			end if;
		when andar4 =>
			andar_out <= andar4;
			nx_up <= pr_up;
			nx_down <= pr_down;
			down <= nx_down;
			up <= nx_up;
			if button_andar = '1' then
				if c_andar > andar4 and pr_up = '1' then
					nx_andar <= c_andar;
				elsif c_andar < andar4 and pr_down = '1' then
					nx_andar <= c_andar;
				elsif pr_up = '1' then
					nx_andar <= andar5;
				elsif pr_down = '1' then
					nx_andar <= andar3;
				end if;
			elsif button_call = '1' then
				if call_andar > andar4 and pr_up = '1' then
					nx_andar <= call_andar;
				elsif call_andar < andar4 and pr_down = '1' then
					nx_andar <= call_andar;
				elsif pr_up = '1' then
					nx_andar <= andar5;
				elsif pr_down = '1' then
					nx_andar <= andar3;
				end if;
			else
				if pr_up = '1' then
					nx_andar <= andar5;
				elsif pr_down = '1' then
					nx_andar <= andar3;
				end if;
			end if;
		when andar5 =>
			andar_out <= andar5;
			nx_up <= pr_up;
			nx_down <= pr_down;
			down <= nx_down;
			up <= nx_up;
			if button_andar = '1' then
				if c_andar > andar5 and pr_up = '1' then
					nx_andar <= c_andar;
				elsif c_andar < andar5 and pr_down = '1' then
					nx_andar <= c_andar;
				elsif pr_up = '1' then
					nx_andar <= andar6;
				elsif pr_down = '1' then
					nx_andar <= andar4;
				end if;
			elsif button_call = '1' then
				if call_andar > andar5 and pr_up = '1' then
					nx_andar <= call_andar;
				elsif call_andar < andar5 and pr_down = '1' then
					nx_andar <= call_andar;
				elsif pr_up = '1' then
					nx_andar <= andar6;
				elsif pr_down = '1' then
					nx_andar <= andar4;
				end if;
			else
				if pr_up = '1' then
					nx_andar <= andar6;
				elsif pr_down = '1' then
					nx_andar <= andar4;
				end if;
			end if;
		when andar6 =>
			andar_out <= andar6;
			nx_up <= '0';
			nx_down <= '1';
			down <= nx_down;
			up <= nx_up;
			if button_andar = '1' then
				nx_andar <= c_andar;
			elsif button_call = '1' then
				nx_andar <= call_andar;
			else
				nx_andar <= andar5;
			end if;
		end case;
end process;

end arch;