N = 31;
fc= 0.2;
fs = 1;
hamming_window= hamming(N);


figure;
stem(h_hamming);
xlabel('sample');
ylabel('Amplitude');
title('Impulse Resonance of FIR filter using hamming window');
