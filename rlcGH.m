function [tx,op]=rlcGH(in)

close all;
%input by user
%in=input('enter your square matrix containing only 0 & 1:');
[m,n]=size(in);%m-rows n-column

y=0; %initial previous value
tx(1)=0;%tx-trnsmission vector containing runs of 0 & 1
o=1; %o-output vector index

for j=1:m

for k=1:n
x=in(j,k);

if x==y %compare with previous value
tx(o)=tx(o)+1; %count++

else
o=o+1; %next index
tx(o)=1;

end
y=x;
end
end
% display('runs of zeros and ones alternatively are:');
% disp(tx);
% 
% display('this code has been transmitted successfully')
% display('---------------------------------------------------------------');
% 
% display('have you received transmitted code and want to decode it???');
% Z=input('1)yes,2)no:-');

% if Z==1
Z=1;
% decoding...
%here i have consider i/p as square matrix so
m=sqrt(sum(sum(tx)));%squre root of total elements of tx
i=1;%index for output matrix op
enter=0;%entry into matrix
for j=1:m
for k=1:m
if tx(i)==0 %compare runs with zero
enter=abs(enter-1);%change 0 to 1 / 1 to 0
i=i+1; %next index
end
op(j,k)=[enter]; %enter value to op
tx(i)=tx(i)-1; %decremant runs by 1
end
end
% display('received matrix is:');
% disp(op);
end 

% figure, imshow(op,[]);

