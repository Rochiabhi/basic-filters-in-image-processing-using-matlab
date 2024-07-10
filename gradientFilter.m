clc;
clear all;
close all;
% performing gradient kernel operation over a gray scale image
% grdient can be calculated using three way for backward difference
% approach, central difference approach and backward difference approach.


% gradient kernel using backward difference approach
i1 = imread('smapleImage5.png');
i2 = rgb2gray(i1);
[m,n] = size(i2);
gradient_kernelbx = [0 0 0; 1 -1 0; 0 0 0];
gradient_kernelby = [0 1 0; 0 -1 0;0 0 0];
i3 = padarray(i2,[1,1]);
outputb = zeros(m,n);
outputbx = zeros(m,n);
outputby = zeros(m,n);
for(i= 1:m)
    for(j= 1:n)
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        convx = temp.*gradient_kernelbx;
        outputbx(i,j) = sum(convx(:));
        convy = temp.*gradient_kernelby;
        outputby(i,j) = sum(convy(:));
        outputb(i,j) = sqrt(outputbx(i,j)^2+outputby(i,j)^2);
    end
end
outputb = uint8(outputb);
subplot(2,2,1);
imshow(i2);
title('original image');
subplot(2,2,2);
imshow(outputb);
title('backward meathod image');




%gradient kernel using central difference approach
gradient_kernelcx = [0 0 0;-1 0 1;0 0 0];
gradient_kernelcy = [0 -1 0; 0 0 0;0 1 0];
outputc = zeros(m,n);
outputcx = zeros(m,n);
outputcy = zeros(m,n);
for(i= 1:m)
    for(j= 1:n)
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        convx = temp.*gradient_kernelcx;
        outputcx(i,j) = sum(convx(:));
        convy = temp.*gradient_kernelcy;
        outputcy(i,j) = sum(convy(:));
        outputc(i,j) = sqrt(outputcx(i,j)^2+outputcy(i,j)^2);
    end
end
outputc = uint8(outputc);
subplot(2,2,3);
imshow(outputc);
title('central metahod image');


%gradient kernel using forward difference approach
gradient_kernelfx = [0 0 0;-1 1 0; 0 0 0];
gradient_kernelfy = [0 -1 0; 0 1 0; 0 0 0];
outputf = zeros(m,n);
outputfx = zeros(m,n);
outputfy = zeros(m,n);
for(i= 1:m)
    for(j= 1:n)
        
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        convx = temp.*gradient_kernelfx;
        outputfx(i,j) = sum(convx(:));
        convy = temp.*gradient_kernelfy;
        outputfy(i,j) = sum(convy(:));
        outputf(i,j) = sqrt(outputfx(i,j)^2+outputfy(i,j)^2);
    end
end
outputc = uint8(outputc);
subplot(2,2,4);
imshow(outputc)
title('forward meathod image');
% conclusion backward gradinet operator is not a  very good edge detctor
% filter.
