clc;
close all;
x=input("Enter discrete signal x sequence: ");
y=input("Enter discrete signal y sequence: ");
a=transpose(x)*y;
length=size(a);
convo=zeros(1,length(1)+length(2)-1);
for i= 1:length(1)
    for j=1:length(2)
        convo(i+j-1)=convo(i+j-1)+a(i,j);
    end
end

disp(convo)