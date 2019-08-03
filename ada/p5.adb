with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Command_Line; use Ada.Command_Line;

procedure P5 is
  package Value_Functions is new Ada.Numerics.Generic_Elementary_Functions (
  Standard.Float);
  use Value_Functions;
  k:Integer := 20;
  multiple:Integer := 1;
  i:Integer := 0;
  check:Boolean := true;
  p: array (0 .. 49) of Integer := (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229 );
  a:Integer := 1;
  limit:Integer := 0;
begin
  if Argument_Count >= 1 then
    k := Integer'Value(Argument(1));
  end if;
  limit := Integer(Sqrt(Float(k)));
  while p(i) <= k loop
    a := 1;
    if check then
      if p(i) <= limit then
        a := Integer(Float'Floor(Log(Float(k)) / Log(Float(p(i)))));
      else
        check := false;
      end if;
    end if;
    multiple := multiple * (p(i) ** a);
    i := i + 1;
  end loop;
  Put_Line(Integer'Image(multiple));
end P5;
