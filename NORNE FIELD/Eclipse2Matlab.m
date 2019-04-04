function B=Eclipse2Matlab(A)
%Reshape from eclipse to matlab
[m,n]=size(A);
for k=1:m*n; % matrix of eclipse data
    y=mod(int32(k)-1,4)+1; % value of i
    x=idivide(int32(k)-1,4) + 1; % value of j
    B(k)=A(x,y); % new matrix in matlab shape
    B=B';

end
end
