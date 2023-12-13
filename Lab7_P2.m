h=firpm(10,[0 0.095 0.145 1],[1 1 0 0],[1 1]);
n=[-5:5];
[H,w] = freqz(h,1,512);
plot(w,abs(H))
title('Magnitude Response of h[n] with Order N = 10')
xlabel('Frequency w')
ylabel('Magnitude')
figure;

c0=cos(n*pi/8);
g0=h.*c0;
[G0,w] = freqz(g0,1,512);

c1=cos(3*n*pi/8);
g1=h.*c1;
[G1,w] = freqz(g1,1,512);

c2=cos(5*n*pi/8);
g2=h.*c2;
[G2,w] = freqz(g2,1,512);

c3=cos(7*n*pi/8);
g3=h.*c3;
[G3,w] = freqz(g3,1,512);

Fs = 22050;

[x0,Fs] = audioread('sf1.wav');
xu0 = upsample(x0,4);
y0 = conv(xu0,g0);

[x1,Fs] = audioread('sf2.wav');
xu1 = upsample(x1,4);
y1 = conv(xu1,g1);

[x2,Fs] = audioread('sf3.wav');
xu2 = upsample(x2,4);
y2 = conv(xu2,g2);

[x3,Fs] = audioread('sf4.wav');
xu3 = upsample(x3,4);
y3 = conv(xu3,g3);

y = y0+y1+y2+y3;

w1 = conv(y,g1);
v1 = downsample(w1,4);
plot(abs(fft(v1)))
title('Demultiplexed signal v1[n]')
figure;

soundsc(x1)