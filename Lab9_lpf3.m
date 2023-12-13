close all
imin = double(im_gn);
h1d_3 = remez(20,[ 0 0.1 0.4 1],[1 1 0 0],[1
5]);[H1d_3,w] = freqz(h1d_3,1,128,'whole');
plot(w/pi-1,fftshift(abs(H1d_3)))
figure
h2d_3 = h1d_3'*h1d_3; % 2D FIR filter LPF3
freqz2(h2d_3)
imlp=conv2(imin,h2d_3,'same');
tem=round(double(imlp));
tem =max(tem,0);
tem = min(255, tem);
imout_3 = tem;
mse_3 = immse(img,imout_3);
fprintf('mse3 is: %f\n', mse_3);
figure
imagesc(imout_3'); colormap(gray);