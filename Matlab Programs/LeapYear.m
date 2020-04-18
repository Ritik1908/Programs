Y=input('Enter the year : ');
if mod(Y, 400) == 0
  disp("Leap Year");
elseif (mod(Y,100)==0) && (mod(Y, 4)~=0)
  disp("Not a Leap Year");
elseif (mod(Y,100)~=0) && (mod(Y, 4)==0)
  disp("Leap Year");
 else
  disp("Not a Leap Year");
 end;