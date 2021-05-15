function [a0DeQuantized,a1DeQuantized,a2DeQuantized]=ScalrUniformDeQuantizerCoeff(a0Quantized,a0Step,a1Quantized,a1Step,a2Quantized,a2Step)

%q=double(q);
a0DeQuantized(:,:)=(a0Quantized(:,:)*a0Step);
a1DeQuantized(:,:)=(a1Quantized(:,:)*a1Step);
a2DeQuantized(:,:)=(a2Quantized(:,:)*a2Step);