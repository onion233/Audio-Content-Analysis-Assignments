function [r] = myCompAcf (inputVector, bIsNormalized)

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


% normalize result
if (bIsNormalized)
    %% Please inset your normalization code here
    
end

end