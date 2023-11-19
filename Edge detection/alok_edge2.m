close all;
clear;
clc;

% Read the image
img = imread('flower.jpg'); % Replace 'your_image.jpg' with the actual image file

% Convert the image to grayscale if it's a color image
if size(img, 3) == 3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end

% Apply Gaussian smoothing to the image
sigma = 1.5; % You can adjust the standard deviation of the Gaussian filter
img_smoothed = imgaussfilt(img_gray, sigma);

% Laplacian of Gaussian (LoG) operator
log_operator = fspecial('log', [5, 5], sigma);

% Convolve the smoothed image with the LoG operator
img_log = conv2(double(img_smoothed), log_operator, 'same');

% Display the original image, smoothed image, and the result of the LoG operator
figure;
subplot(1, 3, 1);
imshow(img_gray);
title('Original Image');

subplot(1, 3, 2);
imshow(img_smoothed);
title('Smoothed Image');

subplot(1, 3, 3);
imshow(img_log, []);
title('LoG Operator Result');

