#!/usr/bin/ruby -w

def is_prime(n)
  if n == 1 then
    return false
  elsif n < 4 then
    return true
  elsif n % 2 ==0 then
    return false
  elsif n < 9 then
    return true
  elsif n% 3 == 0 then
    return false
  else
    r = Math.sqrt(n).floor
    f = 5
    while f <= r do
      if n% f == 0 then
        return false
      elsif n % (f + 2) == 0 then
        return false
      end
      f += 6
    end
  end
  return true
end

limit = 10001
if ARGV.length > 0 then
  limit = ARGV[0].to_i
end

count  = 1
val = 1
while count < limit do
  val += 2
  if is_prime(val) then
    count += 1
  end
end

puts val;
