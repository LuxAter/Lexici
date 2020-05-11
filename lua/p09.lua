#!/usr/bin/lua

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

sum = 1000
if(TableLength(arg) > 2) then
  sum = arg[1]
end

prod = 0

for a=3,(sum-3)/3 do
  for b=(a+1),(sum-1-a)/2 do
    local c = sum-a-b
    if (c*c == a*a+b*b) then
      prod = a*b*c
    end
  end
end
print(prod)
