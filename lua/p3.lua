n = 600851475143;
last_factor = 1;
if n % 2 == 0 then
  last_factor = 2
  n = n / 2
  while n % 2 == 0 do
    n = n / 2
  end
end
factor = 3
max_factor = math.sqrt(n)
while n > 1 and factor <= max_factor do
  if n % factor == 0 then
    n = n / factor;
    last_factor = factor;
    while n % factor == 0 do
      n = n / factor;
    end
    max_factor = math.sqrt(n);
  end
  factor = factor + 2;
end
if not n == 1 then
  last_factor = n;
end
print(last_factor)
