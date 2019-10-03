function XVario_OPCA = generateSetOfOPCARealizationsBimodal(U, Sig, xm, reducedDim, NVario, paraVector, logkMin, logkMax, xiMat)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Generate O-PCA bimodal realizations using the same set of coefficients as PCA
XVario_OPCA = nan(size(U, 1), NVario);
parfor j=1:NVario
    xi = xiMat(:, j); % using the same set of coefficient as PCA
    xGen2 = generateOPCARealizationBimodal(U, Sig, reducedDim, xi, xm, paraVector, logkMin, logkMax);
    XVario_OPCA(:, j) = xGen2;
end

end