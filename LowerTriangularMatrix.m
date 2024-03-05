clc
close all
d=[1,2,3,4,5];
e=d;
for i=2:5
    e(i,1:5)=[e(i-1,2:5),0];
end
       
disp(e)
