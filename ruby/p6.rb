#!/usr/bin/ruby -w

limit = 100
if ARGV.length > 0 then
  limit = ARGV[0].to_i
end

sum = limit * (limit + 1) / 2
sum_sq = (2 * limit + 1) * (limit + 1) * limit / 6
diff = (sum ** 2) - sum_sq
puts diff;
