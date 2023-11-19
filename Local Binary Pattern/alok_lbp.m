close all;
clear;
clc;

% Read an image
img = imread('flower.jpg'); % replace 'your_image.jpg' with the actual image file

% Convert the image to grayscale if it's a color image
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Set the radius and number of neighbors for LBP
radius = 1;
neighbors = 8;

% Get the dimensions of the image
[rows, cols] = size(img);

% Initialize the LBP image
lbpImage = zeros(rows, cols);

% Compute LBP for each pixel
for i = 2:rows-1
    for j = 2:cols-1
        centerPixel = img(i, j);
        binaryPattern = 0;

        % Compare with neighbors
        for k = 1:neighbors
            x = i + radius * cos(2 * pi * k / neighbors);
            y = j - radius * sin(2 * pi * k / neighbors);

            % Interpolation
            x1 = floor(x);
            x2 = ceil(x);
            y1 = floor(y);
            y2 = ceil(y);

            % Bilinear interpolation
            f1 = (x2 - x) * (y2 - y);
            f2 = (x - x1) * (y2 - y);
            f3 = (x2 - x) * (y - y1);
            f4 = (x - x1) * (y - y1);

            % Check for out-of-bounds
            if x1 >= 1 && x2 <= rows && y1 >= 1 && y2 <= cols
                neighborPixel = img(x1, y1) * f1 + img(x1, y2) * f2 + img(x2, y1) * f3 + img(x2, y2) * f4;
                binaryPattern = binaryPattern + (neighborPixel >= centerPixel) * 2^(neighbors - k);
            end
        end

        % Assign the LBP value to the corresponding pixel
        lbpImage(i, j) = binaryPattern;
    end
end

% Display the original and LBP images
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(lbpImage), []);
title('LBP Image');

% You can use lbpImage for further analysis or classification
