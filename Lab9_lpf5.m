close all;
imin = double(im_gn);
h1d_5 = remez(20,[ 0 0.5 0.8 1],[1 1 0 0],[1 5]);
[H1d_5,w] = freqz(h1d_5,1,128,'whole');
plot(w/pi-1,fftshift(abs(H1d_5)))
figure
h2d_5 = h1d_5'*h1d_5; % 2D FIR filter LPF5
freqz2(h2d_5)
imlp=conv2(imin,h2d_5,'same');
tem=round(double(imlp));
tem =max(tem,0);
tem = min(255, tem);
imout_5 = tem;
mse_5 = immse(img,imout_5);
fprintf('mse5 is: %f\n', mse_5);
figure
imagesc(imout_5'); colormap(gray);