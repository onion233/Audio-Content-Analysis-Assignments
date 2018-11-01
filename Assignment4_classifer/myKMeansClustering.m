function [c_labels, centroids] = myKMeansClustering(data, K)

%% Implements a k-means clustering algorithm
% 
% Input:
%   data:           num_features x num_data_points matrix, containing the data features
%   K:              int, parameter for the kNN classifier
% Output:
%   c_labels:       1 x num_data_points vector, containing the cluster label for each of your datapoints
%   centroids:      num_features x K matrix, where each column is one of your cluster centroids

%% Add your code here
[num_features,num_data_points] = size(data);
rind=randi(num_data_points,1,K); % kmeans++ better
centroids = data(:,rind);% randomly init centroids
c_labels = zeros(1,num_data_points); % init class
stop = intmax; % init exit criteria
while stop >= 1e-5
    for i = 1 : num_data_points % for each point, compute the nearst centeriod
        cur_point = data(:,i);
        dist_to_cent=sqrt(sum(abs(centroids-cur_point).^2,1));
        [~,ind]=min(dist_to_cent);
        c_labels(i)=ind;
    end
    new_centroids = zeros(num_features, K);
    for i = 1 : K
        new_centroids(:,i) = mean(data(c_labels == i),2); % update centeriods
    end
    stop = sum(abs(new_centroids - centroids));
    centroids = new_centroids;
end
end