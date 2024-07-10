%robert kernle gradient is a  2x2 convolution mask that uses diagonal pixels
% to estimate  first order derivatives,detects sharp diagonal edges
% is mainly used in edge detection technique.


clc;  %clear the command window
clear all;  % clear the worksapce and free all the memopr pace occupied by the previous 
% variable
close all;  %close all the figure window which are opened in the matlab


i1 = imread('smapleImage5.png');
i2 = rgb2gray(i1);
[m,n] = size(i2);
%robert kernel grdient for x direction
robert_kernelx = [1 0; 0 -1];
% robert kernel gradient for y direction
robert_kernely = [0 -1; 1 0];


%padding the grey scale pixels, especially pixels at leftmost and bottommost boundry  
% can considered as PUI.
i3 = padarray(i2,[1,1]);
output = zeros(m,n);
outputx = zeros(m,n);
outputy = zeros(m,n);
for(i= 1:m)
    for(j= 1:n)
        %accesing 2*2 matrix from the image on which robert filter to be
        %operated
         temp = i3(i:i+1, j:j+1);
         
        temp = double(temp);
        convx = temp.*robert_kernelx;
        % summing all the convolution value to put its final result at new
        % PUI
        outputx(i,j) = sum(convx(:));
        convy = temp.*robert_kernely;
        % summing all the convolution value to put its final result at new
        % PUI
        outputy(i,j) = sum(convy(:));
        output(i,j) = outputx(i,j)+outputy(i,j);
    end
end
output = uint8(output);
subplot(1,2,1);
imshow(i2);
title('gray scaled original image');
subplot(1,2,2);
imshow(output);
title('robert filtered image ');

