function [] = mainKMeans(filename, numClusters, numIterations)

%K = 20;
%max_iters = 20;

output = strcat(filename,".kout.",numClusters,".",numIterations);

X = dlmread(filename);

initial_centroids = kMeansInitCentroids(X, K);

[centroids, idx] = runkMeans(X, initial_centroids, max_iters, false);
csvwrite(output,idx);

fprintf('Centroids computed after initial finding of closest centroids: \n')

end