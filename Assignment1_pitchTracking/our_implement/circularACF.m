function [r] = circularACF (inputVector, bIsNormalized)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

%% Computes the ACF of an input with optional normalization
% Input:
%   inputVector:	(N x 1) float vector, block of audio
%   bIsNormalized: 	bool variable for normalization of ACF 
% Output:
%   r:				(N x 1) float vector, ACF of the inputVector

% set uninitialized input arguments
if (nargin < 2)
    bIsNormalized = true;
end
% check input dimension
[m,n] = size(inputVector);
if ((m<=1 && n<=1) || (m>1 && n>1))
    error('illegal input vector');
end

%% Please insert your ACF computation code here
dou=[inputVector; inputVector];
len=length(inputVector);
r=zeros(length(inputVector),1);
for i=1:length(inputVector)
    r(i)=dot(inputVector(i:i+len),inputVector(1:end));
end
% normalize result
if (bIsNormalized)
    %% Please inset your normalization code here
    nor=norm(inputVector,2);
    r=r/(nor^2);
end


end

