#!/usr/bin/ruby -w


k = 20
if ARGV.length > 0 then
  k = ARGV[0].to_i
end
multiple = 1
i = 0
check = true
limit = Math.sqrt(k)
a = Array.new(50)
p = Array[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229]
while p[i] <= k do
  a[i] = 1
  if check then
    if p[i] <= limit then
      a[i] = (Math.log(k) / Math.log(p[i])).floor
    else
      check = false
    end
  end
  multiple *= (p[i] ** a[i])
  i += 1
end

puts multiple.to_s;
