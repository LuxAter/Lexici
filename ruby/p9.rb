#!/usr/bin/ruby -w

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
