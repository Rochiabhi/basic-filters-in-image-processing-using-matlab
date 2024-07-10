clc;
clear all;
close all;
% performing 3*3  weighted mean  of type 1 operation over a gray scale image
i1 = imread('noisy sample image 2.png');
i2 = rgb2gray(i1);
[m,n] = size(i2);
box_kernel31 = [1 2 1;2 4 2;1 2 1]/16;
i3 = padarray(i2,[1,1]);
output31 = zeros(m,n);
for(i= 1:m)
    for(j= 1:n)
        
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        conv = temp.*box_kernel31;
        output31(i,j) = sum(conv(:));
        
    end
end
output31 = uint8(output31);
subplot (2,3,1);
imshow (i3);
title('original image');
subplot(2,3,2);
imshow(output31);
title('3*3 type1 image');


% performing 3*3  weighted mean of type 2 operation over a gray scale image
output32 = zeros(m,n);
box_kernel32 = [1 1 1; 2 3 2; 1 1 1]/13;
for i = 1:m
    for j= 1:n
        temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        conv = temp.*box_kernel32;
        output32(i,j) = sum(conv(:));
    end
end
output32 = uint8(output32);
subplot(2,3,3);
imshow(output32);
title('3*3 type2 image');



% performing 5*5  box filter  operation over a gray scale image
output51 = zeros(m,n);
i5 = padarray(i2,[2,2]);
box_kernel51 = [1 4 7 4 1;
    4 16 26 16 4;
    7 26 41 26 7;
    4 16 26 16 4;
    1 4 7 4 1]/273;
for i = 1:m
    for j= 1:n
        temp = i5(i:i+4, j:j+4);
        temp = double(temp);
        conv = temp.*box_kernel51;
        output51(i,j) = sum(conv(:));
    end
end
output51 = uint8(output51);
subplot(2,3,4);
imshow(output51);
title('5*5 weighted image');



%performing 7*7 weighted mean filter operation over a grey scale image
output71 = zeros(m,n);
i7 = padarray(i2,[3,3]);
box_kernel71 = [0 0 1 2 1 0 0;
    0 3 13 22 13 3 0;
    1 13 59 97 59 13 1;
    2 22 97 159 97 22 2;
    1 13 59 97 59 13 1;
    0 3 13 22 13 3 0;
    0 0 1 2 1 0 0]/1003;
for i = 1:m
    for j= 1:n
        temp = i7(i:i+6, j:j+6);
        temp = double(temp);
        conv = temp.*box_kernel71;
        output71(i,j) = sum(conv(:));
    end
end
output71 = uint8(output71);
subplot(2,3,5);
imshow(output71);
title('7*7 weighted image');

