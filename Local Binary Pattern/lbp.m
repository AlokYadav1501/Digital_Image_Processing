close all;
clear;
clc;

% Read an image
img = imread('flower.jpg'); % replace 'your_image.jpg' with the actual image file

% Convert the image to grayscale if it's a color image
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Compute the Local Binary Pattern
lbpFeatures = extractLBPFeatures(img);

% Display the original image
subplot(1, 2, 1);
imshow(img);
title('Original Image');

% Display the LBP features
subplot(1, 2, 2);
bar(lbpFeatures);
title('LBP Features');

% You can use lbpFeatures for further analysis or classification