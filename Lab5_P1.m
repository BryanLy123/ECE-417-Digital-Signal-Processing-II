close all
NID =  100*7 + 10*9 + 2;

dp=0.01;
ds=0.01;
fp = 0.375 - NID*10^-4;
fs = 0.475 + NID*10^-4;
Fsampl=2;
[nfir_ord,fr_edge,des_mag,wt] = firpmord( [fp fs], [1 0], [dp ds], Fsampl);
hfir= firpm(nfir_ord,fr_edge,des_mag,wt);
[Hfir,w]=freqz(hfir,1,201);
plot(w/pi,abs(Hfir));
nfir_ord
%label axes in plot, put title, etc.
title('FIR Filter Comparison');
xlabel('w/pi')
ylabel('Magnitude of Hfir')