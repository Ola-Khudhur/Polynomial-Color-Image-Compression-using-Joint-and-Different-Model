function TraditionalRGBnew(b,step)
close all;
%1)Read color image 
[R,G,B,F]=ReadAnyImage();
R=double(R);
G=double(G);
B=double(B);


[cAR, cHR, cVR, cDR] = dwt2(R);
[cAG, cHG, cVG, cDG] = dwt2(G);
[cAB, cHB, cVB, cDB] = dwt2(B);

 figure(2); subplot(1,1,1);imagesc(squeeze([cAR,cHR; cVR, cDR]));colormap(gray);  colorbar;title('Red image first level');
 figure(3); subplot(1,1,1);imagesc(squeeze([cAG,cHG; cVG, cDG]));colormap(gray);  colorbar;title('Green image first level');
 figure(4); subplot(1,1,1);imagesc(squeeze([cAB,cHB; cVB, cDB]));colormap(gray);  colorbar;title('Blue image first level');

 
BSLH=input('Enter Percentage of Details Subbands of all bands quadrants :','s');              bLH=str2num(BSLH);
 
ncLH=(100-bLH)/100

sorttcLHR=sort(abs(cHR(:))); thrLHR=sorttcLHR(floor(ncLH*16384));  newcHR=cHR.*(abs(cHR)>thrLHR);

 sorttcLHG=sort(abs(cHG(:))); thrLHG=sorttcLHG(floor(ncLH*16384)); newcHG=cHG.*(abs(cHG)>thrLHG);

 sorttcLHB=sort(abs(cHB(:))); thrLHB=sorttcLHB(floor(ncLH*16384)); newcHB=cHB.*(abs(cHR)>thrLHB);


sorttcHLR=sort(abs(cVR(:)));  thrHLR=sorttcHLR(floor(ncLH*16384)); newcVR=cVR.*(abs(cVR)>thrHLR);

sorttcHLG=sort(abs(cVG(:)));  thrHLG=sorttcHLG(floor(ncLH*16384)); newcVG=cVG.*(abs(cVG)>thrHLG);

sorttcHLB=sort(abs(cVB(:)));  thrHLB=sorttcHLB(floor(ncLH*16384)); newcVB=cVB.*(abs(cVB)>thrHLB);


sorttcHHR=sort(abs(cDR(:)));  thrHHR=sorttcHHR(floor(ncLH*16384)); newcDR=cDR.*(abs(cDR)>thrHHR);

sorttcHHG=sort(abs(cDG(:)));  thrHHG=sorttcHHG(floor(ncLH*16384)); newcDG=cDG.*(abs(cDG)>thrHHG);

sorttcHHB=sort(abs(cDB(:)));  thrHHB=sorttcHHB(floor(ncLH*16384)); newcDB=cDB.*(abs(cDB)>thrHHB);
 
[t0r,o0r]=rlcGH(newcHR);   P20r=uint8(t0r); P20rSize=mat2huff(P20r); Seed20rSize = P20rSize.code;infoSeed20r=whos('Seed20rSize'); bSeed20r=infoSeed20r.bytes;        
[t0g,o0g]=rlcGH(newcHG);   P20g=uint8(t0g); P20gSize=mat2huff(P20g); Seed20gSize = P20gSize.code;infoSeed20g=whos('Seed20gSize'); bSeed20g=infoSeed20g.bytes;  
[t0b,o0b]=rlcGH(newcHB);   P20b=uint8(t0b); P20bSize=mat2huff(P20b); Seed20bSize = P20bSize.code;infoSeed20b=whos('Seed20bSize'); bSeed20b=infoSeed20b.bytes;        

LHbands=bSeed20r+bSeed20g+bSeed20b 


[t1r,o1r]=rlcGH(newcVR);   P21r=uint8(t1r); P21rSize=mat2huff(P21r); Seed21rSize = P21rSize.code;infoSeed21r=whos('Seed21rSize'); bSeed21r=infoSeed21r.bytes;        
[t1g,o1g]=rlcGH(newcVG);   P21g=uint8(t1g); P21gSize=mat2huff(P21g); Seed21gSize = P21gSize.code;infoSeed21g=whos('Seed21gSize'); bSeed21g=infoSeed21g.bytes;  
[t1b,o1b]=rlcGH(newcVB);   P21b=uint8(t1b); P21bSize=mat2huff(P21b); Seed21bSize = P21bSize.code;infoSeed21b=whos('Seed21bSize'); bSeed21b=infoSeed21b.bytes;        

HLbands=bSeed21r+bSeed21g+bSeed21b 

[t2r,o2r]=rlcGH(newcDR);   P22r=uint8(t2r); P22rSize=mat2huff(P22r); Seed22rSize = P22rSize.code;infoSeed22r=whos('Seed22rSize'); bSeed22r=infoSeed22r.bytes;        
[t2g,o2g]=rlcGH(newcDG);   P22g=uint8(t2g); P22gSize=mat2huff(P22g); Seed22gSize = P22gSize.code;infoSeed22g=whos('Seed22gSize'); bSeed22g=infoSeed22g.bytes;  
[t2b,o2b]=rlcGH(newcDB);   P22b=uint8(t2b); P22bSize=mat2huff(P22b); Seed22bSize = P22bSize.code;infoSeed22b=whos('Seed22bSize'); bSeed22b=infoSeed22b.bytes;        

HHbands=bSeed22r+bSeed22g+bSeed22b 

AllbandsDetails=HLbands+LHbands+HHbands

 BWr = edge(cAR,'sobel');
 BWg = edge(cAG,'sobel');
 BWb = edge(cAB,'sobel');
figure(5),    subplot(3,1,1);imagesc(squeeze(BWr(:,:)));colormap(gray);  colorbar; axis square;title('Sobel LLRed');
           subplot(3,1,2);imagesc(squeeze(BWg(:,:)));colormap(gray);  colorbar; axis square;title('Sobel LLGreen');
           subplot(3,1,3);imagesc(squeeze(BWb(:,:)));colormap(gray);  colorbar; axis square;title('Sobel LLBlue');
% Mes1=sum(sum(BWr(:,:)))
% Mes2=sum(sum(BWg(:,:)))
% Mes3=sum(sum(BWb(:,:)))

%)Apply the polynomial coding on the RGB frames
[a0R,a1R,a2R]=LinearDrLoayGH(cAR, b, step);
figure(6),    subplot(3,1,1);imagesc(squeeze(a0R(:,:)));colormap(gray);  colorbar; axis square;title('Red image Coff');
           subplot(3,1,2);imagesc(squeeze(a1R(:,:)));colormap(gray);  colorbar; axis square;
           subplot(3,1,3);imagesc(squeeze(a2R(:,:)));colormap(gray);  colorbar; axis square;

 [a0RQuantized,a0RStep,a1RQuantized,a1RStep,a2RQuantized,a2RStep]=ScalrUniformQuantizerCoeff(a0R,a1R,a2R);
 [a0RDeQuantized,a1RDeQuantized,a2RDeQuantized]=ScalrUniformDeQuantizerCoeff(a0RQuantized,a0RStep,a1RQuantized,a1RStep,a2RQuantized,a2RStep);
          
        
 [t1,o1]=rlcGH(a0RQuantized);  Ya0R=uint8(t1);        Ya0RSize=mat2huff(Ya0R);         Xa0RSize = Ya0RSize.code;      infoa0R=whos('Xa0RSize');    bSeeda0R=infoa0R.bytes; 
 [t2,o2]=rlcGH(a1RQuantized);  Ya1R=uint8(t2);        Ya1RSize=mat2huff(Ya1R);         Xa1RSize = Ya1RSize.code;      infoa1R=whos('Xa1RSize');    bSeeda1R=infoa1R.bytes; 
 [t3,o3]=rlcGH(a2RQuantized);  Ya2R=uint8(t3);        Ya2RSize=mat2huff(Ya2R);         Xa2RSize = Ya2RSize.code;      infoa2R=whos('Xa2RSize');    bSeeda2R=infoa2R.bytes; 
 AllRed=bSeeda0R+bSeeda1R+bSeeda2R         


 [R2]=Reconstruct(cAR,b,step,a0RDeQuantized,a1RDeQuantized,a2RDeQuantized);
  RRes=cAR-R2;
[ResQuantizedAR,ResQStepAR]=ScalrUniformQuantizer(RRes);
[ResDeQuantizedAR]=ScalrUniformDeQuantizer(ResQuantizedAR,ResQStepAR);
 [tResr,ores1]=rlcGH(ResQuantizedAR); YResr=uint8(tResr);        YResrSize=mat2huff(YResr);         XResrSize = YResrSize.code;      infoResr=whos('XResrSize');    bSeed22R=infoResr.bytes; 
  RAll=R2+ResDeQuantizedAR;  
  
  GRes=cAG-RAll;
  BRes=cAB-RAll;
 
figure,  subplot(3,1,1);imshow(RRes,[]),title('Residual Red channel')
         subplot(3,1,2);imshow(GRes,[]),title('Residual Green channel')
         subplot(3,1,3);imshow(BRes,[]),title('Residual Blue channel')



 [ResQuantizedAG,ResQStepAG]=ScalrUniformQuantizer(GRes);
 [ResDeQuantizedAG]=ScalrUniformDeQuantizer(ResQuantizedAG,ResQStepAG);

[ResQuantizedAB,ResQStepAB]=ScalrUniformQuantizer(BRes);
[ResDeQuantizedAB]=ScalrUniformDeQuantizer(ResQuantizedAB,ResQStepAB);
% % 
% %  [ta1R,tablea1R]=norm2lzw(uint8(ResQuantizedAR));   bSeed22R=SizeInBytes(uint8(ta1R));
% %  [ta1G,tablea1G]=norm2lzw(uint8(ResQuantizedAG));   bSeed22G=SizeInBytes(uint8(ta1G));
% %  [ta1B,tablea1B]=norm2lzw(uint8(ResQuantizedAB));   bSeed22B=SizeInBytes(uint8(ta1B));
% % 
[tResg,ores2]=rlcGH(ResQuantizedAG);YResg=uint8(tResg);        YResgSize=mat2huff(YResg);         XResgSize = YResgSize.code;      infoResg=whos('XResgSize');    bSeed22G=infoResg.bytes; 
[tResb,ores3]=rlcGH(ResQuantizedAB);YResb=uint8(tResb);        YResbSize=mat2huff(YResb);         XResbSize = YResbSize.code;      infoResb=whos('XResbSize');    bSeed22B=infoResb.bytes; 

% 

 GAll=RAll+ResDeQuantizedAG;
 BAll=RAll+ResDeQuantizedAB;  
 
 im1 = idwt2(RAll, newcHR, newcVR, newcDR);figure, imshow(im1,[]);
 im2 = idwt2(GAll, newcHG, newcVG, newcDG);figure, imshow(im2,[]);
 im3 = idwt2(BAll, newcHB, newcVB, newcDB);figure, imshow(im3,[]);
  Alli(:,:,1)=im1;             Alli(:,:,2)=im2;           Alli(:,:,3)=im3;
 
 
 F=uint8(F); Alli=uint8(Alli);
 
 er2=RMSError(F,Alli)
figure, subplot(2,1,1);imshow(F,[]);title('Original Color image')
        subplot(2,1,2);imshow(Alli,[]);title('Compressed Color image')
% 
% 
  CompressedRed=bSeed22R+ AllRed;           
  CompressedGreen=bSeed22G;   
  CompressedBlue=bSeed22B    
  AllCompressed=CompressedRed+CompressedGreen+CompressedBlue+AllbandsDetails
 
 Original=SizeInBytes(uint8(F));
 CompRatio=Original/AllCompressed
 
