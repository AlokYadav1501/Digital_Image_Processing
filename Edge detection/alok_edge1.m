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

% Sobel operator
sobel_horizontal = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
sobel_vertical = [-1, -2, -1; 0, 0, 0; 1, 2, 1];

% Convolve the image with the Sobel operators
gradient_x = conv2(double(img_gray), sobel_horizontal, 'same');
gradient_y = conv2(double(img_gray), sobel_vertical, 'same');

% Compute the gradient magnitude
gradient_magnitude = sqrt(gradient_x.^2 + gradient_y.^2);

% Display the original image, gradient in x-direction, gradient in y-direction, and gradient magnitude
figure;
subplot(2, 2, 1);
imshow(img_gray);
title('Original Image');

subplot(2, 2, 2);
imshow(gradient_x, []);
title('Gradient in X-direction');

subplot(2, 2, 3);
imshow(gradient_y, []);
title('Gradient in Y-direction');

subplot(2, 2, 4);
imshow(gradient_magnitude, []);
title('Gradient Magnitude');





