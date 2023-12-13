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

%mean square error
% immse(img,im_gn)

% %frequency domain of contamination
% imin = double(im_gn);
% v = imin-img;
% figure
% freqz2(v);
% figure
% mesh(abs(fft2(v)));
% figure

% LPF1
imin = double(im_gn);
h1d_1 = remez(20,[0 0.3 0.6 1],[1 1 0 0],[1 5]);% 1D FIR filter
[H1d_1,w] = freqz(h1d_1,1,128,'whole');% 1D Freq response using freqz
plot(w/pi-1,fftshift(abs(H1d_1))); % 1D Freq response using fftshift
figure
h2d_1 = h1d_1.*h1d_1;% 2D FIR filter LPF1
freqz2(h2d_1)% 2D Freq response using freqz2
imlp=conv2(imin,h2d_1,'same');% imlp: lowpass filtered image
tem=round(double(imlp));
tem =max(tem,0);
tem = min(255, tem);% pixel values bounded between 0 and 255
imout_1 = tem;
mse_1 = immse(img,imout_1);
fprintf('mse1 between clean and filtered images is: %f\n', mse_1);
mse_2 = immse(img,imin);
fprintf('mse2 between clean and noisey images is: %f\n', mse_2);
figure
imagesc(imout_1); colormap(gray);% filtered image
title('Filtered Image')
figure
imagesc(img); colormap(gray);% clean original image
title('Original Image')
figure
imagesc(imin); colormap(gray);% noisy image
title('Noisey Image')
