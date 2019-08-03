with Ada.Containers.Hashed_Maps;  use Ada.Containers;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Strings.Hash;

procedure P14 is
  function Equivalent_Key (Left, Right : Long_Integer) return Boolean is
  begin
    return Left = Right;
  end Equivalent_Key;

  function Hash_Func(Key : Long_Integer) return Ada.Containers.Hash_Type is
  begin
    return Ada.Strings.Hash(Long_Integer'Image(key));
  end Hash_Func;

  package Hash is new Ada.Containers.Hashed_Maps (
    Key_Type => Long_Integer,
    Element_Type => Long_Integer,
    Hash => Hash_Func,
    Equivalent_Keys => Equivalent_Key
  );

  values : Hash.Map;
  maximum : Long_Integer := 1000000;
  longest : Long_Integer := 0;
  num : Long_Integer := 0;
  chain_length :Long_Integer := 0;

  function Count_Chain(n : Long_Integer) return Long_Integer is
    tmp : Long_Integer := 0;
  begin
    if Hash.Contains(values, n) then
      return Hash.Element(values, n);
    end if;
    if (n mod 2) = 0 then
      tmp := 1 + Count_Chain(n / 2);
      values.Insert(Key => n, New_Item => tmp);
    else
      tmp := 2 + Count_Chain((3 * n + 1) / 2);
      values.Insert(Key => n, New_Item => tmp);
    end if;
    return tmp;
  end Count_Chain;

begin
  if Argument_Count >= 1 then
    maximum := Long_Integer'Value(Argument(1));
  end if;
  values.Insert(Key => 1, New_Item => 1);
  for i in 2..maximum loop
    chain_length := Count_Chain(i);
    if chain_length > longest then
      longest := chain_length;
      num := i;
    end if;
  end loop;
  Put_Line(Long_Integer'Image(num));
end P14;
