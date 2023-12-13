%tpn2

load tones % loads the data from tones.mat
load telephone_numbers % and telephone_numbers.mat
whos % shows Fs, {tpn0,...,tpn4},
% and {u0,...,u9} (ten digits)


N10=length(tpn2(1:500));
freq = 1:Fs/N10:Fs;
U10=abs(fft(tpn2(1:500)));
plot(freq,U10)
title('Digit tpn2 Unknown Digit 1')
figure

N11=length(tpn2(467:850));
freq = 1:Fs/N11:Fs;
U11=abs(fft(tpn2(467:850)));
plot(freq,U11)
title('Digit tpn2 Unknown Digit 2')
figure

N12=length(tpn2(850:1350));
freq = 1:Fs/N12:Fs;
U12=abs(fft(tpn2(850:1350)));
plot(freq,U12)
title('Digit tpn2 Unknown Digit 3')
figure

N13=length(tpn2(1350:1860));
freq = 1:Fs/N13:Fs;
U13=abs(fft(tpn2(1350:1860)));
plot(freq,U13)
title('Digit tpn2 Unknown Digit 4')
figure

plot(tpn2)
title('tpn2 Signal')
figure

Noise = tpn2+randn(length(tpn2),1);
plot(Noise)
title('Noisey tpn2 Signal')

ratio = snr(tpn2,Noise)