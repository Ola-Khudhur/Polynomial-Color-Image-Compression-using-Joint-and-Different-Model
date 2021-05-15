function [ImgDeQuantized]=ScalrUniformDeQuantizer(Img,q)

q=double(q);
ImgDeQuantized(:,:)=(Img(:,:)*q);