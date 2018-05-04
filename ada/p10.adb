with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Command_Line; use Ada.Command_Line;

procedure P10 is
  type Int64 is range -(2**63) .. +(2**63 - 1);
  package Value_Functions is new Ada.Numerics.Generic_Elementary_Functions (
  Standard.Float);
  use Value_Functions;
  limit:Int64 := 2000000;
  cross_limit:Int64 := 0;
  sieve:array (0 .. 2000000) of Boolean := (0 .. 2000000 => false);
  sum:Int64 := 0;
  n:Integer := 0;
begin
  for i in 2 .. (Integer(limit) / 2) loop
    n := i * 2;
    sieve(n) := true;
  end loop;
  cross_limit := Int64(Float'Floor(Sqrt(Float(limit))));
  for i in 0 .. Integer((cross_limit - 3) / 2) loop
    n := (i * 2) + 3;
    if sieve(n) = false then
      for m in 0 .. Integer((limit - Int64(n*n)) / Int64(2*n)) loop
        sieve((m * 2*n) + (n*n)) := true;
      end loop;
    end if;
  end loop;
  for n in 2 .. Integer(limit) loop
    if sieve(n) = false then
      sum := sum + Int64(n);
    end if;
  end loop;
  Put_Line(Int64'Image(sum));
end P10;
