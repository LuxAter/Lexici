with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure P1 is
  function SumDivisible ( n:Integer; max:Integer ) return Integer is
    p: Integer := max / n;
    ret: Integer := n * (p * (p + 1)) / 2;
  begin
    return ret;
  end SumDivisible;
  max: Integer := 999;
  val: Integer := 0;
begin
  if Argument_Count >= 1 then
    max := Integer'Value(Argument(1)) - 1;
  end if;
  val := SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max);
  Put_Line("Sum of the multiples of 3 & 5 less than" & Integer'Image(max + 1) & ":" & Integer'Image(val));
end P1;
