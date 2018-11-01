function [featureMatrix] = getMetaData(path, blockSize, hopSize)

%% Iterates over all files in a folder, computes the aggregated features
% for each file and returns a feature matrix for all files.
%
% Inputs:
%   path:       string, path to directory that contains only audio files, for which
%               features are to be extracted
%   blockSize:  integer, blockSize to be used for blocking of audio files
%   hopSize:    integet, hopSize to be used for blocking of audio files
%
% Outputs:
%   featureMatrix:  f x N float matrix, where f is the number of features (10 in this case)
%                   and N is the number of audio files in the directory.

% Write your code below
file_list = dir(path);
featureMatrix = zeros(10, length(file_list)-2);
for i = 3 : length(file_list)-2
     fullpath = strcat(path,'/',file_list(i).name);
     [x,fs] = audioread(fullpath);
     features = extractFeatures(x, blockSize, hopSize, fs);
     aggreated = aggregateFeaturesPerFile(features);
     featureMatrix(:,i) = aggreated;
end


end