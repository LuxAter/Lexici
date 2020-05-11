with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Command_Line; use Ada.Command_Line;

procedure P3 is
  package Value_Functions is new Ada.Numerics.Generic_Elementary_Functions (
  Standard.Float);
  use Value_Functions;
  n: Long_Integer := 600851475143;
  last_factor: Long_Integer := 1;
  factor: Long_Integer := 3;
  max_factor: Long_Integer;
begin
  if Argument_Count >= 1 then
    n := Long_Integer'Value(Argument(1));
  end if;
  if n mod 2 = 0 then
    last_factor := 2;
    n := n / 2;
    while n mod 2 = 0 loop
      n := n / 2;
    end loop;
  end if;
  max_factor := Long_Integer(Sqrt(Float(n)));
  while n > 1 and factor <= max_factor loop
    if n mod factor = 0 then
      n := n / factor;
      last_factor := factor;
      while n mod factor = 0 loop
        n := n / factor;
      end loop;
      max_factor := Long_Integer(Sqrt(Float(n)));
    end if;
    factor := factor + 2;
  end loop;
  if n /= 1 then
    last_factor := n;
  end if;
  Put_Line(Long_Integer'Image(last_factor));
end P3;
