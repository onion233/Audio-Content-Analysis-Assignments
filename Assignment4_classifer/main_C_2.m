%%
clear;clc;
load('data/data.mat')
load('data/labels.mat')

%%
K = 3;
num_folds = 3;

[sel_feature_set, accuracy_seq, conf_mat] = myForwardSelection(data,labels,K,num_folds, true);
[~,ind]=max(accuracy_seq)
sel_feature_set(1:ind)