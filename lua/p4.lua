#!/usr/bin/lua

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function ReverseInteger(val)
  local reversed = 0
  while (val > 0) do
    reversed = (10 * reversed) + (val % 10)
    val = math.floor(val / 10)
  end
  return reversed
end

function IsPalindrome(n)
  return n == ReverseInteger(n)
end

count = 3
if (TableLength(arg) > 2) then
  count = arg[1]
end
tmp = count
max = 0
while (tmp > 0) do
  max = (max * 10) + 9
  tmp = tmp - 1
end
a = max
largest = 0
while (a >= (10 * count)) do
  b = 0
  db = 0
  if (a % 11 == 0) then
    b = max
    db = 1
  else
    b = 11 * (max / 11)
    db = 11
  end
  while (b >= a) do
    if ((a * b) <= largest) then
      break
    elseif (IsPalindrome(a * b))then
      largest = a * b
    end
    b = b - db
  end
  a = a - 1
end
print(string.format("Largest palindrome multiples of %i digits: %i", count, largest))
