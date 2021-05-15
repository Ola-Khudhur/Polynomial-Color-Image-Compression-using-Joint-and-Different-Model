function [R,G,B]=ReadAnyImage2()

  I=imread('d:\face1.bmp'); 
R = I(:,:,1);%Red component
G = I(:,:,2);%Green Component
B = I(:,:,3);%Blue component

figure;image(R), colormap([[0:1/255:1]', zeros(256,1), zeros(256,1)]), colorbar; 
figure;image(G), colormap([zeros(256,1),[0:1/255:1]', zeros(256,1)]), colorbar;
figure;image(B), colormap([zeros(256,1), zeros(256,1), [0:1/255:1]']), colorbar;
