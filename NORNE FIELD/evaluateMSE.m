function [mse] = evaluateMSE(Y,D,R)

no = size(Y,1);
ne = size(Y,2);

if no > 0 && ne >= 1
   e = D - Y;
   mse = 0;
   for j = 1 : ne
     for i = 1 : no
       mse = mse + 0.5 * e(i,j) * e(i,j) / R(i);
     end
   end
   mse = mse / ne;
else
   mse = -1;
end