clc;
close all;
clear all;
format long;
rp=input('enter the passband ripple:(default:0.04)');
rs=input('enter the stopband ripple:(default: 0.05)');
fp=input('enter the passband frequency:(default:1500)');
fs=input('enter the stopband frequency:(default:2000)');
f=input('enter the sampling frequency:(default:9000)');
wp=2*(fp/f);
ws=2*(fs/f);
num=-20*log10(sqrt(rp*rs))-13;
dem=14.6*(fs-fp)/f;
n=ceil(num/dem);
n1=n+1;
if(rem(n,2)~=0)
n1=n;
n=n-1;
end;
y=boxcar(n1);
%Lowpass filter
b=fir1(n,wp,y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,1,1);
plot(o/pi,m);
ylabel('gain in db---->');
xlabel('Normalised frequency---->');
title('FIR filter using Rectangular window of LPF ----');
grid on;

%Highpass filter
b=fir1(n,wp,'high',y);
[h,o]=freqz(b,1,256);
m=20*log10(abs(h));
subplot(2,1,2);
plot(o/pi,m);
ylabel('gain in db---->');
xlabel('Normalised frequency---->');
title('FIR filter using Rectangular window of HPF ----');
title('Magnitude response of high pass filter');
grid on;