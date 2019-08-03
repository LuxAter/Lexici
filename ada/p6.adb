with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Command_Line; use Ada.Command_Line;

procedure P6 is
  limit:Integer := 100;
  sum:Integer := 0;
  sum_sq:Integer := 0;
  diff:Integer := 0;
begin
  if Argument_Count >= 1 then
    limit := Integer'Value(Argument(1));
  end if;
  sum := limit * (limit + 1) / 2;
  sum_sq := (2 * limit + 1) * (limit + 1) * limit / 6;
  diff := (sum ** 2) - sum_sq;
  Put_Line(Integer'Image(diff));
end P6;
