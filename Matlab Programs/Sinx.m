 clear
 clc
 n = input('Enter number of iiterations (n): ' );
 x = pi/3;
 y = zeros(1,n);
 for i = 0:n
   y(i+1) = (-1)^i*x^(2*i+1)/factorial(2*i+1); 
 end
 SINx = sum(y);
 disp(SINx);