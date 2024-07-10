 clc;
 clear all;
 close all;
 % comparing different laplacian filter operation over gray scale image and
 % observe its changes
 %there are four types of laplacian filter kernel 
 
%laplacian filter kernel type 1
 i1 = imread('sampleImage2.png');
 i2 = rgb2gray(i1);
 [m,n] = size(i2);
 i3 = padarray(i2,[1,1]);
 %lapalacin filter of mask 3*3  to obtain second order derivative filter of
 %image considering different neighbourhood pixels.
 laplacian_kernel1 = [0 1 0 ; 1 -4 1; 0 1 0];
 
for(i= 1:m)
    for(j= 1:n)
        
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        conv = temp.*laplacian_kernel1;
        output1(i,j) = sum(conv(:));
        
    end
 end
 %output1 = uint8(output1);
 %imshow(output)
 
 
 
 
 
%lapalcian filter kernel type 2 
%lapalacin filter of mask 3*3  to obtain second order derivative filter of
 %image considering different neighbourhood pixels + diagnal pixels.
 laplacian_kernel2 = [1 1 1 ; 1 -8 1; 1 1 1];
 
for(i= 1:m)
    for(j= 1:n)
        
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        conv = temp.*laplacian_kernel2;
        output2(i,j) = sum(conv(:));
        
    end
 end
 %output2 = uint8(output2);
 %imshow(output)

 %lapalcian filter kernel type 3 
%lapalacin filter of mask 3*3  to obtain second order derivative filter of
 %image considering different neighbourhood pixels taking change with respect to 
%central pixels.
 laplacian_kernel3 = [0 -1 0; -1 4 -1; 0 -1 0];
 
for(i= 1:m)
    for(j= 1:n)
        
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        conv = temp.*laplacian_kernel3;
        output3(i,j) = sum(conv(:)); 
    end
 end
 %output3 = uint8(output3);
 %imshow(output)
 
 
 
 
 
 
%lapalcian filter kernel type 4 
%lapalacin filter of mask 3*3  to obtain second order derivative filter of
 %image considering different neighbourhood pixels taking change with respect to 
%central pixels.
 laplacian_kernel4 = [-1 -1 -1 ; -1 8 -1; -1 -1 -1];
 
for(i= 1:m)
    for(j= 1:n)
        
         temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        conv = temp.*laplacian_kernel4;
        output4(i,j) = sum(conv(:));
        
    end
 end
 %output4 = uint8(output4);
 
 
%plotting of different output image.
 subplot(2,3,1);
 imshow(i1);
 title(' original image');

  subplot(2,3,2);
 imshow(i2);
 title('grey scale image');
 subplot(2,3,3);
 imshow(output1);
 title('output image of type 1 laplacian filter mask');
 subplot(2,3,4);
 imshow(output2);
 title('output image of type 2 laplacian filter mask');
 subplot(2,3,5);
 imshow(output3);
 title('output image of type 3 laplacian filter mask');
 subplot(2,3,6);
 imshow(output4);
 title('output image of type 4 laplacian filter mask');
