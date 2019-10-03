function [f df] = penaltyFunctionBimodal(x, paraVector)
%  Authors: H. X. Vo and L. J. Durlorfky
%%
V1 = paraVector(2);
V2 = paraVector(3);
mu1 = paraVector(4);
mu2 = paraVector(5);

f = sum(1 - (1/sqrt(2 * pi * V1) * exp( - (x - mu1).^2 / (2 * V1)) + ...
    1/sqrt(2 * pi * V2) * exp( - (x - mu2).^2 / (2*V2))));
if nargout>1
    df = 1/sqrt(2 * pi * V1) * (x - mu1) / V1 .* (exp( - (x - mu1).^2 / (2 * V1))) + ...
        1/sqrt(2 * pi * V2) * (x - mu2) / V2 .* (exp( - (x-mu2).^2 / (2 * V2)));
end
end