n=[1,1,0,1,0,1,1,1,0,0,0];
promt=('enter the value: ');
x=input(promt);
for i=1:length(n)
  if n(i)==1
    nn(i)=-x;
 else
    nn(i)=x;
  end
end

i=1;
t=0:0.001:length(n);

for j=1:length(t)
  if t(j)<=i
    y(j)=nn(i);
  else
    y(j)=nn(i);
    i=i+1;
  end
end
plot(t,y,'r');
axis([0 length(n) -5 5]);

i=1;
for j=1:length(t)
    if t(j)>i
        if y(j)==-x
            ans(i)=1
            i=i+1;
        else
            ans(i) = 0
            i=i+1;
        end
    end
end
            
