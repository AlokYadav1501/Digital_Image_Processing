close;
clear;
clc;

img1 = imread("image1.png");
img2 = imread("image4.jpg");

%grayscaling
img1gs = rgb2gray(img1);
img2gs = rgb2gray(img2);

%binary images
threshold = 128;
bin_img1gs = img1gs > threshold;
bin_img2gs = img2gs > threshold;

%resizing 
img2gs_rs= imresize(img2gs,[1389 2500]);
bin_img2gs_rs= imresize(bin_img2gs,[1389 2500]);

%Basic Arithmetic Operations
img_add = img1gs + img2gs_rs;
img_sub = img1gs - img2gs_rs;
img_mul = img1gs .* img2gs_rs;
img_div = img1gs ./ img2gs_rs;
%rest of arithmetic oprations
img_sca = img1gs*2;
img_abs = abs(img1gs - img2gs_rs);
img_pow = img1gs.^2;
img_sqroot = sqrt(double(img1gs));
img_sqrt = uint8(img_sqroot);
img_loga = log(double(img1gs));
img_log = uint8(img_loga);

%Logical operations
img_and = bin_img1gs & bin_img2gs_rs;
img_or = bin_img1gs | bin_img2gs_rs;
img_not = ~bin_img1gs;

%Geometric Operations
img_scale = imresize(img2gs, 2);
img_rotate = imrotate(img2gs, 45);
tform = affine2d([1 0.5 0 ; 0 1 0; 0 0 1]);
img_shear = imwarp(img2gs, tform);
img_flip_vert = flipud(img2gs);
img_flip_hori = fliplr(img2gs);

figure,
subplot(3,2,1), imshow(img1gs);
subplot(3,2,2), imshow(img2gs);
subplot(3,2,3), imshow(img_add);
subplot(3,2,4), imshow(img_sub);
subplot(3,2,5), imshow(img_mul);
subplot(3,2,6), imshow(img_div);

figure,
subplot(3,2,1), imshow(img_sca);
subplot(3,2,2), imshow(img_abs);
subplot(3,2,3), imshow(img_pow);
subplot(3,2,4), imshow(img_sqrt);
subplot(3,2,5), imshow(img_log);

figure,
subplot(3,2,1), imshow(img1gs);
subplot(3,2,2), imshow(img2gs);
subplot(3,2,3), imshow(img_and);
subplot(3,2,4), imshow(img_or);
subplot(3,2,5), imshow(img_not);

figure,
subplot(3,2,1), imshow(img2gs);
subplot(3,2,2), imshow(img_scale);
subplot(3,2,3), imshow(img_rotate);
subplot(3,2,4), imshow(img_shear);
subplot(3,2,5), imshow(img_flip_vert);
subplot(3,2,6), imshow(img_flip_hori);
