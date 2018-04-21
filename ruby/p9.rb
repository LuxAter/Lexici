#!/usr/bin/ruby -w

def gcd(a, b)
  if a == 0 || b == 0 then
    return 0
  elsif a == b then
    return a
  elsif a > b then
    return gcd(a - b, b)
  else
    return gcd(a, b - a)
  end
end

sum = 1000
if ARGV.length > 0 then
  sum = ARGV[0].to_i
end

prod = 0
for a in (3..(sum-3)/3) do
  for b in (a+2..(sum-1-a)/2) do
    c = sum-a-b
    if c*c == a*a+b*b then
      prod = a*b*c
    end
  end
end
puts prod;
