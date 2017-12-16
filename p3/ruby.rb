#!/usr/bin/ruby -w

n = 600851475143
max = n
if ARGV.length >= 1 then
    n = ARGV[0].to_i
    max = n
end

last_factor = 1
if n % 2 == 0 then
    last_factor = 2
    n = n / 2
    while n % 2 == 0 do
        n = n / 2
    end
end

factor = 3
max_factor = Math.sqrt(n)
while n > 1 && factor <= max_factor do
    if n % factor == 0 then
        last_factor = factor
        n = n / factor
        while n % factor == 0 do
            n = n / factor
        end
        max_factor = Math.sqrt(n)
    end
    factor = factor + 2
end

if n != 1 then
    last_factor = n
end

puts "The greatest prime factor of " + max.to_s + ": " + last_factor.to_s;
