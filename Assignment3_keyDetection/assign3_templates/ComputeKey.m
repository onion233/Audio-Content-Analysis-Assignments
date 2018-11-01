function [cKey] = ComputeKey(cAudioFilePath,blockSize,hopSize)

% Input:
%   Please use relative path here to import audio file
% Output:
%   cKey: int, correspond to the labels in KeyEnumeration.txt (in ref2 Github)
%% Please write your code here
t_pc = [6.35 2.23 3.48 2.33 4.38 4.09 2.52 5.19 2.39 3.66 2.29 2.88 %major
    6.33 2.68 3.52 5.38 2.60 3.53 2.54 4.75 3.98 2.69 3.34 3.17]; % minor

major_temp=t_pc(1,1:12);
major_temp=major_temp/sum(major_temp);
minor_temp=t_pc(2,1:12);
minor_temp=minor_temp/sum(minor_temp);

[y,fs]=audioread(cAudioFilePath);

% window=myHann(blockSize);

% 
[fft_xb,~,~] = spectrogram( y,myHann(blockSize), blockSize-hopSize,blockSize,fs);

% magnitude spectrum
fft_xb  = abs(fft_xb);
    
    
v_pc = FeatureSpectralPitchChroma(fft_xb, fs);
v_pc = mean(v_pc,2);
% size(v_pc)
% distance
distance_major = zeros(1,12);
distance_minor = zeros(1,12);
for i = 1:12
    distance_major(i) = sum(abs(v_pc'-circshift(major_temp,i-1)));
    distance_minor(i) = sum(abs(v_pc'-circshift(minor_temp,i-1)));
end
% distance_major
% distance_minor

[major_d,major_ind] = min(distance_major);
[minor_d,minor_ind] = min(distance_minor);

if (major_d <minor_d)
    cKey= mod(major_ind+2,12); %change to data set label format

else
    cKey= mod(minor_ind+2,12)+12;

end    
end