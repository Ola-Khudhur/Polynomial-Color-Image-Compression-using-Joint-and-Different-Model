function TraditionalRGB(b,step)
close all;
%1)Read color image 
[R,G,B,F]=ReadAnyImage();
R=double(R);
G=double(G);
B=double(B);

%)Apply the polynomial coding on the RGB frames
 
[a0R,a1R,a2R]=LinearDrLoayGH(R, b, step);
figure,    subplot(3,1,1);imagesc(squeeze(a0R(:,:)));colormap(gray);  colorbar; axis square;title('Red image Coff');
           subplot(3,1,2);imagesc(squeeze(a1R(:,:)));colormap(gray);  colorbar; axis square;
           subplot(3,1,3);imagesc(squeeze(a2R(:,:)));colormap(gray);  colorbar; axis square;

[a0G,a1G,a2G]=LinearDrLoayGH(G, b, step);
figure,    subplot(3,1,1);imagesc(squeeze(a0G(:,:)));colormap(gray);  colorbar; axis square;title('Green band image Coff');
           subplot(3,1,2);imagesc(squeeze(a1G(:,:)));colormap(gray);  colorbar; axis square;
           subplot(3,1,3);imagesc(squeeze(a2G(:,:)));colormap(gray);  colorbar; axis square;
           
[a0B,a1B,a2B]=LinearDrLoayGH(B, b, step);
figure,    subplot(3,1,1);imagesc(squeeze(a0B(:,:)));colormap(gray);  colorbar; axis square;title('Blue band image Coff');
           subplot(3,1,2);imagesc(squeeze(a1B(:,:)));colormap(gray);  colorbar; axis square;
           subplot(3,1,3);imagesc(squeeze(a2B(:,:)));colormap(gray);  colorbar; axis square;        
           
        
 [a0RQuantized,a0RStep,a1RQuantized,a1RStep,a2RQuantized,a2RStep]=ScalrUniformQuantizerCoeff(a0R,a1R,a2R);
 [a0RDeQuantized,a1RDeQuantized,a2RDeQuantized]=ScalrUniformDeQuantizerCoeff(a0RQuantized,a0RStep,a1RQuantized,a1RStep,a2RQuantized,a2RStep);
          
        
 [a0GQuantized,a0GStep,a1GQuantized,a1GStep,a2GQuantized,a2GStep]=ScalrUniformQuantizerCoeff(a0G,a1G,a2G);
 [a0GDeQuantized,a1GDeQuantized,a2GDeQuantized]=ScalrUniformDeQuantizerCoeff(a0GQuantized,a0GStep,a1GQuantized,a1GStep,a2GQuantized,a2GStep);

           
 [a0BQuantized,a0BStep,a1BQuantized,a1BStep,a2BQuantized,a2BStep]=ScalrUniformQuantizerCoeff(a0B,a1B,a2B);
 [a0BDeQuantized,a1BDeQuantized,a2BDeQuantized]=ScalrUniformDeQuantizerCoeff(a0BQuantized,a0BStep,a1BQuantized,a1BStep,a2BQuantized,a2BStep);

 



 Ya0R=uint8(a0RQuantized);        Ya0RSize=mat2huff(Ya0R);         Xa0RSize = Ya0RSize.code;      infoa0R=whos('Xa0RSize');    bSeeda0R=infoa0R.bytes; 
 Ya1R=uint8(a1RQuantized);        Ya1RSize=mat2huff(Ya1R);         Xa1RSize = Ya1RSize.code;      infoa1R=whos('Xa1RSize');    bSeeda1R=infoa1R.bytes; 
 Ya2R=uint8(a2RQuantized);        Ya2RSize=mat2huff(Ya2R);         Xa2RSize = Ya2RSize.code;      infoa2R=whos('Xa2RSize');    bSeeda2R=infoa2R.bytes; 

 Ya0G=uint8(a0GQuantized);        Ya0GSize=mat2huff(Ya0G);         Xa0GSize = Ya0GSize.code;      infoa0G=whos('Xa0GSize');    bSeeda0G=infoa0G.bytes; 
 Ya1G=uint8(a1GQuantized);        Ya1GSize=mat2huff(Ya1G);         Xa1GSize = Ya1GSize.code;      infoa1G=whos('Xa1GSize');    bSeeda1G=infoa1G.bytes; 
 Ya2G=uint8(a2GQuantized);        Ya2GSize=mat2huff(Ya2G);         Xa2GSize = Ya2GSize.code;      infoa2G=whos('Xa2GSize');    bSeeda2G=infoa2G.bytes; 
 
 Ya0B=uint8(a0BQuantized);        Ya0BSize=mat2huff(Ya0B);         Xa0BSize = Ya0BSize.code;      infoa0B=whos('Xa0BSize');    bSeeda0B=infoa0B.bytes; 
 Ya1B=uint8(a1BQuantized);        Ya1BSize=mat2huff(Ya1B);         Xa1BSize = Ya1BSize.code;      infoa1B=whos('Xa1BSize');    bSeeda1B=infoa1B.bytes; 
 Ya2B=uint8(a2BQuantized);        Ya2BSize=mat2huff(Ya2B);         Xa2BSize = Ya2BSize.code;      infoa2B=whos('Xa2BSize');    bSeeda2B=infoa2B.bytes; 


 AllRed=bSeeda0R+bSeeda1R+bSeeda2R         
 AllGreen=bSeeda0G+bSeeda1G+bSeeda2G   
 AllBlue=bSeeda0B+bSeeda1B+bSeeda2B 
 
 AllCoeff=AllRed+AllGreen+AllBlue

 [R2]=Reconstruct(R,b,step,a0RDeQuantized,a1RDeQuantized,a2RDeQuantized);
 [G2]=Reconstruct(G,b,step,a0GDeQuantized,a1GDeQuantized,a2GDeQuantized);
 [B2]=Reconstruct(B,b,step,a0BDeQuantized,a1BDeQuantized,a2BDeQuantized);

 
 RRes=R-R2;
 GRes=G-G2;
 BRes=B-B2;
 
figure,  subplot(3,2,1);imshow(R2,[]);title('Predicted Red channel')
         subplot(3,2,2);imshow(RRes,[]),title('Residual Red channel')
         subplot(3,2,3);imshow(G2,[]),title('Predicted Green channel')
         subplot(3,2,4);imshow(GRes,[]),title('Residual Green channel')
         subplot(3,2,5);imshow(B2,[]),title('Predicted Blue channel')
         subplot(3,2,6);imshow(BRes,[]),title('Residual Blue channel')


[ResQuantizedAR,ResQStepAR]=ScalrUniformQuantizer(RRes);
[ResDeQuantizedAR]=ScalrUniformDeQuantizer(ResQuantizedAR,ResQStepAR);

 [ResQuantizedAG,ResQStepAG]=ScalrUniformQuantizer(GRes);
 [ResDeQuantizedAG]=ScalrUniformDeQuantizer(ResQuantizedAG,ResQStepAG);

[ResQuantizedAB,ResQStepAB]=ScalrUniformQuantizer(BRes);
[ResDeQuantizedAB]=ScalrUniformDeQuantizer(ResQuantizedAB,ResQStepAB);


YResr=uint8(ResQuantizedAR);        YResrSize=mat2huff(YResr);         XResrSize = YResrSize.code;      infoResr=whos('XResrSize');    bSeed22R=infoResr.bytes; 
YResg=uint8(ResQuantizedAG);        YResgSize=mat2huff(YResg);         XResgSize = YResgSize.code;      infoResg=whos('XResgSize');    bSeed22G=infoResg.bytes; 
YResb=uint8(ResQuantizedAB);        YResbSize=mat2huff(YResb);         XResbSize = YResbSize.code;      infoResb=whos('XResbSize');    bSeed22B=infoResb.bytes; 


 RAll=R2+ResDeQuantizedAR;  
 GAll=G2+ResDeQuantizedAG;
 BAll=B2+ResDeQuantizedAB;  

 Alli(:,:,1)=RAll;             Alli(:,:,2)=GAll;           Alli(:,:,3)=BAll;
 F=uint8(F); Alli=uint8(Alli);
 
 er2=RMSError(F,Alli)
figure, subplot(2,1,1);imshow(F,[]);title('Original Color image')
        subplot(2,1,2);imshow(Alli,[]);title('Compressed Color image')


  CompressedRed=bSeed22R+ AllRed;           
  CompressedGreen=bSeed22G+ AllGreen;   
  CompressedBlue=bSeed22B+ AllBlue    
  AllCompressed=CompressedRed+CompressedGreen+CompressedBlue
 
 Original=SizeInBytes(uint8(F));
 CompRatio=Original/AllCompressed
 
