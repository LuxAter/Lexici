#!/usr/bin/lua

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

limit = 4000000
sum = 0
a = 1
b = 1
c = 2

if(TableLength(arg) > 2) then
  limit = arg[1]
end

while(c < limit) do
  sum = sum + c
  a = b + c
  b = c + a
  c = a + b
end

print(string.format("Sum of even fibonacci numbers less then %i: %i", limit, sum))
