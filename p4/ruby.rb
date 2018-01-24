#!/usr/bin/ruby -w

def ReverseInteger(val)
    reversed = 0
    while val > 0 do
        reversed = (10 * reversed) + (val % 10);
        val = val / 10
    end
    return reversed
end

def IsPalindrome(n)
    return n == ReverseInteger(n)
end

count = 3
if ARGV.length >= 1 then
    count = ARGV[0].to_i
end
tmp = count
max = 0
while tmp > 0 do
    max = (max * 10) + 9
    tmp -= 1
end
a = max
largest = 0
while a >= (10 * count) do
    b = 0
    db = 0
    if a % 11 == 0 then
        b = max
        db = 1
    else
        b = 11 * (max / 11)
        db = 11
    end
    while b >= a do
        if a * b <= largest then
            break
        elsif IsPalindrome(a * b) then
            largest = a * b
        end
        b -= db
    end
    a -= 1
end
puts "Largest palindrome multiples of " + count.to_s + " digits: " + largest.to_s;
