function [pct, k] = determineK(S,pctvarianceretained)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(S);

totalsum = sum(sum(S));
k=0;
pct=0;
for i = 1:m
    partialsum = sum(sum(S(1:i,1:i)));
    partialpct = partialsum/totalsum;
    k=i;
    if (partialpct >= pctvarianceretained)
        pct = partialpct;
        return;
    endif
endfor








% =========================================================================

end
