function [f, df]= OPCAObjFuncBimodal(x, U, Sig, reducedDim, randVector, xm, paraVector)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Main term
a = U(:,1:reducedDim) * diag(Sig(1:reducedDim)) * randVector + xm;
fm = (a - x)' * (a - x);
% fprintf('Main term = %f\n', fm); 
dfm = 2 * x - 2 * a;
%% Regularization term
gamma = paraVector(1);
[PF dPF] = penaltyFunctionBimodal(x, paraVector);
% fprintf('Penalty term = %f\n', gamma * PF); 
%% Combined objective function and it's gradient
f = fm + gamma * PF ;
if nargout>1 
    df = dfm + gamma * dPF; % wrt x
% fprintf('L2 Norm of Total Gradient with Lagrange multiplier = %f\n', norm(df, 2)); 
end

end