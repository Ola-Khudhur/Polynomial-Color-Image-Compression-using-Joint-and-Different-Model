function [a0,a1,a2]=LinearDrLoayGH(Y, b, step)
% This function to perform Nonlinear Polynomial coding

[M,N]=size(Y);

m = floor((M)/step);
n = floor((N)/step);

Xc=(b-1)/2;
S2=0; 

for gh=0:b-1
    ZPos(gh+1)=(gh-Xc)/Xc;
    ZZ(gh+1)=ZPos(gh+1)*ZPos(gh+1);
    S2=S2+ZZ(gh+1);
    
end

 S2=S2*b;
 Siz=b*b;
  
 Ys=1; Ye=b;
 for j = 1:m
     Xs=1; Xe=b;
   for k = 1:n
     Sm=0;SmX=0; SmY=0;SmXY=0;SmXX=0; SmYY=0;
      
       for m1=Ys:Ye
          Yy=(m1-Ys)+1;
          smm=0; smmX=0;
           for n1=Xs:Xe
              Xx=(n1-Xs)+1;
              
               YY(m1,n1)=Y(m1,n1);
 
              smm=smm+Y(m1,n1);%b1
              smmX=smmX+ZPos(Xx)*Y(m1,n1);

           end
          Sm=Sm+smm;
          SmX=SmX+smmX;
          SmY=SmY+smm*ZPos(Yy);
       end
       
 a0(j,k)=Sm/Siz;
 a1(j,k)=SmX/S2;
 a2(j,k)=SmY/S2;

 Xs=Xs+b;
 Xe=Xe+b;
  end
  Ys=Ys+b;
  Ye=Ye+b;
end


%  figure, imshow(YY,[]);title('GHADDDDDDDDDDDDDDDDDDA')