function [f, df]= OPCAObjFunc(x, randVector, U, Sig, reducedDim, xm, gamma)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Main term
a = U(:,1:reducedDim) * diag(Sig(1:reducedDim)) * randVector + xm;
fm = (a - x)' * (a - x);
% fprintf('Main term = %f\n', fm); 
dfm = 2 * x - 2 * a; % gradient of the main term
%% Penalty term
[PF dPF] = penaltyFunction(x);
% fprintf('Penalty term = %f\n', PF); 
%% Combined objective function
f = fm + gamma * PF ; % objective function
if nargout>1 
    df = dfm + gamma * dPF; % gradient
% fprintf('L2 Norm of Total Gradient = %f\n', norm(df, 2)); 
end
end