function [X_norm] = testNormalize(X,mu,sigma)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

X_norm = bsxfun(@minus, X, mu);

X_norm = bsxfun(@rdivide, X_norm, sigma);

X_norm(isnan(X_norm)) = 0; %this replaces all values of Nan which occurs when a value in X is exactly the average for the feature.

% ============================================================

end
