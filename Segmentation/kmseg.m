close all;
clear;
clc;

% Read the image
img = imread('flower.jpg');

% Convert the image to double precision for processing
img_double = double(img);

% Reshape the image into a column vector for k-means
img_vector = reshape(img_double, [], 3);

% Perform k-means clustering (adjust the number of clusters as needed)
num_clusters = 3;
[idx, centers] = kmeans(img_vector, num_clusters);

% Reshape the index to the size of the image
segmented_img = reshape(idx, size(img, 1), size(img, 2));

% Display the original and segmented images
figure;
subplot(1, 2, 1), imshow(img), title('Original Image');
subplot(1, 2, 2), imshow(segmented_img, []), title('Segmented Image');

% You can use the 'centers' variable to get the RGB values of the clusters
disp('RGB values of cluster centers:');
disp(centers);
