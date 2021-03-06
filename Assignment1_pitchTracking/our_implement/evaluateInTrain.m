% [onset_seconds1,~, pitch_frequency1,~] = textread('../trainData/trainData/01-D_AMairena.f0.Corrected.txt','%f %f %f %f'); 
% [y1, fs] = audioread('../trainData/trainData/01-D_AMairena.wav');
% [xb, timeInSec] = myBlockAudio(y1, 1024, 512, fs);
% % [r] = myCompAcf (xb(:,10), true);
% % myGetF0FromAcf(r, fs)
% % 
% estimation1 = myPitchTrackAcf(y1, 1024, 512, fs);
% rms1 = myEvaluation(estimation1, pitch_frequency1);
% % plot(estimation1,'r');
% % hold on 
% % plot(pitch_frequency1,'b');
% % hold off 
% [onset_seconds2, ~, pitch_frequency2, ~] = textread('../trainData/trainData/24-M1_AMairena-Martinete.f0.Corrected.txt','%f %f %f %f'); 
% [y2, fs] = audioread('../trainData/trainData/24-M1_AMairena-Martinete.wav');
% estimation2 = myPitchTrackAcf(y2, 1024, 512, fs);
% rms2 = myEvaluation(estimation2, pitch_frequency2);
% % [xb, timeInSec] = myBlockAudio(y2, 1024, 512, fs);
% % [r] = myCompAcf (xb(:,1), true);
% % myGetF0FromAcf(r, fs)
% % plot(r)
% [onset_seconds3, ~, pitch_frequency3, ~] = textread('../trainData/trainData/63-M2_AMairena.f0.Corrected.txt','%f %f %f %f'); 
% [y3, fs] = audioread('../trainData/trainData/63-M2_AMairena.wav');
% estimation3 = myPitchTrackAcf(y3, 1024, 512, fs);
% rms3 = myEvaluation(estimation3, pitch_frequency3);
% 
% rms1
% rms2
% rms3


[onset_seconds1,~, pitch_frequency1,~] = textread('../trainData/trainData/01-D_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[y1, fs] = audioread('../trainData/trainData/01-D_AMairena.wav');
[xb, timeInSec] = myBlockAudio(y1, 1024, 512, fs);


estimation1 = myPitchTrackMod(y1, 1024, 512, fs);
rms11 = myEvaluation(estimation1, pitch_frequency1)

[onset_seconds2, ~, pitch_frequency2, ~] = textread('../trainData/trainData/24-M1_AMairena-Martinete.f0.Corrected.txt','%f %f %f %f'); 
[y2, fs] = audioread('../trainData/trainData/24-M1_AMairena-Martinete.wav');
estimation2 = myPitchTrackMod(y2, 1024, 512, fs);
rms22 = myEvaluation(estimation2, pitch_frequency2)

[onset_seconds3, ~, pitch_frequency3, ~] = textread('../trainData/trainData/63-M2_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[y3, fs] = audioread('../trainData/trainData/63-M2_AMairena.wav');
estimation3 = myPitchTrackMod(y3, 1024, 512, fs);
rms33 = myEvaluation(estimation3, pitch_frequency3)

[onset_seconds1,~, pitch_frequency1,~] = textread('../trainData/trainData/01-D_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[y1, fs] = audioread('../trainData/trainData/01-D_AMairena.wav');
[xb, timeInSec] = myBlockAudio(y1, 1024, 512, fs);


estimation1 = myPitchTrackMod1(y1, 1024, 512, fs);
rms11 = myEvaluation(estimation1, pitch_frequency1)

[onset_seconds2, ~, pitch_frequency2, ~] = textread('../trainData/trainData/24-M1_AMairena-Martinete.f0.Corrected.txt','%f %f %f %f'); 
[y2, fs] = audioread('../trainData/trainData/24-M1_AMairena-Martinete.wav');
estimation2 = myPitchTrackMod1(y2, 1024, 512, fs);
rms22 = myEvaluation(estimation2, pitch_frequency2)

[onset_seconds3, ~, pitch_frequency3, ~] = textread('../trainData/trainData/63-M2_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[y3, fs] = audioread('../trainData/trainData/63-M2_AMairena.wav');
estimation3 = myPitchTrackMod1(y3, 1024, 512, fs);
rms33 = myEvaluation(estimation3, pitch_frequency3)