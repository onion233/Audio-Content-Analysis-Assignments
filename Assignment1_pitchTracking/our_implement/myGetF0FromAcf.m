function [f0] = myGetF0FromAcf(acfVector, fs)

%% Computes the pitch for a block of audio from the ACF vector
% Input:
%   acfVector:  (blockSize x 1) float vector, ACF of a block
%   fs:         float, sampling rate in Hz
% Output:
%   f0:         float, fundamental frequency of the block in Hz  

% check input dimensions
[~, n] = size(acfVector);
if (n>1)
    error('illegal input acfVector');
end
[m,n] = size(fs);
if (m ~= 1 && n ~=1)
    error('illegal fs');
end


%% Please insert your code here
f0=0;
% [~,locs] = findpeaks(acfVector)
% select_max=5;
% len=length(locs);
% 
% dif=diff(locs(2:min(select_max,len-1)));
% period=mean(dif);
% period=period/fs;
% f0=1/period;

diff_vec = diff(acfVector);
t_init = 0;
y_init = 0;
for i = round(fs/2000) : length(diff_vec)
    if diff_vec(i-1) >= 0 && diff_vec(i) < 0
        if acfVector(i) > y_init
            t_init = i;
            y_init = acfVector(i);
        end
    end
end
if t_init==0
    f0=440;
else
f0 = fs/(t_init-1);
end
end