[x, Fs] = audioread('speech1.wav');
y1 = decimate(interp(x,4),15);
soundsc(y1,Fs)
pause;
y2 = interp(decimate(x,15),4);
soundsc(y2,Fs)

plot(x)
title('x[n] Plot')
figure;
plot(y1)
title('y1[n] Plot')
figure;
plot(y2)
title('y2[n] Plot')
figure;

freqz(x)
title('x[n] Frequency Plot')
figure;
freqz(y1)
title('y1[n] Frequency Plot')
figure;
freqz(y2)
title('y2[n] Frequency Plot')
figure;