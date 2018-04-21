#!/usr/bin/ruby -w

limit = 4000000
sum = 0
a = 1
b = 1
c = 2
if ARGV.length >= 1 then
    limit = ARGV[0].to_i
end

while c < limit do
    sum += c
    a = b + c
    b = c + a
    c = a + b
end

puts sum.to_s;
