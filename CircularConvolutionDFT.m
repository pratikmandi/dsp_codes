%To calculate Circular Convolution in DFT:

clc;
close all;
x=input("Enter discrete signal x sequence: ");
h=input("Enter discrete signal h sequence: ");
N=length(x);
M=length(h);
if N<M
    x=[x,zeros(1,M-N)];
elseif N>M
    h=[h,zeros(1,N-M)];
end
result =zeros(1,N);
for k=1:N
    for n=1:N
        circularIndex=mod(k-n,N)+1;
        result(k)=result(k)+x(n)*h(circularIndex);
    end
end
disp("Circular convolution result: ")
disp(result)