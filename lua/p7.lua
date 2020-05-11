#!/usr/bin/lua

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function IsPrime(n)
  if (n == 1) then
    return false
  elseif (n < 4) then
    return true
  elseif (n % 2 == 0) then
    return false
  elseif (n < 9) then
    return true
  elseif (n % 3 == 0) then
    return false
  else
    r = math.floor(math.sqrt(n))
    f = 5
    while (f <= r) do
      if (n % f == 0) then
        return false
      elseif (n % (f + 2) == 0) then
        return false
      end
      f = f + 6
    end
  end
  return true
end

limit = 10001
if (TableLength(arg) > 2) then
  limit = arg[1]
end

count = 1
val = 1
while (count < limit) do
  val = val + 2
  if (IsPrime(val)) then
    count = count + 1
  end
end

print(val)
