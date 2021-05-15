function Test(b,step)
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

 RAll=R2+ResDeQuantizedAR;  
 GAll=G2+ResDeQuantizedAG;
 BAll=B2+ResDeQuantizedAB;  

 Alli(:,:,1)=RAll;             Alli(:,:,2)=GAll;           Alli(:,:,3)=BAll;
 F=uint8(F); Alli=uint8(Alli);
 

figure, subplot(2,1,1);imshow(F,[]);title('Original Color image')
        subplot(2,1,2);imshow(Alli,[]);title('Compressed Color image')


 
 
