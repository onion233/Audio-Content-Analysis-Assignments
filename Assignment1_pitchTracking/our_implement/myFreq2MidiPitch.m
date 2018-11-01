function  [pitchInMidi] = myFreq2MidiPitch(pitchInHz)

%% Converts fundamental pitch in Hz to pitch in MIDI
% Input:
%   pitchInHz:		(N x 1) float vector, fundamental pitch in Hz
% Output:
%   pitchInMidi:    (Nx 1) float vector, pitch in MIDI

% Check input dimensions 
[~,n] = size(pitchInHz);
if (n>1)
    error('illegal input signal');
end

%% Please write your code here
f_A4 = 440.0;
% pitchInMidi = [];
% for i = 1:length(pitchInHz)
%     pitchInMidi = [pitchInMidi,69+12*log2(pitchInHz(1,i)/f_A4)];
% end

pitchInMidi=12.*log2(pitchInHz./f_A4)+69;

end