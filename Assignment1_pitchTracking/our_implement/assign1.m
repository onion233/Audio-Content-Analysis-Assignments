fs=44100;
blocksize=1024;
hopsize=512;
f1=441;
f2=882;
t1=0:1/fs:1;
t2=1:1/fs:2;
x1=sin(t1*2*pi*f1)';
x2=sin(t2*2*pi*f2)';
x=[x1;x2];
[f0, timeInSec] = myPitchTrackAcf(x,blocksize,hopsize,fs);
subplot(3,1,1)
plot(f0);
title('myPitchTrackAcf')
%get correct frequency
% correct=[repelem(f1,length(t1)) repelem(f2,length(t2)) ]';
% [correct, ~] = myBlockAudio(correct, blocksize, hopsize, 1);
% correct=median(correct,1)';
len=length(f0);
correct=[repelem(f1,floor(len/2)) repelem(f2,len-floor(len/2)) ]';
subplot(3,1,2)
plot(correct)
title('Ground truth')
subplot(3,1,3)

plot(abs(f0-correct));
title('error per time stamp')
error=sum((abs(f0-correct))./correct)/len
