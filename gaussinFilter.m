
%performing gaussian filter kernel over a image
clc;
clear all;
close all;
 
img = imread('smapleImage5.png');
I = rgb2gray(img);
I1= imnoise(I,'Gaussian',0.04,0.003);
 
sigma = 1;         % standard deviation of the distribution
%larger the sigma heigher the blurring.
% since we are going to normalize the kernel anyway, hence only exponential
% part will matter.
kernel5 = zeros(5,5);      % for a 5x5 kernel
W5 = 0;                    % sum of elements of kernel (for normalization)
for i = 1:5
    for j=1:5
        sq_dist = (i-3)^2+ (j-3)^2;
        kernel5(i,j) = exp(-1*(sq_dist)/(2*sigma*sigma));
        W5 = W5 + kernel5(i,j);
    end
end
kernel5 = kernel5/W5;
 
% now we apply the filter on the gaussin  noised  image
[m,n] = size(I);
outputGG = zeros(m,n);
IGG = padarray(I1,[2 2]);
 
for i=1:m
    for j=1:n
        temp = IGG(i:i+4 , j:j+4);
        temp = double(temp);
        conv = temp.*kernel5;
        outputGG(i,j) = sum(conv(:));
    end
end
 
outputGG = uint8(outputGG);% convert the image to 8 bit unsigned integer
% now we can show original and filtered image
subplot(2,3,1);
imshow(I);
title('original image');
subplot(2,3,2);
imshow(I1);
title('noised image');
subplot(2,3,3);
imshow(outputGG);
title('gaussian image');

%now apply gaussian filter on original image 

outputoG = zeros(m,n);
IoG = padarray(I,[2 2]);
 
for i=1:m
    for j=1:n
        temp = IoG(i:i+4 , j:j+4);
        temp = double(temp);
        conv = temp.*kernel5;
        outputoG(i,j) = sum(conv(:));
    end
end

outputoG = uint8(outputoG);
subplot(2,3,4);
imshow(outputoG);
title('gaussian original image');





% gassuain filter of size 7*7
kernel7 = zeros(7,7);     
W7 = 0;                   
for i = 1:7
    for j=1:7
        sq_dist = (i-3)^2+ (j-3)^2;
        kernel7(i,j) = exp(-1*(sq_dist)/(2*sigma*sigma));
        W7 = W7 + kernel7(i,j);
    end
end
kernel7 = kernel7/W7;
outputoG7 = zeros(m,n);
IoG7 = padarray(I,[3,3]);
 
for i=1:m
    for j=1:n
        temp = IoG7(i:i+6 , j:j+6);
        temp = double(temp);
        conv = temp.*kernel7;
        outputoG7(i,j) = sum(conv(:));
    end
end

outputoG7 = uint8(outputoG7);
subplot(2,3,5);
imshow(outputoG7);
title('7*7 gaussian image');
% conclusion : there is no significant increase in  bluring on increasing the size of
% gaussin filter











