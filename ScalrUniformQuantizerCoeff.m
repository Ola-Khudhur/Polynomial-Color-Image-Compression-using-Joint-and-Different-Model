function [a0Quantized,a0Step,a1Quantized,a1Step,a2Quantized,a2Step]=ScalrUniformQuantizerCoeff(a0,a1,a2)

%Enter the Quantization Level 
% Q0level=input('Enter Quantization Level for a0 Coefficients :','s');              q0=str2num(Q0level);
% Mx0=max(a0(:)); Mn0=min(a0(:)); pp0=(Mx0-Mn0); a0Step=(Mx0-Mn0)/(q0-1); a0Quantized(:,:)=round(a0(:,:)/a0Step);
% 
% Q1level=input('Enter Quantization Level for a1 Coefficients :','s');              q1=str2num(Q1level);
% Mx1=max(a1(:)); Mn1=min(a1(:)); pp1=(Mx1-Mn1); a1Step=(Mx1-Mn1)/(q1-1); a1Quantized(:,:)=round(a1(:,:)/a1Step);
% 
% Q2level=input('Enter Quantization Level for a2 Coefficients :','s');              q2=str2num(Q2level);
% Mx2=max(a2(:)); Mn2=min(a2(:)); pp2=(Mx2-Mn2); a2Step=(Mx2-Mn2)/(q2-1); a2Quantized(:,:)=round(a2(:,:)/a2Step);
% 
 Q0level=input('Enter Quantization Level for a0 Coefficients :','s');              q0=str2num(Q0level); a0Quantized(:,:)=round(a0(:,:)/q0);
 Q1level=input('Enter Quantization Level for a1 Coefficients :','s');              q1=str2num(Q1level); a1Quantized(:,:)=round(a1(:,:)/q1);
 Q2level=input('Enter Quantization Level for a2 Coefficients :','s');              q2=str2num(Q2level); a2Quantized(:,:)=round(a2(:,:)/q2);
 
a0Step=q0;
a1Step=q1;
a2Step=q2;
