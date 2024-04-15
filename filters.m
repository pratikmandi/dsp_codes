% Define design parameters
wc1 = 0.5;
wc2 = 0.7;
rp = 3;   % Passband ripple
rs = 40;  % Stopband attenuation

% Calculate the minimum order of filters
[n_wc1, Wn1_butter] = buttord(wc1, wc2, rp, rs);
[n_wc1_cheby1, Wn1_cheby1] = cheb1ord(wc1, wc2, rp, rs);
[n_wc2_cheby2, Wn2_cheby2] = cheb2ord(wc1, wc2, rp, rs);
[n_wc1_ellip, Wn1_ellip] = ellipord(wc1, wc2, rp, rs);

% Design Butterworth filter
[b1, a1] = butter(n_wc1, Wn1_butter, 'low');
[H1, W1] = freqz(b1, a1);
PHI1 = angle(H1);

% Design Chebyshev Type I filter
[b2, a2] = cheby1(n_wc1_cheby1, rp, Wn1_cheby1, 'low');
[H2, W2] = freqz(b2, a2);
PHI2 = angle(H2);

% Design Chebyshev Type II filter
Wn_stop = [wc1 wc2]; % Define stopband frequencies properly
[b3, a3] = cheby2(n_wc2_cheby2, rs, Wn_stop, 'stop');
[H3, W3] = freqz(b3, a3);
PHI3 = angle(H3);

% Design Elliptic filter
[b4, a4] = ellip(n_wc1_ellip, rp, rs, Wn1_ellip, 'low');
[H4, W4] = freqz(b4, a4);
PHI4 = angle(H4);

% Plot frequency response for all filters
figure;

% Butterworth Filter
subplot(2,2,1);
plot(W1/pi, 20*log10(abs(H1)));
title('Butterworth Low Pass Filter');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
hold on;
plot(W1/pi, PHI1);
ylabel('Phase (radians)');
legend('Magnitude','Phase');

% Chebyshev Type I Filter
subplot(2,2,2);
plot(W2/pi, 20*log10(abs(H2)));
title('Chebyshev Type I Low Pass Filter');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
hold on;
plot(W2/pi, PHI2);
ylabel('Phase (radians)');
legend('Magnitude','Phase');

% Chebyshev Type II Filter
subplot(2,2,3);
plot(W3/pi, 20*log10(abs(H3)));
title('Chebyshev Type II Band Stop Filter');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
hold on;
plot(W3/pi, PHI3);
ylabel('Phase (radians)');
legend('Magnitude','Phase');

% Elliptic Filter
subplot(2,2,4);
plot(W4/pi, 20*log10(abs(H4)));
title('Elliptic Low Pass Filter');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
hold on;
plot(W4/pi, PHI4);
ylabel('Phase (radians)');
legend('Magnitude','Phase');

% Adjust layout to prevent label overlap
sgtitle('Filter Frequency Responses');