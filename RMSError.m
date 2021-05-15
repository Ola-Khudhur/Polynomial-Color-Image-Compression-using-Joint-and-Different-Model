function RMSE=RMSError(original,estimated)
% This function compute the RMSE between the originaland the reconstructed 

% %compute measures using rule 1
% 
%  D=original(:)-estimated(:);
% %  e=sum(D.*D)  ;%/length(D)
% %  RMSELena=sum(original(:).^2);
% %  RR=sqrt(RMSEL
% %  RMSE=sqrt(e)
% 
% RSDiff=sqrt(sum(D.*D));
% RSLena=sqrt(sum(original(:).*original(:)));
% RMSE=RSDiff/RSLena
% 
% %  e=sum(D.*D)  ;%/length(D)
% %  RMSELena=sum(original(:).^2);
% %  RR=sqrt(RMSEL
% %  RMSE=sqrt(e)

%compute measures using rule 1
% %this function to compute normalize root mean square error NRMSE
D=original(:)-estimated(:);
RSDiff=sqrt(sum(D.*D));
RSLena=sqrt(sum(original(:).*original(:)));
NRMSE=RSDiff/RSLena




% % % % % % % % % % % % %  
% D=original(:)-estimated(:);
% %this function to compute  mean square error MSE
MSEpart1=sum(D.*D);
MSE=MSEpart1/(256*256)
% 
% %%this function to compute root mean square error RMSE
RMSE=sqrt(MSE)
% 
% % this function to compute mean signal to noise ratio MSNR
% K=sum(original(:).*original(:));
% MSNR=(K/MSE);
% 
% %this function to compute normalize root mean square error NRMSE
% RSDiff=sqrt(sum(D.*D));
% RSL=sqrt(sum(original(:).*original(:)));
% NRMSE=RSDiff/RSL;
% 
% %this function to compute PSNR
pp=255*255;
PSNR=10*log10(pp/MSE)
 