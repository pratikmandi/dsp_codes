% code for high pass
wc= .5;
n1=1;
n2=2;
n3=3;

[b1,a1]=butter(n1,wc,'high');
[b2,a2]=butter(n2,wc,'high');
[b3,a3]=butter(n3,wc,'high');

[H1,w1]=freqz(b1,a1);
[H2,w2]=freqz(b2,a2);
[H3,w3]=freqz(b3,a3);

figure;
plot(w1/pi,20*log10(abs(H1)),'b','LineWidth',2);
hold on;
plot(w2/pi,20*log10(abs(H2)),'r','LineWidth',2);
plot(w3/pi,20*log10(abs(H3)),'g','LineWidth',2);

legend("First order","Second order","Thrid order", "Location","south");
title("Frequency response of butterworth high pass filters ");
xlabel("Normalised frequency");
ylabel("Magnitude(dB)");
grid on;

%code for band pass filter

wc1 = 0.3; % Lower cutoff frequency
wc2 = 0.7; % Upper cutoff frequency

% Calculate the orders of the filters
n1 = 1; % First-order
n2 = 2; % Second-order
n3 = 3; % Third-order

% Design Butterworth band-pass filters
[b1, a1] = butter(n1, [wc1 wc2], 'bandpass');
[b2, a2] = butter(n2, [wc1 wc2], 'bandpass');
[b3, a3] = butter(n3, [wc1 wc2], 'bandpass');

% Frequency response
[H1, W1] = freqz(b1, a1);
[H2, W2] = freqz(b2, a2);
[H3, W3] = freqz(b3, a3);

% Plot frequency response for Butterworth band-pass filters
figure;
plot(W1/pi, 20*log10(abs(H1)), 'b', 'LineWidth', 2);
hold on;
plot(W2/pi, 20*log10(abs(H2)), 'r', 'LineWidth', 2);
plot(W3/pi, 20*log10(abs(H3)), 'g', 'LineWidth', 2);

% Set x-axis limit
xlim([0 1.2]);

% Add legend and labels
legend('First-order', 'Second-order', 'Third-order');
title('Frequency Response of Butterworth Band-Pass Filters');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
grid on;

% code for low pass
wc= .5;
n1=1;
n2=2;
n3=3;

[b1,a1]=butter(n1,wc,'low');
[b2,a2]=butter(n2,wc,'low');
[b3,a3]=butter(n3,wc,'low');

[H1,w1]=freqz(b1,a1);
[H2,w2]=freqz(b2,a2);
[H2,w3]=freqz(b3,a3);

figure;
plot(w1/pi,20*log10(abs(H1)),'b','LineWidth',2);
hold on;
plot(w2/pi,20*log10(abs(H2)),'r','LineWidth',2);
plot(w3/pi,20*log10(abs(H3)),'g','LineWidth',2);

legend("First order","Second order","Thrid order", "Location","south");
title("Frequency response of butterworth low pass filters ");
xlabel("Normalised frequency");
ylabel("Magnitude(dB)");
grid on;



% code for band stop filters ::
wc1 = 0.2; % Lower cutoff frequency
wc2 = 0.5; % Upper cutoff frequency

% Calculate the orders of the filters
n1 = 1; % First-order
n2 = 2; % Second-order
n3 = 3; % Third-order

% Design Butterworth band-pass filters
[b1, a1] = butter(n1, [wc1 wc2], 'stop');
[b2, a2] = butter(n2, [wc1 wc2], 'stop');
[b3, a3] = butter(n3, [wc1 wc2], 'stop');

% Frequency response
[H1, W1] = freqz(b1, a1);
[H2, W2] = freqz(b2, a2);
[H3, W3] = freqz(b3, a3);

% Plot frequency response for Butterworth band-pass filters
figure;
plot(W1/pi, 20*log10(abs(H1)), 'b', 'LineWidth', 2);
hold on;
plot(W2/pi, 20*log10(abs(H2)), 'r', 'LineWidth', 2);
plot(W3/pi, 20*log10(abs(H3)), 'g', 'LineWidth', 2);

% Set x-axis limit
xlim([0 1.2]);

% Add legend and labels
legend('First-order', 'Second-order', 'Third-order');
title('Frequency Response of Butterworth Band-stop Filters');
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
grid on;
