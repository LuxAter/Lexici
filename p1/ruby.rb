#!/usr/bin/ruby -w

def SumDivisible(n, max)
  p = max / n
  return n * (p * (p + 1)) / 2
end

max = 999
if ARGV.length >= 1 then
  max = ARGV[0].to_i - 1
end
sum = SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max)
puts "Sum of the multiples of 3 & 5 less than " + (max + 1).to_s + ": " + sum.to_s;
