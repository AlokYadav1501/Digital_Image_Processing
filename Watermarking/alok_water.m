close all;
clear;
clc;

% Read the original image
originalImage = imread('image4.jpg');

% Read or create the watermark (you can use a logo or text)
watermark = imread('pure.png'); % Replace with your watermark image

% Resize the watermark to match the dimensions of the original image
watermark = imresize(watermark, [size(originalImage, 1), size(originalImage, 2)]);

% Choose the alpha blending value for transparency (0 for fully transparent, 1 for fully opaque)
alpha = 0.2;

% Blend the images using alpha blending
watermarkedImage = uint8((1 - alpha) * double(originalImage) + alpha * double(watermark));

% Display the original and watermarked images
subplot(1, 2, 1), imshow(originalImage), title('Original Image');
subplot(1, 2, 2), imshow(watermarkedImage), title('Watermarked Image');

% Save the watermarked image
imwrite(watermarkedImage, 'watermarked_image.jpg');

