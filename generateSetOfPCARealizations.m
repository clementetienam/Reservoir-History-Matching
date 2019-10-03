function [xiMat, XVario_PCA] = generateSetOfPCARealizations(U, Sig, xm, reducedDim, NVario)
%  Authors: H. X. Vo and L. J. Durlorfky
%%
xiMat = zeros(reducedDim, NVario); % coefficient xi
XVario_PCA = nan(size(U, 1), NVario); % realizations
parfor j=1:NVario
    xi = randn(reducedDim,1);
    xPCA = U(:, 1:reducedDim) * diag(Sig(1:reducedDim)) * xi + xm;
    xiMat(:, j) = xi;
    XVario_PCA(:, j) = xPCA;
end

end

