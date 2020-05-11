with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure P2 is
  limit: Integer := 4000000;
  sum: Integer := 0;
  a: Integer := 1;
  b: Integer := 1;
  c: Integer := 2;
begin
  if Argument_Count >= 1 then
    limit := Integer'Value(Argument(1));
  end if;
  while c < limit loop
    sum := sum + c;
    a := b + c; 
    b := c + a;
    c := a + b;
  end loop;
  Put_Line(Integer'Image(sum));
end P2;
