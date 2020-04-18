x = input ('Enter a number: ')
p=1;

for n = 2:sqrt(x)
   if x~=n && mod (x, n) == 0
    p=0;
    break
   end
end

if p == 0
    printf ('%d is NOT a prime number %d\n', x)
else
    printf ('%d is a prime number\n', x)
end