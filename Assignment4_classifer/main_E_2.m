clear;clc;
load('data/data.mat')
load('data/labels.mat')


kmeans_acc = zeros(1,10);
for j = 1 : 10
    [c_labels, centroids] = myKMeansClustering(data, 5);
    acc_array = zeros(1,5);
    for i = 1 : 5
        estimate_label = c_labels(labels == i);
        most_likely_class = mode(i - estimate_label);
        acc = sum(estimate_label == (i - most_likely_class))/length(estimate_label);
        acc_array(i) = acc;
    end
    kmeans_acc(j) = mean(acc_array);
end
disp(mean(kmeans_acc))