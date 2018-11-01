function [vpc] = FeatureSpectralPitchChroma(X, f_s)
% brief computes the pitch chroma from the magnitude spectrum
% Input 
%   X:  FFTLength x Observations, spectrogram 
%   f_s: float, sample rate of audio data 
%
% There are multiple ways to implement pitch chroma. 
% As long as your implementation is reasonable, you will get full scores.

% allocate memory
[FFTLength, Observations]=size(X);
vpc = zeros(12, size(X,2));
%% Please write your code here.
f_C4=261.63;
octave_range=4;
freq_mask=zeros(12,FFTLength);
%distance between two pitch: f1/f2=2^(N/12), N measures the number of
%semitone between

% look into one semitone range 
lower_bound=2^(-1/24);
upper_bound=2^(1/24);
for i=1:12
    %convert to fft frequent scale.
    l_bound_in_fft=lower_bound*f_C4*2*(FFTLength-1)/f_s;  %fft is cropped  at nyquist frequency
    u_bound_in_fft=upper_bound*f_C4*2*(FFTLength-1)/f_s;
    for j = 1:octave_range
       upper= round(2^(j-1)*u_bound_in_fft);
       lower= round(2^(j-1)*l_bound_in_fft);
       freq_mask(i,lower:upper)= 1/(upper+1-lower);
    end
    %find next semitone;
    f_C4  = f_C4*2^(1/12);

end
vpc=freq_mask * X.^2; % generate pitch chroma
vpc=vpc./sum(vpc); % normalize


end