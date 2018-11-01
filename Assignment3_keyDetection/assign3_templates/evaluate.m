truth_path=dir('../gtzan_key/gtzan_key/genres/country/*.txt');
audio_path=dir('/Users/onion/Downloads/genres/country/*.au');
blockSize=16384;
hopSize=8192;
%read ground truth
truth=zeros(size(truth_path));
for i=1:length(truth)
    truth(i)=textread(strcat('../gtzan_key/gtzan_key/genres/country/',truth_path(i).name));
end
%compute key
key=zeros(size(truth_path));
for i=1:length(truth)
    key(i)=ComputeKey(strcat('/Users/onion/Downloads/genres/country/',audio_path(i).name),blockSize,hopSize);
end

%acc
acc=sum(key==truth)/length(key)
C = confusionmat(truth,key);

%save data acc C