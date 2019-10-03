function x = generateOPCARealizationBimodal(U, Sig, reducedDim, randVector, xm, paraVector, xLB, xUB)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Optimization tool-box can be downloaded at http://www.di.ens.fr/~mschmidt/Software/minConf.html
%  Add paths where the optimization tool-box is
% addpath minConf/
% addpath minConf/minConf/
% addpath minConf/minFunc/

%addpath(genpath('C:\Work\GSLIB\sgsim\minConf\minConf'))
addpath(genpath('C:\Work\GSLIB\sgsim\PhD Petroleum Engineering\SPE 10\Multiple Data assimilation\minConf'))
addpath(genpath('C:\Work\GSLIB\sgsim\PhD Petroleum Engineering\SPE 10\Multiple Data assimilation\minFunc'))
%  Set up parameters for optimizer
options.Method  = 'lbfgs';
options.maxIter = 400;
options.verbose = 0;
%% Check derivative by comparing with numerical derivative (Finite Difference)
% x0 = rand(size(U,1),1);
% [f, df] = OPCAObjFuncBimodal(x0, U, Sig, reducedDim, randVector, xm, paraVector);
% eps = 1e-5;
% for i=1:length(x0)    
%         x1 = x0;
%         x1(i) = x1(i) + eps;
%         f1 = OPCAObjFuncBimodal(x1, U, Sig, reducedDim, randVector, xm, paraVector);
%         x2 = x0;
%         x2(i) = x2(i) - eps;
%         f2 = OPCAObjFuncBimodal(x2, U, Sig, reducedDim, randVector, xm, paraVector);
%         numgrad = (f1 - f2) / (2 * eps);
%         fprintf('%f %f\n',  df(i), numgrad);
%         assert(abs(df(i) - numgrad) < eps, 'not matching %f %f\n', df(i), numgrad);
% end
%% Generate bimodal realization using optimizer
f   = @(x)OPCAObjFuncBimodal(x, U, Sig, reducedDim, randVector, xm, paraVector);
x0 = U(:, 1:reducedDim) * diag(Sig(1:reducedDim)) * randVector + xm; % initial guess is PCA solution
[x, ~] = minConf_TMP(f, x0, xLB * ones(size(x0)), xUB * ones(size(x0)), options); % finding solution for bimodal
end