function x = generateOPCARealization(U, Sig, reducedDim, randVector, xm, gamma)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Optimization tool-box can be downloaded at http://www.di.ens.fr/~mschmidt/Software/minConf.html
%  Add paths where the optimization tool-box is
addpath minConf/
addpath minConf/minConf/
addpath minConf/minFunc/
%  Set up parameters for optimizer
options.Method  = 'lbfgs';
options.maxIter = 400;
options.verbose = 0;
%%  Check gradient by comparing with numerical gradient (Finite Difference)
% x0 = rand(size(U,1), 1);
% [f, df] = OPCAObjFunc(x0, randVector, U, Sig, reducedDim, xm, gamma);
% eps = 1e-5;
% for i=1:length(x0)
%         x1 = x0;
%         x1(i) = x1(i) + eps;
%         f1 = OPCAObjFunc(x1, randVector, U, Sig, reducedDim, xm, gamma);
%         x2 = x0;
%         x2(i) = x2(i) - eps;
%         f2 = OPCAObjFunc(x2, randVector, U, Sig, reducedDim, xm, gamma);
%         numgrad = (f1 - f2) / (2 * eps);
%         fprintf('%f %f\n',  df(i), numgrad);
%         assert(abs(df(i) - numgrad) < eps, 'not matching %f %f\n', df(i), numgrad);
% end
%% Generate realization using optimizer
f   = @(x)OPCAObjFunc(x, randVector, U, Sig, reducedDim, xm, gamma);
x0 = U(:, 1:reducedDim) * diag(Sig(1:reducedDim)) * randVector + xm; % use PCA solution as the initial guess
[x, fval] = minConf_TMP(f, x0, zeros(size(x0)), ones(size(x0)), options); % 2-facies
end