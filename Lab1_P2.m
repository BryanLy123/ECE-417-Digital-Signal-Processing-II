% Plab1_2.m Linear-Phase FIR filter design
%
% Plab1_2_ECE417.m Linear-Phase FIR filter design
%
clf;
NID = 792;
fp=0.31+0.14*NID/1000;
fs=1-fp;
Nord=10;% choose even order
n = firpmord([0.25 0.35 0.65 0.75], [0 1 0], [0.025 0.1 0.05], pi);
% n = 100;
% Design the filter
h = firpm(n, [0 0.25 0.35 0.65 0.75 1], [0 0 1 1 0 0], [0.025 0.1 0.05]);
[H, w] = freqz(h,1,100);
Hmax=max(abs(H));
plot(w, abs(H));%Plot the magnitude response of filter
xlabel('frequency');ylabel('DFT magnitude');
title('Magnitude of H versus frequency');
axis([0 pi 0 1.2*Hmax]);
grid;
disp('PRESS RETURN for pole-zero plot of H');
pause
roots(h)
zplane(h);