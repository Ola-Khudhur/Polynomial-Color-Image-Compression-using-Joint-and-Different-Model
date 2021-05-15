function [ImgQuantized,QStep]=ScalrUniformQuantizer(Img)

%Enter the Quantization Level 
Qlevel=input('Enter Quantization Level for Residual :','s');              q=str2num(Qlevel);
% Mx=max(Img(:));
% Mn=min(Img(:));
% pp=(Mx-Mn);
% QStep=(Mx-Mn)/(q-1);
% ImgQuantized(:,:)=round(Img(:,:)/QStep);
QStep=q;
ImgQuantized(:,:)=round(Img(:,:)/QStep);

%  Qlevel=input('Enter Quantization Level for Coefficients :','s');              QStep=str2num(Qlevel);
%  ImgQuantized(:,:)=round(Img(:,:)/QStep);