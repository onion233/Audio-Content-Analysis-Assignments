clear;clc;
load('data/data.mat')
load('data/labels.mat')
K = 3;
num_folds = 3;

[num_features, num_data] = size(data);
all_acc = zeros(num_features,1);

for i = 1:num_features
	curFeature = data(i,:);
	[accu,~,~] = myCrossValidation(curFeature, labels, K, num_folds);
	all_acc(i) = accu;
end

[max_accu, i] = max(all_acc);
disp(['max_accu: ', num2str(max_accu)]);
disp(['best feature: ', num2str(i), 'th']);