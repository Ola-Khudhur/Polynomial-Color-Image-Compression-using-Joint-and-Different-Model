function [YY]=Reconstruct(YBT,b, step,a0,a1,a2)
% This function to create local zero mean image


[M,N]=size(YBT);

m = floor((M)/step);
n = floor((N)/step);

 Xc=(b-1)/2;

 
 for gh=0:b-1
     ZPos(gh+1)=(gh-Xc)/Xc;
%      ZZ(gh)=ZPos(gh)*ZPos(gh);
 end
% Siz=b*b;
 
 Ys=1; Ye=b;
 for j = 1:m
     Xs=1; Xe=b;
   for k = 1:n
    
       for m1=Ys:Ye
           Yy=(m1-Ys)+1;
          
           for n1=Xs:Xe
               Xx=(n1-Xs)+1;
             
                YY(m1,n1)=a0(j,k)+(a1(j,k)*ZPos(Xx))+(a2(j,k)*ZPos(Yy)); 
                t0=(a1(j,k)*ZPos(Xx));
                ff=a1(j,k);
                zz=ZPos(Xx);
                y8=(a2(j,k)*ZPos(Yy));
%                  YY(m1,n1)=a0(j,k)+(a1(j,k)*(n1-Xc))+(a2(j,k)*(m1-Xc));
           end

       end

 Xs=Xs+b;
 Xe=Xe+b;
  end
  Ys=Ys+b;
  Ye=Ye+b;
end


% figure, imshow(YY,[]);title('PREDICTED');


