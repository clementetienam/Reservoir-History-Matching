function [f df] = penaltyFunction(x)
%  Authors: H. X. Vo and L. J. Durlorfky
%% 2 facies
f = x' * (1 - x);
if nargout > 1
    df = 1 - 2 * x; % gradient
end
end