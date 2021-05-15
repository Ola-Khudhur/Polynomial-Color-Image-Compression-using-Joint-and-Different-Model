function [R,G,B,F]=ReadAnyImage()

     F=imread('c:\girl.tiff');
     R = F(:,:,1);
     G = F(:,:,2);
     B = F(:,:,3);
%      F=double(F);
figure, subplot(2,2,1);imshow(F,[]);title('Original Color image')
        subplot(2,2,2);imshow(R,[]);title('Red channel')
        subplot(2,2,3);imshow(G,[]);title('Green channel')
        subplot(2,2,4);imshow(B,[]),title('Blue channel')
% YCBCR = rgb2ycbcr(F);
%      R = YCBCR(:,:,1);
%      G = YCBCR(:,:,2);
%      B = YCBCR(:,:,3);