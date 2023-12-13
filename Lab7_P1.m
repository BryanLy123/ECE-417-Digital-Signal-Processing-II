h=firpm(60,[0 0.095 0.145 1],[1 1 0 0],[1 1]);
n=[-30:30];
[H,w] = freqz(h,1,512);
% plot(w,abs(H))
% title('Magnitude Response of h[n]')
% xlabel('Frequency w')
% ylabel('Magnitude')
% figure;

c0=cos(n*pi/8);
g0=h.*c0;
[G0,w] = freqz(g0,1,512);
% plot(w,abs(G0))
% title('Magnitude Response of g0[n]')
% xlabel('Frequency w')
% ylabel('Magnitude')
% figure;


c1=cos(3*n*pi/8);
g1=h.*c1;
[G1,w] = freqz(g1,1,512);
% plot(w,abs(G1))
% title('Magnitude Response of g1[n]')
% xlabel('Frequency w')
% ylabel('Magnitude')
% figure;

c2=cos(5*n*pi/8);
g2=h.*c2;
[G2,w] = freqz(g2,1,512);
% plot(w,abs(G2))
% title('Magnitude Response of g2[n]')
% xlabel('Frequency w')
% ylabel('Magnitude')
% figure;

c3=cos(7*n*pi/8);
g3=h.*c3;
[G3,w] = freqz(g3,1,512);
% plot(w,abs(G3))
% title('Magnitude Response of g3[n]')
% xlabel('Frequency w')
% ylabel('Magnitude')
% figure;

Fs = 22050;

[x0,Fs] = audioread('sf1.wav');
xu0 = upsample(x0,4);
y0 = conv(xu0,g0);
% plot(abs(fft(x0)))
% title('Input signal x0')
% figure;
% plot(abs(fft(y0)))
% title('Output signal y0')
% figure;

[x1,Fs] = audioread('sf2.wav');
xu1 = upsample(x1,4);
y1 = conv(xu1,g1);
% plot(abs(fft(x1)))
% title('Input signal x1')
% figure;
% plot(abs(fft(y1)))
% title('Output signal y1')
% figure;

[x2,Fs] = audioread('sf3.wav');
xu2 = upsample(x2,4);
y2 = conv(xu2,g2);
% plot(abs(fft(x2)))
% title('Input signal x2')
% figure;
% plot(abs(fft(y2)))
% title('Output signal y2')
% figure;

[x3,Fs] = audioread('sf4.wav');
xu3 = upsample(x3,4);
y3 = conv(xu3,g3);
% plot(abs(fft(x3)))
% title('Input signal x3')
% figure;
% plot(abs(fft(y3)))
% title('Output signal y3')
% figure;

y = y0+y1+y2+y3;

w0 = conv(y,g0);
v0 = downsample(w0,4);
% plot(abs(fft(v0)))
% title('Demultiplexed signal v0[n]')
% figure;

w1 = conv(y,g1);
v1 = downsample(w1,4);
plot(abs(fft(v1)))
title('Demultiplexed signal v1[n]')
figure;

w2 = conv(y,g2);
v2 = downsample(w2,4);
% plot(abs(fft(v2)))
% title('Demultiplexed signal v2[n]')
% figure;

w3 = conv(y,g3);
v3 = downsample(w3,4);
% plot(abs(fft(v3)))
% title('Demultiplexed signal v3[n]')
% figure;

soundsc(v1)
