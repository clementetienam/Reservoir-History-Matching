function [UC, sigma] = firstOrderPolyKernelEigenDecomposition(Xc)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Compute eigenvectors and eigenvalues of covariance matrix using 1st-order polynomial kernel
Nr = size(Xc, 2);

%  Eigen-decomposition of 1st-order kernel matrix K
Kc2 = Xc' * Xc; % 1st-order polynomial kernel matrix K
[UKc2, eValuesOfKc2] = eig(Kc2);
eValuesOfKc2 = diag(eValuesOfKc2);

%  Compute eigenvectors of covariance matrix C
for j=1:Nr,
  if eValuesOfKc2(j) ~= 0,
     UKc2(:, j)= UKc2(:, j) / sqrt(eValuesOfKc2(j)); % normalize eigenvectors of K
  end
end
[eValuesOfKc2, decreasingOrder] = sort(eValuesOfKc2, 'descend'); % sort eigenvelues of K
UKc2 = UKc2(:, decreasingOrder); % put eigenvectors corresponding to decrease order of eigenvalues of K
UC = Xc * UKc2; % based on relationship between eigenvectors of C and K

%  Compute singular values of C based on relationship between eigenvalues of C and K
eValuesOfKc2(eValuesOfKc2 < 0) = 0; % for very small negative numbers due to machine error
sigmaKc2 = sqrt(eValuesOfKc2); % singular value is square root of non-negative eigenvalue 
sigma = sigmaKc2 / sqrt(Nr-1); % based on relationship between eigenvalues of C and K 
end
