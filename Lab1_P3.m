% Plab1_3_ECE417_Speech_Display_Analysis.m Updated 2020-09-06
% Display and examine a speech signal
[y,Fs] = audioread('noisy_speech.wav');
fprintf('Sampling frequency = %.1f Hz\nSampling Period = %.2f microsec\n', Fs,1000000/Fs)
clf


soundsc(y,Fs)
plot(y); 
title('Speech signal');
xlabel('Time sample index n')
ylabel('Amplitude y[n]')
pause 

h=firpm(30,[0.3 0.45 0.8 1.0],[0 1 1 0],[1 6]); 

yf = conv(y,h); 
soundsc(yf,Fs);

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

