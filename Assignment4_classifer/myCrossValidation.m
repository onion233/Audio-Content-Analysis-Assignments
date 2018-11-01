function [avg_accuracy, fold_accuracy, conf_mat] = myCrossValidation(data, labels, K, ...
												num_folds,num_classes, enable_shuffling)

%% Implements your n-fold cross validation scheme
% 
% Input:
%   data:               num_features x num_data_points matrix, containing the data features
%   labels:             1 x num_data_points matrix, containing the data labels
%   K:                  int, parameter for the kNN classifier
%   num_folds:          int, parameter for the number of folds for cross validation
% Output:
%   avg_accuracy:       float, average accuracy for the all the folds 
%   fold_accuracies:    1 x num_folds vector, accuracies for the all the n-folds
%   conf_mat:           num_classes x num_classes matrix, cumulative confusion matrix across all n-folds
% Hint: 
%   Here you should first divide your data into n-folds. The ideal of doing that would be to
%   first randomly shuffle datapoints within each class and then divide the data but for this 
%   assignment, it is OK if you don't shuffle the data. You would need to call myKnn() n times
%   and compute the accuracy and confusion mat for each fold. Writing a small function which 
%   takes the predicted labels and actual labels as arguments and returns the accuracy and 
%   confusion mat might be useful. 
if nargin == 4
	num_classes = 5;
	enable_shuffling = true;
end

% initialize
[~, num_data_points] = size(labels);   
avg_accuracy  = 0;
fold_accuracy = zeros(1, num_folds);
conf_mat = zeros(num_classes, num_classes);
gt_labels = sort(unique(labels));
fold = floor(num_data_points/num_folds);

% shuffling matters a lot in this case!
if enable_shuffling
	tmp = randperm(num_data_points);
	data= data(:,tmp);
	labels = labels(:,tmp);
end


%% Add your code here
for i = 1:num_folds
	cur_start = fold*(i-1);
	cur_end   = fold*i;
	
	cur_test_data  = data(:, (cur_start+1):cur_end);
	cur_test_label = labels(:, (cur_start+1):cur_end);
	cur_train_data = [data(:,1:cur_start), data(:,(cur_end+1):end)];
	cur_train_label= [labels(:,1:cur_start), labels(:,(cur_end+1):end)];
	
	prediction = myKnn(cur_test_data, cur_train_data, cur_train_label, K);
    [accu,conf]= calAccuConf(cur_test_label, prediction, gt_labels);
	conf_mat   = conf_mat+conf;
	avg_accuracy = avg_accuracy+accu;
	fold_accuracy(i) = accu;
end
avg_accuracy = avg_accuracy/num_folds;

end

function [accu,conf] =calAccuConf(gt, pre, num_labels)
	num_samples = size(gt,2);
	accu = sum(pre==gt)/num_samples;
	conf = confusionmat(gt, pre, 'order', num_labels);
end

