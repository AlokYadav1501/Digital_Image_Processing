close;
clear;
clc;

img = imread("taj.jpg");
img_gs = rgb2gray(img);

% Perform the wavelet transform
[LL, LH, HL, HH] = dwt2(img_gs,'haar');

% Perform the inverse wavelet transform
recon_Image = idwt2(LL, LH, HL, HH, 'haar'); % Use the same wavelet type


% LL: Approximation coefficients
% LH: Horizontal detail coefficients
% HL: Vertical detail coefficients
% HH: Diagonal detail coefficients

% Display the transformed coefficients
subplot(3,2,1);
imshow(img_gs, []);
title('Original');

subplot(3,2,2);
imshow(LL, []);
title('Approximation (LL)');

subplot(3,2,3);
imshow(LH, []);
title('Horizontal Detail (LH)');

subplot(3,2,4);
imshow(HL, []);
title('Vertical Detail (HL)');

subplot(3,2,5);
imshow(HH, []);
title('Diagonal Detail (HH)');

subplot(3,2,6);
imshow(recon_Image, []);
title('Reconstructed Image');
