limit = 4000000
sum = 0
b = 1
c = 2
while c < limit do
  sum = sum + c
  a = b + c
  b = c + a
  c = a + b
end
print(sum)
