clc;
clear all;
close all;
% performing image enhancement filter operation over a gray scale image
% there are two kinds of image enhancement kernel

% image enhancement kernel operation type 1 
i1 = imread('smapleImage5.png');
i2 = rgb2gray(i1);
[m,n] = size(i2);
imageEnhancement_kernel1 = [0 -1 0; -1 5 -1; 0 -1 0];
i3 = padarray(i2,[1,1]);
for(i= 1:m)
    for(j= 1:n)
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        conv = temp.*imageEnhancement_kernel1;
        output1(i,j) = sum(conv(:));
    end
end
output1 = uint8(output1);
subplot(1,3,1);
imshow(i2);
title('original image');
subplot(1,3,2);
imshow(output1);
title('type1 image');


% image enhancement kernel operation type 2
imageEnhancement_kernel2 = [-1 -1 -1; -1 9 -1; -1 -1 -1];
for(i= 1:m)
    for(j= 1:n)
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        conv = temp.*imageEnhancement_kernel2;
        output2(i,j) = sum(conv(:));
    end
end
output2 = uint8(output2);
subplot(1,3,3);
imshow(output2);
title('type 2 image');











