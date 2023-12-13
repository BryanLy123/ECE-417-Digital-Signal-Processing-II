bq_ell=quant(b_ell, 1/1024);
aq_ell=quant(a_ell, 1/1024);
Hqell=freqz(bq_ell,aq_ell,501);
figure
plot(abs(Hell))
nell_ord
title('Elliptic Filter Comparison');
xlabel('N-Point Frequency')
ylabel('Magnitude of Hell')

figure
plot(abs(Hell(1:201)))
title('Elliptic Filter Comparison');
xlabel('N-Point Frequency')
ylabel('Magnitude Quantization of Hell')

figure
plot(abs(Hqell(1:201)))
title('Elliptic Filter Comparison');
xlabel('N-Point Frequency')
ylabel('Magnitude Quantization of Hqell')

%label axes in plot, put title, etc.
