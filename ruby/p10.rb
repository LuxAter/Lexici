#!/usr/bin/ruby -w

limit = 2000000
if ARGV.length > 0 then
  limit = ARGV[0].to_i
end
cross_limit = Math.sqrt(limit).floor
sieve = Array.new(limit, false)
for n in (4..limit).step(2) do
  sieve[n] = true
end
for n in (3..cross_limit).step(2) do
  if !sieve[n] then
    for m in (n*n..limit).step(2*n) do
      sieve[m] = true
    end
  end
end
sum = 0
for n in (2..limit) do
  if !sieve[n] then
    sum += n
  end
end
puts sum;
