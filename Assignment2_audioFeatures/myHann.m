function [w] = myHann(blockSize)

% w(n)=0.5(1-cos(2pi n /N)), 0<=n<=N, blockSize=N+1
vec=0:blockSize-1;
w=0.5-0.5.*cos(2*pi.*vec'./(blockSize-1));
end