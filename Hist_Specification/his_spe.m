close all;
clear;
clc;

% Read the reference and target images
referenceImage = imread('image1.png');
targetImage = imread('image4.jpg');

% Convert images to grayscale if they are RGB
%referenceImage = rgb2gray(referenceImage);
%targetImage = rgb2gray(targetImage);

% Perform histogram specification
outputImage = imhistmatch(targetImage, referenceImage);

% Display the original and specified images
figure;
subplot(1, 2, 1); imshow(targetImage); title('Original Image');
subplot(1, 2, 2); imshow(outputImage); title('Specified Image');
