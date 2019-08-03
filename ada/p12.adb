with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure P12 is
  type myArray is array (Integer range <>) of Integer;
  req_count :Integer := 500;
  n: Integer:= 3;
  n1: Integer:= 3;
  dn: Integer:= 2;
  dn1: Integer:= 2;
  cnt: Integer:= 0;
  p : Integer := 1;
  exponent: Integer:= 0;
  is_prime: boolean;
begin
  if Argument_Count >= 1 then
    req_count := Integer'Value(Argument(1));
  end if;
  declare
    primes: myArray(1..(req_count * 2));
  begin
    primes(1) := 2;
    for i in 3..(req_count*2) loop
      is_prime := True;
      for j in 1..p loop
        if (i mod primes(j)) = 0 then
          is_prime := False;
        end if;
        exit when is_prime = False;
      end loop;
      if is_prime then
        p := p + 1;
        primes(p) := i;
      end if;
    end loop;

    while cnt <= req_count loop
      n := n + 1;
      n1 := n;
      if (n1 mod 2) = 0 then
        n1 := n1 / 2;
      end if;
      dn1 := 1;
      is_prime := False;
      for i in 1..p loop
        if (primes(i) * primes(i)) > n1 then
          dn1 := dn1 * 2;
          is_prime := True;
        end if;
        exit when is_prime;
        exponent := 1;
        while (n1 mod primes(i)) = 0 loop
          exponent := exponent + 1;
          n1 := n1 / primes(i);
        end loop;
        if exponent > 1 then
          dn1 := dn1 * exponent;
        end if;
        if n1 = 1 then
          is_prime := True;
        end if;
        exit when is_prime;
      end loop;
      cnt := dn * dn1;
      dn := dn1;
    end loop;
  end;

  Put_Line(Integer'Image(n * (n - 1) / 2));
end P12;

