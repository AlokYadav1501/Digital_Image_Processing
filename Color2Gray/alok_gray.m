%DIP Learning
%Color to Graysacle image Conversion
%Color to red , green and blue image conversion
%Color to Black & White image conversion

close all;
clear all;
clc;

%reading an image
img = imread('image1.png');

%viewing the image
imshow(img);

%color to grayscale
%1)Mean value of pixels ie. [r(i) + g(i) + b(i)]/3.
%make sure to typecast it into double first.
%2)rounding it to integer and the tycasting it to uint8.

r = double(img(:,:,1)); %red layer
g = double(img(:,:,2)); %green layer
b = double(img(:,:,3)); %blue layer

gray_img = (r+g+b)/3;  %mean value of each pixel
gray_img = uint8(round(gray_img)); 

figure, imshow(gray_img);


%color to red , green and blue image
%put the pixel values for other two layer to zero
% leave the layer you want as it is

red_img = img;
red_img(:,:,2)=0;
red_img(:,:,3)=0;

green_img =img;
green_img(:,:,1)=0;
green_img(:,:,3)=0;

blue_img = img;
blue_img(:,:,2)=0;
blue_img(:,:,1)=0;

figure,
subplot(2,2,1), imshow(gray_img);
subplot(2,2,2), imshow(red_img);
subplot(2,2,3), imshow(green_img);
subplot(2,2,4), imshow(blue_img);

%Color to Black & White or binary image.
%Color -> grayscale -> black and white.
%let threshold value be 128.

[r,c] = size(gray_img); %size of row and cloumn
bw_img = zeros(r,c);
for i = 1:r
    for j = 1:c
       if gray_img(i,j)>=128 
           bw_img(i,j) = 1;
       end
    end
end

figure, imshow(bw_img);
    



