% MATLAB code for DFT  
clear all; 
xn=input('Input sequence: '); 
N = input('Enter the number of points: ');

%Function Declaration:
DFT=calcdft(xn,N);  %calcdft is not an in-built function.

%Function Definition
function[DFT] = calcdft(xn,N)
    L=length(xn); 
    if(N<L) 
        error('N must be greater than or equal to L!!') 
    end
    x1=[xn, zeros(1,N-L)]; 
    for k=0:1:N-1 
        for n=0:1:N-1
            p=exp(-i*2*pi*n*k/N); 
            W(k+1,n+1)=p; 
        end
    end
    DFT=W*(x1.')
end