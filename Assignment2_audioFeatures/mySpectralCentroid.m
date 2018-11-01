function [specCentroid] = mySpectralCentroid(xb, fs)

%% Audio Feature: Spectral Centroid
% This function extracts the spectral centroid for each block of audio
% in the input matrix xb.
% input: 
%   xb:     (blockSize x numBlocks) float matrix, where numBlocks is 
%           the number of blocks
% output: 
%   specCentroid:(1 x numBlocks) float array, the resulting feature value per block

%% Write your code below:
[blockSize, numBlocks] = size(xb);
window = repmat(myHann(blockSize),1,numBlocks);
xb = xb.*window;
fft_xb = abs(fft(xb));
fft_xb = fft_xb((1:blockSize/2),:);
specCentroid = ((0:blockSize/2-1)*fft_xb)./sum(fft_xb,1);
specCentroid(sum(fft_xb, 1) == 0) = 0;
specCentroid = specCentroid / size(fft_xb,1) * fs / 2;


end