n = -(N-1)/2 : (N-1)/2;
h_ideal = 2*fc*sinc(2*fc*n);
h_hamming=h_ideal.*hamming_window;
fvtool(h_hamming,1,'Fs',fs,'color','white');