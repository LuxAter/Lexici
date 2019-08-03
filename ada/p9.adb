with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Command_Line; use Ada.Command_Line;

procedure P9 is
  sum:Integer := 1000;
  prod:Integer := 0;
  c:Integer := 0;
begin
  if Argument_Count >= 1 then
    sum := Integer'Value(Argument(1));
  end if;
  for a in 3 .. ((sum - 3) / 3) loop
    for b in (a + 1) .. ((sum - 1 -a) / 2) loop
      c := sum - a - b;
      if (c * c) = ((a*a)+(b*b)) then
        prod := a*b*c;
      end if;
    end loop;
  end loop;
  Put_Line(prod'Image);
end P9;
