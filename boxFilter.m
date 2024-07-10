%All about the box filter.

% performing box filter(mean filter) operation over a gray scale image
% Image convolution with filter mask provides  simple averaging of 
% pixels in the neighbourhood of pixels as given by equation below


clc; 
clear all;
close all; 
i1 = imread('smapleImage5.png'); 
i2 = rgb2gray(i1); 
[m,n] = size(i2);

box_kernel3 = ones(3,3)/9;

i3 = padarray(i2,[1,1]);
output3 = zeros(m,n);
for i= 1:m
    for j= 1:n
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        conv = temp.*box_kernel3;
        output3(i,j) = sum(conv(:));
    end
end
output3 = uint8(output3);
subplot(3,2,1);
imshow(i2);
title('original image');
subplot(3,2,2);
imshow(output3);
title('3*3 box filtered image');


% box filter of size 5*5
box_kernel5 = ones(5,5)/25;
i4 = padarray(i2,[2,2]);
output5 = zeros(m,n);
for(i= 1:m)
    for(j= 1:n)
         temp = i4(i:i+4, j:j+4);
        temp = double(temp);
        conv = temp.*box_kernel5;
        output5(i,j) = sum(conv(:));
    end
end
output5 = uint8(output5);
subplot(3,2,3);
imshow(output5)
title('5*5 box filtered image');


% 7*7 box filterd image 
box_kernel7 = ones(7,7)/49;
i5 = padarray(i2,[3,3]);
output7 = zeros(m,n);
for(i= 1:m)
    for(j= 1:n)
         temp = i5(i:i+6, j:j+6);
        temp = double(temp);
        conv = temp.*box_kernel7;
        output7(i,j) = sum(conv(:));
    end
end
output7 = uint8(output7);
subplot(3,2,4);
imshow(output7);
title('7*7 filtered image');


% 9*9 box filterd image 
box_kernel9 = ones(9,9)/81;
i9 = padarray(i2,[4,4]);
output9 = zeros(m,n);
for(i= 1:m)
    for(j= 1:n)
         temp = i9(i:i+8, j:j+8);
        temp = double(temp);
        conv = temp.*box_kernel9;
        output9(i,j) = sum(conv(:));
    end
end
output9 = uint8(output9);
subplot(3,2,5);
imshow(output9);
title('9*9 filtered image');


% 11*11 box filterd image 
box_kernel11 = ones(11,11)/121;
i11 = padarray(i2,[5,5]);
output11 = zeros(m,n);
for(i= 1:m)
    for(j= 1:n)
         temp = i11(i:i+10, j:j+10);
        temp = double(temp);
        conv = temp.*box_kernel11;
        output11(i,j) = sum(conv(:));
    end
end
output11 = uint8(output11);
subplot(3,2,6);
imshow(output11);
title('11*11 filtered image');

%above code signifies that box filter cause blurring effect, and blurring
%tend to increases with incresing size of filter.



