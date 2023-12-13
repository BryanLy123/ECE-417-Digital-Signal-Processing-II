[nell_ord, wn] = ellipord(2*fp/Fsampl, 2*fs/Fsampl,-20*log10(1-dp), -20*log10(ds));% Filter order & parameter wn are computed.
[b_ell,a_ell] = ellip(nell_ord, -20*log10(1-dp), -20*log10(ds), wn);% Filter
[Hell,w]=freqz(b_ell,a_ell,501);% Frequency response is computed.
figure
plot(w/pi,abs(Hell));
nell_ord
%label axes in plot, put title, etc.
title('Elliptic Filter Comparison');
xlabel('w/pi')
ylabel('Magnitude of Hell')