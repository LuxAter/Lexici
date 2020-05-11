#!/usr/bin/lua

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

k = 20
if(TableLength(arg) > 2) then
  k = arg[1]
end
multiple = 1
i = 1
check = true
limit = math.sqrt(k)
a = {}
p = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229 }

while (p[i] <= k) do
  a[i] = 1
  if(check) then
    if (p[i] <= limit) then
      a[i] = math.floor(math.log(k) / math.log(p[i]))
    else
      check = false
    end
  end
  multiple = multiple * math.pow(p[i], a[i])
  i = i + 1
end
print(multiple)
