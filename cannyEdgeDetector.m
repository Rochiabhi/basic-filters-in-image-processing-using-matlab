%canny edge detector filter designing in for edge detection, there are
%various steps of canny edge detection like noise removal, then gradient
%calculation using sobel filter then after non maximum supression steps,
%and the after double thresholding and finally edge tracking using
%hysterisis



% noise removal steps using gaussian kernel
clc;
clear all;
close all;
img = imread('sampleImage4.png');
I = rgb2gray(img);

 
% making a gaussian kernel
sigma = 1;         % standard deviation of the distribution
% since we are going to normalize the kernel anyway, hence only exponential
% part will matter.
kernel = zeros(5,5);      % for a 5x5 kernel
W = 0;                    % sum of elements of kernel (for normalization)
for i = 1:5
    for j=1:5
        sq_dist = (i-3)^2+ (j-3)^2;
        kernel(i,j) = exp(-1*(sq_dist)/(2*sigma*sigma));
        W = W + kernel(i,j);
    end
end
kernel = kernel/W;
 
% now we apply the filter to the image
[m,n] = size(I);
output1 = zeros(m,n);
Im = padarray(I,[2 2]);

for i=1:m
    for j=1:n
        temp = Im(i:i+4 , j:j+4);
        temp = double(temp);
        conv = temp.*kernel;
        output1(i,j) = sum(conv(:));
    end
end
output1 = uint8(output1);
 subplot(2,3,1);
 imshow(I);
 title('original image');
 subplot(2,3,2);
 imshow(output1);
 title('gassuian image');
 



 
% sobel filter operation on output image obtained from gaussian filter
i2 = output1;
[m,n] = size(i2);
sobel_kernelx = [-1 0 1; -2 0 2; -1 0 1];
sobel_kernely = [1 2 1; 0 0 0; -1 -2 -1];
i3 = padarray(i2,[1,1]);
sobelOutputx= zeros(m,n);
sobelOutputy = zeros(m,n);
sobelMagnitude= zeros(m,n);
sobelDirection = zeros(m,n);
for(i= 1:m)
    for(j= 1:n)
        
        temp = i3(i:i+2, j:j+2);
        temp = double(temp);
        convx = temp.*sobel_kernelx;
        sobelOutputx(i,j) = sum(convx(:));
        convy = temp.*sobel_kernely;
        sobelOutputy(i,j) = sum(convy(:));
        sobelMagnitude(i,j) = sqrt(sobelOutputx(i,j)^2+sobelOutputy(i,j)^2);
        if(sobelOutputx(i,j) == 0)
            sobelDirection(i,j) = 0;
        elseif (sobelOutputy(i,j) == 0)
            sobelDirection  (i,j) = 90;
        else
        sobelDirection(i,j) = (atan(sobelOutputy(i,j)/sobelOutputx(i,j))*180)/3.14;
        end
    
    end
end
sobelMagnitude = uint8(sobelMagnitude);
subplot(2,3,3);
imshow(sobelMagnitude);
title('sobel image');





% quantizing the angle of the matrix of sobeldirection matrix in terms of
% -90, -45, 0 45, 90
for(i= 1:m)
    for(j= 1:n)
        if(sobelDirection(i,j)>=-22.5 && sobelDirection(i,j)<22.5)
            sobelDirection(i,j) = 0;
        else if(sobelDirection(i,j)>=22.5 && sobelDirection(i,j) <67.5)
        sobelDirection(i,j) = 45;
            else if(sobelDirection(i,j)>=67.5 && sobelDirection(i,j)<=90)
                    sobelDirection(i,j)= 90;
                else if(sobelDirection(i,j)>=-67.5 && sobelDirection(i,j)<-22.5)
                    sobelDirection(i,j) = -45;
                    else if((sobelDirection(i,j)>=-90 && sobelDirection(i,j)<-67.5))
                            sobelDirection(i,j) = -90;
                        end
                    end
                end
            end
        end
    end
end





    % non maximum supression steps on the output image obtained after gradient
                 
    sobelDirection = padarray(sobelDirection,[1,1]);
    sobelMagnitude =padarray(sobelMagnitude,[1,1]); 
    [m,n] = size(sobelMagnitude);
 for(i=2:m-1)
    for(j=2:n-1)
        
        if(sobelDirection(i,j)==0)
            if(sobelMagnitude(i,j)<sobelMagnitude(i,j+1)||sobelMagnitude(i,j)<sobelMagnitude(i,j-1))
                sobelMagnitude(i,j) = 0;
            end
        else if(sobelDirection(i,j)==45)
                 if(sobelMagnitude(i,j)<sobelMagnitude(i+1,j-1)||sobelMagnitude(i,j)<sobelMagnitude(i-1,j+1))
               sobelMagnitude(i,j) = 0;
                 end
            else if(sobelDirection(i,j)==90||sobelDirection(i,j)==-90)
                    if(sobelMagnitude(i,j)< sobelMagnitude(i+1,j)|| sobelMagnitude(i,j)<sobelMagnitude(i-1,j))
                        sobelMagnitude(i,j) = 0;
                    end
                else if(sobelDirection==-45)
                        if(sobelMagnitude(i,j)<sobelMagnitude(i+1,j+1)||sobelMagnitude < sobelMagnitude(i-1,j-1))
                            sobelMagnitude(i,j) = 0;
                        end
                    end
                end
            end
        end
    end
 end      
 subplot(2,3,4);
 imshow(sobelMagnitude); 
 title('non-maxm supression image');
 
 
 
 
 
 
 % double threshold and edge tracking by hysteris  operation on non maximum supressed image
  % we can change threshold value according to requirement in
 %the of figure.
 upperThreshold = 150;
 lowerThreshold = 90;
%  sobelMagnitude =padarray(sobelMagnitude,[1,1]); 
%  [m,n] = size(sobelMagnitude);
 
 for i = 2:m-1
     for j =2:n-1
         if(sobelMagnitude(i,j)> upperThreshold)
             sobelMagnitude(i,j) = 255;
         else if(sobelMagnitude(i,j) <=lowerThreshold)
                 sobelMagnitude(i,j) = 0;
             else
                  if(sobelMagnitude(i,j-1)==255 ||sobelMagnitude(i,j+1)==255 ||sobelMagnitude(i-1,j)==255||sobelMagnitude(i+1,j)==255|| sobelMagnitude(i-1,j-1)==255||sobelMagnitude(i+1,j-1)==255||sobelMagnitude(i-1,j+1)==255||sobelMagnitude(i+1,j+1)==255)
                      sobelMagnitude(i,j) = 255;
                  else 
                      sobelMagnitude(i,j)  = 0;
                  end
     end
         end
     end
 end
 subplot(2,3,6);
 imshow(sobelMagnitude); 
 title('canny edged image');
 

