clc;
clear all;
close all;
X=input('Enter the sequence : ');
N=input('Enter number of point    : ');
n=length(X);
x=[X zeros(1,N-n)];
M=log2(N);
for m=1:M
    d=2^(M-m+1);
    for l=1:d:(N-d+1)
        for k=0:(d/2)-1
            w=exp(-1i*2*pi*k/d);
            z1=x(l+k);
            z2=x(l+k+d/2);
            x(l+k)=z1+z2;
            x(l+k+d/2)=(z1-z2)*w;
        end
    end
end

y=bitrevorder(x);
disp(y)
subplot(3,1,1)
stem(abs(X));
title('Input Sequence');
subplot(3,1,2)
stem(abs(y));
title('Magnitude Response');
subplot(3,1,3)
stem(angle(y));
title('Phase Response');