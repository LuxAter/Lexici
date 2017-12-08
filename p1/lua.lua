#!/usr/bin/lua

function SumDivisible(n, max)
  local p = math.floor(max / n)
  return math.floor(n * (p * (p + 1)) / 2)
end

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

max = 999

if (TableLength(arg) > 2) then
  max = arg[1] - 1
end

sum = SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max)
print(string.format("Sum of the multiples of 3 & 5 less than %i: %i", max + 1, sum))
