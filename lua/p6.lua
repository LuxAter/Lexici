#!/usr/bin/lua

function TableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

limit = 100
if (TableLength(arg) > 2) then
  limit = arg[1]
end
sum = limit * (limit + 1) / 2
sum_sq = (2 * limit + 1) * (limit + 1) * limit /6
diff = math.pow(sum, 2) - sum_sq
print(diff)
