
close;
clear;
clc;

%a = randi([0,255],3,3)

%b = dec2bin(a,8)

%img = imread("image4.jpg");

%img_gs = rgb2gray(img);

%[r c] = size(img_gs)

% Load your grayscale image
originalImage = imread('image4.jpg'); % Replace 'your_image.jpg' with your image file

% Ensure the image is grayscale (convert if necessary)
if size(originalImage, 3) == 3
    originalImage = rgb2gray(originalImage);
end

% Get the dimensions of the image
[rows, cols] = size(originalImage);

% Initialize an empty matrix to store the bit planes
bitPlanes = zeros(rows, cols, 8); % We assume 8-bit grayscale image

% Perform bit-plane slicing
for bit = 1:8
    % Extract the bit plane
    bitPlanes(:,:,bit) = double(bitget(originalImage, bit));
    
    % Display the bit plane
    subplot(2, 4, bit); % Create a 2x4 subplot grid
    imshow(bitPlanes(:,:,bit), []);
    title(['Bit Plane ', num2str(bit-1)]); % Bit-0 is the least significant bit
end

% Display the original image
figure;
imshow(originalImage);
title('Original Image');

% Remove the LSB (Bit Plane 0)
bitPlanes(:,:,1) = 0;

% Reconstruct the modified image
b1 = bitPlanes(:,:,1);
b2 = bitPlanes(:,:,2)*2;
b3 = bitPlanes(:,:,3)*4;
b4 = bitPlanes(:,:,4)*8;
b5 = bitPlanes(:,:,5)*16;
b6 = bitPlanes(:,:,6)*32;
b7 = bitPlanes(:,:,7)*64;
b8 = bitPlanes(:,:,8)*128;

modifiedImage = uint8(b1+b2+b3+b4+b5+b6+b7+b8);
% Display the modified image
figure;
imshow(modifiedImage);
title('Image with LSB Plane Removed');

% You can access each bit plane using bitPlanes(:,:,bitNumber)
% For example, bitPlane1 = bitPlanes(:,:,1);

% Note: You may need to adjust the file path and image format as per your image file.

