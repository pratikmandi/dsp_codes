clc;
clear all;
close all; 
rp=input('enter the passband ripple(Example:0.02):');
rs=input('enter the stopband ripple(Example:0.01):');
fp=input('enter the passband freq(Example:1500):');
fs=input('enter the stopband freq(Example:2000):');
f=input('enter the sampling freq(Example:6000):');

wp=2*fp/f;ws=2*fs/f;
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/f;
n=ceil(num/dem);
n1=n+1;
if (rem(n,2)~=0)
n1=n;
n=n-1;
end
y=hamming(n1);

% low-pass filter
b=fir1(n,wp,y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
figure,plot(o/pi,m);
title('FIR Filter Response');
ylabel('Gain in dB');
xlabel('Normalised frequency');