x=[1 2 2 3 3 3 4 5];
y = zeros(size(x));
for i = 1:length(x)
  y(i) = sum(x==x(i));
end
for i=length(y):-1:1
  if(y(i)>=2)
    x(i)=[];
   end
 end
 disp(x);