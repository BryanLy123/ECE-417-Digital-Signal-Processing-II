fin1 = fopen('lena512','r');
img = fread(fin1,[512,512],'uchar'); % img: clean lena image
size(img)
imagesc(img); % display image with scaled color
colormap(gray); % sets the Colormap property of a figure
fin2 = fopen('lena_noisy_512x512.raw','r');
im_gn = fread(fin2,[512,512],'uchar'); % im_gn: image with Gaussian noise
size(im_gn)
figure
imagesc(im_gn); % display image with scaled color
colormap(gray); % sets the Colormap property of a figure

% LPF3
imin = double(im_gn);
h1d_3 = remez(20,[ 0 0.1 0.4 1],[1 1 0 0],[1 5]);
[H1d_3,w] = freqz(h1d_3,1,128,'whole');
plot(w/pi-1,fftshift(abs(H1d_3)))
figure
h2d_3 = h1d_3.*h1d_3;% 2D FIR filter LPF3
freqz2(h2d_3)
imlp=conv2(imin,h2d_3,'same');
tem=round(double(imlp));
tem =max(tem,0);
tem = min(255, tem);

imout_3 = tem;
mse_3 = immse(img,imout_3);
fprintf('mse3 is: %f\n', mse_3);
figure
imagesc(imout_3); colormap(gray);
title('LPF3')
figure

% LPF5
imin = double(im_gn);
h1d_5 = remez(20,[ 0 0.5 0.8 1],[1 1 0 0],[1 5]);
[H1d_5,w] = freqz(h1d_5,1,128,'whole');
plot(w/pi-1,fftshift(abs(H1d_5)))
figure
h2d_5 = h1d_5.*h1d_5;% 2D FIR filter LPF5
freqz2(h2d_5)
imlp=conv2(imin,h2d_5,'same');
tem=round(double(imlp));
tem =max(tem,0);
tem = min(255, tem);
imout_5 = tem;
mse_5 = immse(img,imout_5);
fprintf('mse5 is: %f\n', mse_5);
figure
imagesc(imout_5); colormap(gray);
title('LPF5')
figure