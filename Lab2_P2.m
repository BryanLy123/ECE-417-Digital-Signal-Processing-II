[y,Fs] = audioread('signal_plus_noise.wav');
[yC,Fsc] = audioread('clean_signal.wav');

fprintf('Sampling frequency = %.1f Hz\nSampling Period = %.2f microsec\n', Fs,1000000/Fs)
clf
soundsc(y,Fs)
pause

dft = fft(y,Fs);
stem(dft)
title('Noisey signal');
xlabel('Time sample index n')
ylabel('Amplitude y[n]')
pause

dft2 = fft(yC,Fsc);
stem(dft2)
title('Clean signal');
xlabel('Time sample index n')
ylabel('Amplitude y[n]')
pause

h=firpm(32,[0.3 0.45 0.8 1.0],[1 1 0 0],[1 6]);
yf = conv(y,h);
soundsc(yf,Fs);
pause

dft3 = fft(yf,Fs);
stem(dft3)
title('Filtered signal');
xlabel('Time sample index n')
ylabel('Amplitude y[n]')
pause

subplot(2,1,1)
y1 = y(12501:19000);
[Y1,W]=freqz(y1);
plot(W,abs(Y1));
xlabel('Frequency \omega')
ylabel('Magnitude of DTFT')
title('Voiced sound frequency content');

subplot(2,1,2)
y2 = yf(5601:7600);
[Y2,W]=freqz(y2);
plot(W,abs(Y2));
xlabel('Frequency \omega')
ylabel('Magnitude of DTFT')
title('Unvoiced sound frequency content');

ySamp = y(1:size(yC));
%MSE1 = mean((clean_signal - noisey_signal).^2);
MSE1 = mean((yC - y).^2);

%MSE2 = mean((clean_signal - filtered_signal).^2);
MSE2 = mean((yC - ySamp).^2);

fprintf('MSE1 (Clean vs. Noisy): %.4f\n', MSE1);
fprintf('MSE2 (Clean vs. Filtered): %.4f\n', MSE2);