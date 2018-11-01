function [f0, timeInSec] = myPitchTrackMod1(x, blockSize, hopSize, fs)

%% Blockwise Pitch Tracking based on a modified approach
% Input:
%   x:          (N x 1) float vector, input signal
%   blockSize:  int, block size of the blockwise process
%   hopSize:    int, hop size of the blockwise process
%   fs:         float, sample rate in Hz
% Output:
%   f0:         (numBlocks x 1) float vector, detected pitch (Hz) per block
%   timeInSec:  (numBlocks x 1) float vector, time stamp (sec) of each block

% Check input dimensions 
[~,n] = size(x);
if (n>1)
    error('illegal input signal');
end
[m,n] = size(blockSize);
if (m ~= 1 && n ~=1)
    error('illegal blockSize');
end
[m,n] = size(hopSize);
if (m ~= 1 && n ~=1)
    error('illegal hopSize');
end
[m,n] = size(fs);
if (m ~= 1 && n ~=1)
    error('illegal fs');
end

%% Please write your code here
tempX = x';
b  =  ones(1,20)/20;
% b = [1 1 1 1 1 1 1 1 1 1 1 1]/12;
% for better 1st and 3rd case but worse for 2nd.
dealX = filter(b,1,tempX);
processX = dealX';
% Above for moving average filter.
[processX,cxd,lxd] = wden(x,'sqtwolog','s','one',2,'db3');
% Above for wavelet domain denoising.
[xb,timeInSec] = myBlockAudio(processX, blockSize, hopSize, fs);
f0=zeros(length(timeInSec),1);
for i=1:length(timeInSec)
    tmp=myCompAcf(xb(:,i));
    f0(i)= myGetF0FromMod(tmp,fs);
end


end
