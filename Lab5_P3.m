[nch1_ord, wn] = cheb1ord(2*fp/Fsampl, 2*fs/Fsampl, -20*log10(1-dp), -20*log10(ds));% Filter order & parameter wn are computed.
[b_ch1,a_ch1] = cheby1(nch1_ord, -20*log10(1-dp), wn);% Filter coefficients
[Hch1,w]=freqz(b_ch1,a_ch1,501);% Frequency response is computed.
figure
plot(w/pi,abs(Hch1));
nch1_ord
%label axes in plot, put title, etc.
title('Chebyshev Type 1 Filter Comparison');
xlabel('w/pi')
ylabel('Magnitude of Hch1')