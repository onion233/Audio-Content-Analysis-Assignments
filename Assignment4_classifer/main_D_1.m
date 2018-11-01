%%
clear;clc;
load('data/data.mat')
load('data/labels.mat')

%%
K = [1,3,7];
num_folds = 10;
sel_feature_set = [9 10 8 3 7 1 6 2 4];

for i = 1:3
	k = K(i);
	[accu,~,conf_mat] = myCrossValidation(data,labels,k,num_folds);
    disp(['K = ', num2str(k,4)]);
	disp(['accu: ', num2str(accu,4)]);
	disp(['confmat: ']);
    disp(conf_mat);
end