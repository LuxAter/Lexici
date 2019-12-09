function sum_divisible(n, max)
  p = max // n
  return n * (p * (p + 1)) // 2
end

max = 999
sum = sum_divisible(3, max) + sum_divisible(5, max) - sum_divisible(15, max)
print(sum)
