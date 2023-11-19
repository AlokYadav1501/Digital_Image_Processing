close all;
clear;
clc;

% Read an image
img = imread('image1.png');

% Convert the image to grayscale if it's in color
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Convert the image data type to double for accurate calculations
img = double(img);

% Apply 2D DCT
dct_img = dct2(img);

% Display the original and DCT-transformed images
subplot(1, 2, 1);
imshow(uint8(img));
title('Original Image');

subplot(1, 2, 2);
imshow(log(abs(dct_img)), []);
title('DCT Transformed Image (log scale)');

colormap(gca, jet(64)); % Optional: set the colormap for better visualization
