function [f0, timeInSec] = myPitchTrackMod(x, blockSize, hopSize, fs)

%% Blockwise Pitch Tracking based on ACF
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

%% Design a bandpass filter that filters out between 20 to 20 000 Hz
% n = 20;
% beginFreq = 20 / (fs/2);
% endFreq = 20000 / (fs/2);
% [b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
% x= filter(b, a, x);
% Filter type
% filtertype = 'FIR';
% % Filter Order
% N = 20;
% % Passband frequency
% Fpass = 20;
% % Stopband frequency
% Fstop = 20000;
% % Ripple Factor and Attenuation in stop band
% Rp = 0.5;
% Astop = 50;
% 
% % Design the filter using dsp.LowpassFilter
% LPF = dsp.LowpassFilter('SampleRate',fs,...
%                         'FilterType',filtertype,...
%                         'PassbandFrequency',Fpass,...
%                         'StopbandFrequency',Fstop,...
%                         'PassbandRipple',Rp,...
%                         'StopbandAttenuation',Astop);
% x= step(LPF,x);
%% Please write your code here. Follow the steps as per the comments
% first block the audio and get the time-stamps per block (myBlockAudio)
[xb,timeInSec] = myBlockAudio(x, blockSize, hopSize, fs);
% % compute the ACF for each block (myCompAcf)
% [r] = myCompAcf(xb);
% % compute the pitch in Hz for each block (myGetF0FromACF)
% [f0] = myGetF0FromAcf(r,fs);
f0=zeros(length(timeInSec),1);
for i=1:length(timeInSec)
    tmp=myCompAcf(xb(:,i));
    f0(i)= myGetF0FromMod(tmp,fs);
end
end