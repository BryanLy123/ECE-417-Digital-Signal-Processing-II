% PERFECT RECONSTRUCTION FILTER BANK
close all;
% INPUT SIGNAL
% xin = randn(1,N);% Gaussian noise
N = 10;
xin = [1 zeros(1,N-1)];
% ANALYSIS FILTERS g0 AND g1, SYNTHESIS FILTERS f0 AND f1
g0=[-1 0 9 16 9 0 -1]/32; % analysis LPF
g1 = [-1 0 18 16 -63 -144 348 -144 -63 16 18 0 -1]/512;% analysis HPF
f0=[-1 0 18 -16 -63 144 348 144 -63 -16 18 0 -1]/256;% synthesis LPF
f1=[1 0 -9 16 -9 0 1]/16;% synthesis HPF
%---------------------------------------------
% ANALYSIS FILTER OUTPUTS
u0=conv(xin,g0);
u1=conv(xin,g1);
% DOWNSAMPLING AND UPSAMPLING OF ANALYSIS FILTER OUTPUTS
t0 = downsample(u0,2);
t1 = downsample(u1,2);
v0=upsample(t0,2);
v1=upsample(t1,2);
% SYNTHESIS FILTER OUTPUTS
y0=conv(v0,f0);
y1=conv(v1,f1);
% FILTER BANK OUTPUT
y=(y0+y1);
% FILTER BANK OUTPUT SHIFTED TO ALIGN WITH INPUT
noffset=9;
% offset due to 3(6) samples in lowpass(highpass) anlayais filter
% plus 6(3) samples in lowpass(highpass) synthesis filter
xout=y(1+noffset:N+noffset);
% ERROR BETWEEN INPPUT AND OUTPUT OF FILTER BANK
error=xout-xin;
mse=sum(error.*error)

% plot(xin)
% title('Plot of Xin')
% figure;
% plot(y)
% title('Plot of Y')
% figure;

plot(abs(g0))
title('Analysis Filter g0[n]')
figure;
plot(abs(g1))
title('Analysis Filter g1[n]')
figure;
 
plot(abs(f0))
title('Synthesis Filter f0[n]')
figure;
plot(abs(f1))
title('Synthesis Filter f1[n]')
figure;

plot(abs(u0))
title('Analysis Filter u0[n] Output')
figure;
plot(abs(u1))
title('Analysis Filter u1[n] Output')
figure;

plot(abs(y0))
title('Synthesis Filter y0[n] Output')
figure;
plot(abs(y1))
title('Synthesis Filter y1[n] Output')
figure;