with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;           use Ada.Integer_Text_IO;
with Ada.Command_Line;
with Ada.Numerics.Generic_Elementary_Functions;

procedure Prime is
  package Value_Functions is new Ada.Numerics.Generic_Elementary_Functions (
  Standard.Float);
  use Value_Functions;
  function IsPrime (p: Integer) return Boolean is
    r: Integer := Integer(Float'Floor(Sqrt(Float(p))));
    f: Integer := 5;
  begin
    if p = 1 then
      return False;
    elsif p < 4 then
      return True;
    elsif (p mod 2) = 0 then
      return False;
    elsif p < 9 then
      return True;
    elsif (p mod 3) = 0 then
      return False;
    else
      while f <= r loop
        if (p mod f) = 0 then
          return False;
        elsif (p mod (f + 2)) = 0 then
          return False;
        end if;
        f := f + 6;
      end loop;
    end if;
    return True;
  end IsPrime;
  limit: Integer := 10001;
  count: Integer := 1;
  val: Integer := 1;
begin
  if Ada.Command_Line.Argument_Count >= 1 then
    limit := Integer'Value(Ada.Command_Line.Argument(1));
  end if;
  while count < limit loop
    val := val + 2;
    if IsPrime (val) then
      count := count + 1;
    end if;
  end loop;
  Put_Line(Integer'Image(limit) & "'th Prime:" & Integer'Image(val));
end Prime;
