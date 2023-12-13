NID  = 100*7 + 10*9 + 2;
w1 = 0.05*pi + 0.2*NID*pi/1000;

ws1 = w1 + 0.1*pi;
wp1 = w1 + 0.25*pi;
wp2 = w1 + 0.45*pi;
ws2 = w1 + 0.6*pi;

fs1 = ws1/pi;
fp1 = wp1/pi;
fp2 = wp2/pi;
fs2 = ws2/pi;

Nord = firpmord([fs1 fp1 fp2 fs2], [2 0 1], [0.1 0.2 0.3], pi);
h3B = firpm(Nord, [0 fs1 fp1 fp2 fs2 1], [2 2 0 0 1 1], [0.1 0.2 0.3]);

stem(h3B)
figure;

[H3B, w] = freqz(h3B);
plot(w,abs(H3B))

[peak, index] = findpeaks(abs(H3B));

peak(1) = peak(1) - 2
peak(2) = peak(2)
peak(3) = peak(3) - 1