clear;
clc;

bits = [1 0 0 0 0 1];
bitrate = 1;
T = length(bits)/bitrate;
n = 1000;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
previous = -1;
for i = 0:length(bits)-1
    if(bits(i+1)) == 1
        if previous == 1
            x(i*n+1:(i+1)*n) = -1;
            previous = -1;
        else if (previous == -1)
            x(i*n+1:(i+1)*n) = 1;
            previous = 1;
            end
        end
    else
        x(i*n+1:(i+1)*n) =0;
    end
end
count=0;
one=0;
previous = -1;
for i = 0:length(bits)-1
    
    if(bits(i+1)) == 1
        one=one+1;
        if previous == 1
            x(i*n+1:(i+1)*n) = -1;
            previous = -1;
        else if (previous == -1)
            x(i*n+1:(i+1)*n) = 1;
            previous = 1;
            end
        end

    else
        x(i*n+1:(i+1)*n) =0;
        count=count+1;
        
        
            if(count==4)
               
                    if(rem( one,2 )==0 && previous == 1)
                        
                        x((i-3)*n+1:(i-2)*n) =-1;
                        x(i*n+1:(i+1)*n) =-1;
                        count=0;
     
                    else if((rem( one,2 )==1) && previous == 1)
                    
                        x(i*n+1:(i+1)*n) =1;
                        count=0;

                        else if(rem( one,2 )==1 && previous == -1)
                        x((i-3)*n+1:(i-2)*n) =-1;
                        count=0;
           
                            else if(rem( one,2 )==0 && previous == -1)
                        x((i-3)*n+1:(i-2)*n) =1;
                        x(i*n+1:(i+1)*n) =1;
                        count=0;
             
                    end
                    end
                    end
                    end
                end
        
        
        end
end


plot(t,x,'LineWidth',3);
grid on;
a = x;
x = 0;
for i=1:length(t)
    if t(i)>x
        x = x + 1;
        if(a(i)==1)
            ans_bits(x) = a(i);
        else if (a(i)==-1)
                ans_bits(x) = 1;
        else
            ans_bits(x) = 0;
            end
        end
    end
end
disp('AMI Decoding: ')
disp(bits)
disp(ans_bits)