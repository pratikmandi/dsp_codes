clc
close all
b=[1,4,9,2,1];
c=b;
for i=2:5
    c(i,1:5)=c(i-1,5:-1:1)
end
disp(c)