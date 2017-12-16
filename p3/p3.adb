with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Command_Line; use Ada.Command_Line;

procedure P3 is
  type Int64 is range -(2**63) .. +(2**63 - 1);
  package Value_Functions is new Ada.Numerics.Generic_Elementary_Functions (
  Standard.Float);
  use Value_Functions;
  n: Int64 := 600851475143;
  max: Int64 := n;
  last_factor: Int64 := 1;
  factor: Int64 := 3;
  max_factor: Int64;
begin
  if Argument_Count >= 1 then
    n := Int64'Value(Argument(1));
    max := n;
  end if;
  if n mod 2 = 0 then
    last_factor := 2;
    n := n / 2;
    while n mod 2 = 0 loop
      n := n / 2;
    end loop;
  end if;
  max_factor := Int64(Sqrt(Float(n)));
  while n > 1 and factor <= max_factor loop
    if n mod factor = 0 then
      n := n / factor;
      last_factor := factor;
      while n mod factor = 0 loop
        n := n / factor;
      end loop;
      max_factor := Int64(Sqrt(Float(n)));
    end if;
    factor := factor + 2;
  end loop;
  if n /= 1 then
    last_factor := n;
  end if;
  Put_Line("The greatest prime factor of" & Int64'Image(max) & ":" & Int64'Image(last_factor));
end P3;
