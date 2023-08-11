%Dip learning Histogram Equalization
%by Alok Yadav 
%Dated 10/8/2023

close all;
clear;
clc;

%reading an image in same folder
img = imread("image2.jpg");
imshow(img);

%rows and column of image
[r,c] = size(img);

d = dictionary; %a dictionary to store pixels and its freq.

for i = 1:r
    for j = 1:c
        d(img(i,j)) = 0;
    end
end

k = keys(d); %values of pixels
n = size(k); 
sk = sort(k);  
sv = zeros(n);
sd = dictionary(sk,sv);

%calculating frequency 
for i = 1:r
    for j = 1:c
        d(img(i,j)) = d(img(i,j)) +1;
    end
end

%sorting the dictionary
for i = 1:length(k)
    sd(k(i)) = d(k(i));
end

%calculating cumulative frequency
cd = sd;
sum = 0;
for i = 1:length(sk)
    sum = sum + cd(sk(i));
    cd(sk(i)) =  sum;
end

%equalization of pixels
cdf_min = cd(sk(1));
cdf_max = cd(sk(length(sk)));

nd = cd;
for i=1:length(k)
    nd(sk(i)) = (round(((nd(sk(i))-cdf_min)/(cdf_max-cdf_min))*255));
end

%assigning new values to the pixels
new_img = img;
val_old = keys(nd);
val_new = values(nd);

for i=1:length(sk)
    new_img(new_img==val_old(i))= val_new(i);
end

figure, imshow(new_img);

%{
test_img = histeq(img);

new_d = dictionary;
for i = 1:r
    for j = 1:c
        new_d(test_img(i,j)) = 0;
    end
end
new_k = keys(new_d);
new_n = size(new_k);
new_sk = sort(new_k);
new_sv = zeros(new_n);
new_sd = dictionary(new_sk,new_sv);
for i = 1:r
    for j = 1:c
        new_d(test_img(i,j)) = new_d(test_img(i,j)) +1;
    end
end
for i = 1:length(new_k)
    new_sd(new_k(i)) = new_d(new_k(i));
end
figure, imshow(test_img);
%}
