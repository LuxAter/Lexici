with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Command_Line; use Ada.Command_Line;

procedure P7 is
  package Value_Functions is new Ada.Numerics.Generic_Elementary_Functions (
  Standard.Float);
  use Value_Functions;
  function IsPrime(n:Integer) return Boolean is
    r:Integer := 0;
    f:Integer := 5;
  begin
    if n = 1 then
      return false;
    elsif n < 4 then
      return true;
    elsif (n mod 2) = 0 then
      return false;
    elsif n < 9 then
      return true;
    elsif (n mod 3) = 0 then
      return false;
    else
      r := Integer(Float'Floor(Sqrt(Float(n))));
      while f <= r loop
        if (n mod f) = 0 then
          return false;
        elsif (n mod (f + 2)) = 0 then
          return false;
        end if;
        f := f + 6;
      end loop;
    end if;
    return true;
  end IsPrime;
  limit:Integer := 10001;
  count:Integer := 1;
  val:Integer := 1;
begin
  if Argument_Count >= 1 then
    limit := Integer'Value(Argument(1));
  end if;
  while count < limit loop
    val := val + 2;
    if IsPrime(val) then
      count := count + 1;
    end if;
  end loop;
  Put_Line(Integer'Image(val));
end P7;
