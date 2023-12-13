[nbut_ord, wn] = buttord(2*fp/Fsampl, 2*fs/Fsampl, -20*log10(1-dp), -20*log10(ds));% Filter order & parameter wn are computed.
[b_but,a_but] = butter(nbut_ord, wn);% Filter coefficients are computed.
[Hbut,w]=freqz(b_but,a_but,501);% Frequency response is computed.
figure
plot(w/pi,abs(Hbut));% Magnitude response vs. omega/pi
nbut_ord
%label axes in plot, put title, etc.
title('Butterworth Filter Comparison');
xlabel('w/pi')
ylabel('Magnitude of Hbut')