function XVario_OPCA = generateSetOfOPCARealizations(U, Sig, xm, reducedDim, NVario, gamma, xiMat)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Generate O-PCA realizations using the same set of coefficients as PCA
XVario_OPCA = nan(size(U, 1), NVario);
for j=1:NVario
    xi = xiMat(:, j);
    [xGen2, ~] = generateAnalyticalOPCARealization(U, Sig, reducedDim, xi, xm, gamma);
    XVario_OPCA(:, j) = xGen2;
end

end

