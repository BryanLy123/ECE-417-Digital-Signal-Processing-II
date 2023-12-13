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

% 2D FIR filter LPF4
imin = double(im_gn);
delta = 0.2;
h1d_4 = remez(20,[ 0 (0.3+delta) (0.6+delta) 1],[1 1 0 0],[1 5]);
h2d_4 = h1d_4.*h1d_4;% 2D FIR filter LPF4
freqz2(h2d_4)
imlp=conv2(imin,h2d_4,'same');
tem=round(double(imlp));
tem =max(tem,0);
tem = min(255, tem);

imout_4 = tem;
mse_4 = immse(img,imout_4);
fprintf('mse4 is: %f\n', mse_4);
figure
imagesc(imout_4); colormap(gray);
title('LPF4')
figure