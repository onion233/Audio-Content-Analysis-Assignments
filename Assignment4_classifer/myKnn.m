function [est_class] = myKnn(test_data, train_data, train_label, K)

%% Implements a kNN classifier
% 
% Input:
%   test_data:      num_features x num_test_points matrix, containing the test data features
%   train_data:     num_features x num_train_points matrix, containing the train data features
%   train_label:    1 x num_train_points vector, containing the training labels
%   K:              int, parameter for the kNN classifier
% Output:
%   est_class:      1 x num_test_points vector, containing the predicted labels for the test data points
[~,num_test_points ] = size(test_data);
est_class = zeros(1, num_test_points);
%% Add your code here

dis = pdist2(test_data', train_data');
for i = 1:num_test_points
	cur_dis = dis(i,:); 
	[~,idx] = sort(cur_dis);
	knn_label = train_label(idx(1:K));
	est_class(i) = mode(knn_label);
end

end