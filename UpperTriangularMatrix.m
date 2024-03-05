clc
clear all
close all
a=[1,2,3,4,5];
for i=1:5
    matB(i,i:5)=a(1:5-(i-1));
end
disp(matB)


