with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure P4 is
  function ReverseInteger( n:Integer ) return Integer is
    reversed:Integer := 0;
    val:Integer := n;
  begin
    while val > 0 loop
      reversed := (10 * reversed) + (val mod 10);
      val := val / 10;
    end loop;
    return reversed;
  end ReverseInteger;
  function IsPalindrome ( n:Integer ) return Boolean is
  begin
    return n = ReverseInteger(n);
  end IsPalindrome;
  a:Integer := 999;
  b:Integer := 0;
  db:Integer := 0;
  max:Integer := 999;
  count:Integer := 3;
  largest:Integer := 0;
  tmp:Integer := 0;
begin
  if Argument_Count >= 1 then
    count := Integer'Value(Argument(1));
    tmp := count;
    max := 0;
    while count > 0 loop
      max := (max * 10) + 9;
      count := count - 1;
    end loop;
    count := tmp;
    a := max;
  end if;
  while a >= 10 * count loop
    if a mod 11 = 0 then
      b := max;
      db := 1;
    else
      b := 11 * (max / 11);
      db := 11;
    end if;
    while b >= a loop
      if a * b <= largest then
        exit;
      end if;
      if IsPalindrome( a * b ) = True then
        largest := a * b;
      end if;
      b := b - db;
    end loop;
    a := a - 1;
  end loop;
  Put_Line(Integer'Image(largest));
end P4;
