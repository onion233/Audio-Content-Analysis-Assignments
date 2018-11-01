function [errCentRms] = myEvaluation(estimation, annotation)

%% Evaluates the performance of a pitch tracker
% Input:
%   estimation: (numBlocks x 1) float vector, estimated pitch (Hz) per block   
%   annotation: (numBlocks x 1) float vector, annotated pitch (Hz) per block
% Output:
%   errCentRms: float, rms of the difference between estInMidi and annInMidi 
% Note: 
%   1) please exclude the blocks when ann(i) == 0

[m1,n1] = size(estimation);
if (n1>1)
    error('illegal estimation vector ');
end
[m2,n2] = size(annotation);
if (n2>1)
    error('illegal annotation vector');
end
if (m1~=m2)
   error('size of estimation and annotation do not match'); 
end

%% Please write your code here, Follow the steps as per the comments
% realestimation = [];
% realannotation = [];
% for i = 1:length(annotation)
%     if (annotation(1,i) ~= 0)
%         realestimation = [realestimation,estimation(1,i)];
%         realannotation = [realannotation,annotation(1,i)];
%     end
% end
% estiMidi = myFreq2MidiPitch(realestimation);
% annoMidi = myFreq2MidiPitch(realannotation);
% sumSquare = 0;
% for j = 1:length(estiMidi)
%     sumSquare = sumSquare + (annoMidi(1,j)-estiMidi(1,j))^2;
% end
% errCentRms = sqrt(sumSquare/length(estMidi));
%get rid of zeros
tmp_estimation = estimation(annotation~=0);
tmp_annotation=annotation(annotation~=0);
estimation_in_MIDI=myFreq2MidiPitch(tmp_estimation);
annotation_in_MIDI=myFreq2MidiPitch(tmp_annotation);

Square=estimation_in_MIDI-annotation_in_MIDI;
rms=sqrt( sum(Square.^2)/length(Square) );
errCentRms=rms*100;
end