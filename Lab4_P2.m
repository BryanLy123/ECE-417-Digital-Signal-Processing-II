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

hPL = firpm(20, [0 fs1 fp1 fp2 fs2 1], [3 1 0 0 1 3], [1 2 1]);

stem(hPL)
figure;

[HPL, w] = freqz(hPL);
plot(w,abs(HPL))
figure;

zplane(hPL)
