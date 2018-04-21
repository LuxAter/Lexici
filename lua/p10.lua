#!/usr/bin/lua

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

limit = 2000000
if(TableLength(arg) > 2) then
  limit = arg[1]
end
cross_limit = math.floor(math.sqrt(limit))
sieve = {}
for i=0,limit do sieve[i] = false end
for n=4,limit,2 do
  sieve[n] = true
end
for n=3,cross_limit,2 do
  if(not sieve[n]) then
    for m=n*n,limit,2*n do
      sieve[m]=true
    end
  end
end

sum = 0
for n=2,limit do
  if (not sieve[n]) then
    sum = sum + n
  end
end

print(sum)
