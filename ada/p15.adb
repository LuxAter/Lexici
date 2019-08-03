with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure P15 is
  size : Integer := 20;
  result : Long_Float := 1.0;
begin
  if Argument_Count >= 1 then
    size := Integer'Value(Argument(1));
  end if;
  for i in reverse (size + 1)..(size*2) loop
    result := result * (Long_Float(i) / Long_Float(i - size));
  end loop;
  Put_Line(Long_Integer'Image(Long_Integer(result)));
end P15;
