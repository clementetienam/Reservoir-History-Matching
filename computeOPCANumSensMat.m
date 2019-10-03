function SNum = computeOPCANumSensMat(U, Sig, reducedDim, randVector, xm, gamma)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Compute dx/dxi using finite difference
deltaXi = 1e-6;
SNum = zeros(length(xm), length(randVector)); % Nc x l dimensions; SNum = dx/dxi
for j=1:length(randVector)
    randVector1 = randVector;
    randVector1(j) = randVector(j) + deltaXi; % perturb each component of xi
    [xReconNew1, ~] = generateAnalyticalOPCARealization(U, Sig, reducedDim, randVector1, xm, gamma);
    
    randVector2 = randVector;
    randVector2(j) = randVector(j) - deltaXi; % perturb each component of xi
    [xReconNew2, ~] = generateAnalyticalOPCARealization(U, Sig, reducedDim, randVector2, xm, gamma);
    SNum(:, j) = (xReconNew1 - xReconNew2) / (2 * deltaXi); % columth "j" of dx/dxi
end
end
