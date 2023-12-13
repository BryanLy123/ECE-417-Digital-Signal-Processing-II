imin = double(im_gn);
h1d_1 = remez(20,[0 0.3 0.6 1],[1 1 0 0],[1 5]); % 1D FIR filter
[H1d_1,w] = freqz(h1d_1,1,128,'whole'); % 1D Freq response using freqz
plot(w/pi-1,fftshift(abs(H1d_1))); % 1D Freq response using fftshift
% fftshift is useful for visualizing the Fourier transform with the zero-frequency component in the middle of the spectrum
figure
h2d_1 = h1d_1'*h1d_1; % 2D FIR filter LPF1
freqz2(h2d_1) % 2D Freq response using freqz2
imlp=conv2(imin,h2d_1,'same'); % imlp: lowpass filtered image
tem=round(double(imlp));
tem =max(tem,0);
tem = min(255, tem); % pixel values bounded between 0 and 255
imout_1 = tem;
mse_1 = immse(img,imout_1); % measure the mean square error
fprintf('mse1 between clean and filtered images is: %f\n', mse_1);
figure
imagesc(imout_1'); colormap(gray); % filtered image
figure
imagesc(img'); colormap(gray); % clean original image
figure
imagesc(imin'); colormap(gray); % noisy image
mse_2 = immse(img,imin);
fprintf('mse2 between clean and noisey images is: %f\n', mse_2);