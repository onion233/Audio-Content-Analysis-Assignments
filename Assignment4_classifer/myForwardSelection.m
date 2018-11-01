function [sel_feature_set, accuracy_seq, conf_mat] = myForwardSelection(data, labels, K, num_folds, req_plot, num_classes) 

%% Implements your forward selection procedure
% 
% Input:
%   data:               num_features x num_data_points matrix, containing the data features
%   labels:             1 x num_data_points matrix, containing the data labels
%   K:                  int, parameter for the kNN classifier
%   num_folds:          int, parameter for the number of folds for cross validation
%   req_plot:           bool, plots the best accuracy v/s iteration number if TRUE, no plots if FALSE
% Output:
%   sel_feature_set:    1 x num_features vector, containing the indices of the selected features 
%   accuracy_seq:       1 x num_features vector, containing the accuracies at each feature selection step
%   conf_mat:           num_classes x num_classes matrix, confusion matrix for the final selected feature set           
% Hint:
%   Here, at iteration of the feature selection process, you need to  run a cross-validation with 
%   num_folds. Use the average accuracy to determine which feature to select. Ideally you should stop
%   the iteration process when the accuracy drops below a certain threshold compared to previous 
%   iteration. But to keep things simple, we ask you to perform iterations till you all exhaust all
%   available features here.           
[num_features, ~] =size(data);
if nargin == 5
	num_classes = 5;
end

sel_feature_set = [];
accuracy_seq = zeros(1,num_features);
conf_mat = zeros(num_classes, num_classes);

%% Add your code here
for times = 1:num_features
	cur_acc = zeros(1,10);
	conf_all= cell (1,10);
	for i = 1:num_features
		if ~any(sel_feature_set==i)
			cur_featureset = [sel_feature_set,i];
			curFeature = data(cur_featureset,:);
			[accu,~,conf_mat] = myCrossValidation(curFeature, labels, K, num_folds);
			cur_acc(i) = accu;
			conf_all{i}= conf_mat;
		else
			cur_acc(i) = 0;
			conf_all{i}= [0];
		end
	end
	[max_seq,ind]  = max(cur_acc);
	accuracy_seq(times)= max_seq;
	sel_feature_set = [sel_feature_set, ind];
end
[~,ind]=max(accuracy_seq);
conf_mat = conf_all{ind};
if req_plot
	plot(accuracy_seq,'-k')	
end

end