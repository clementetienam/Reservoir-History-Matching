function[output,outputporo] = honour2(rossmary, rossmaryporo,N,sgsim2,DupdateK);
% honour the well permeability and porosity values

% read true permeability well value
unie=reshape(rossmary,46,112,22);
unieporo=reshape(rossmaryporo,46,112,22);

% read true porosity well values

for j=1:22;
    aa(j)=unie(10,32,j);
    bb(j)=unie(14,28,j);
   cc(j)=unie(19,38,j);
    dd(j)=unie(26,44,j);
    ee(j)=unie(12,72,j);
    ff(j)=unie(23,15,j);
    gg(j)=unie(14,34,j);
    hh(j)=unie(9,13,j);
    ii(j)=unie(12,85,j);
    jj(j)=unie(9,37,j);
    kk(j)=unie(18,68,j);
    ll(j)=unie(18,83,j);
    mm(j)=unie(13,67,j);
    nn(j)=unie(38,98,j);
    oo(j)=unie(19,54,j);
    pp(j)=unie(6,57,j);
    qq(j)=unie(7,64,j);
    rr(j)=unie(36,68,j);
    ss(j)=unie(16,66,j);
    tt(j)=unie(25,37,j);
    uu(j)=unie(10,29,j);
    aaa(j)=unie(15,74,j);
    bbb(j)=unie(13,67,j);
    ccc(j)=unie(19,54,j);
    eee(j)=unie(10,24,j);
    fff(j)=unie(11,38,j);
    ggg(j)=unie(11,35,j);
    hhh(j)=unie(15,21,j);
    iii(j)=unie(22,22,j);
end

for j=1:22;
    aa1(j)=unieporo(10,32,j);
    bb1(j)=unieporo(14,28,j);
   cc1(j)=unieporo(19,38,j);
    dd1(j)=unieporo(26,44,j);
    ee1(j)=unieporo(12,72,j);
    ff1(j)=unieporo(23,15,j);
    gg1(j)=unieporo(14,34,j);
    hh1(j)=unieporo(9,13,j);
    ii1(j)=unieporo(12,85,j);
    jj1(j)=unieporo(9,37,j);
    kk1(j)=unieporo(18,68,j);
    ll1(j)=unieporo(18,83,j);
    mm1(j)=unieporo(13,67,j);
    nn1(j)=unieporo(38,98,j);
    oo1(j)=unieporo(19,54,j);
    pp1(j)=unieporo(6,57,j);
    qq1(j)=unieporo(7,64,j);
    rr1(j)=unieporo(36,68,j);
    ss1(j)=unieporo(16,66,j);
    tt1(j)=unieporo(25,37,j);
    uu1(j)=unieporo(10,29,j);
    aaa1(j)=unieporo(15,74,j);
    bbb1(j)=unieporo(13,67,j);
    ccc1(j)=unieporo(19,54,j);
    eee1(j)=unieporo(10,24,j);
    fff1(j)=unieporo(11,38,j);
    ggg1(j)=unieporo(11,35,j);
    hhh1(j)=unieporo(15,21,j);
    iii1(j)=unieporo(22,22,j);
    
end

% read permeability ensemble after EnKF update
B=reshape(DupdateK,113344,N);
C=reshape(sgsim2,113344,N);

% start the conditioning for permeabilityX
for i=1:N;
    %B=reshape(A(:,i),120,60,10);
    A = reshape(B(:,i),46,112,22); 
    %clement=B(i);
    for j=1:22;
    A(10,32,j)=aa(j);
    A(14,28,j)=bb(j);
    A(19,38,j)=cc(j);
    A(26,44,j)=dd(j);
    A(12,72,j)=ee(j);
    A(23,15,j)=ff(j);
    A(14,34,j)=gg(j);
    A(9,13,j)=hh(j);
    A(12,85,j)=ii(j);
    A(9,37,j)=jj(j);
    A(18,68,j)=kk(j);
    A(18,83,j)=ll(j);
    A(13,67,j)=mm(j);
    A(38,98,j)=nn(j);
    A(19,54,j)=oo(j);
    A(6,57,j)=pp(j);
    A(7,64,j)=qq(j);
    A(36,68,j)=rr(j);
    A(16,66,j)=ss(j);
    A(25,37,j)=tt(j);
    A(10,29,j)=uu(j);
    A(15,74,j)=aaa(j);
    A(13,67,j)=bbb(j);
    A(19,54,j)=ccc(j);
    A(10,24,j)=eee(j);
    A(11,38,j)=fff(j);
    A(11,35,j)=ggg(j);
    A(15,21,j)=hhh(j);
    A(22,22,j)=iii(j);
    
    end
    output(:,i)=reshape(A,113344,1); 
    %Aa=reshape(B(i),72000,1);
end


for i=1:N;
    %B=reshape(A(:,i),120,60,10);
    D = reshape(C(:,i),46,112,22); 
    %clement=B(i);
    for j=1:22;
    D(10,32,j)=aa1(j);
    D(14,28,j)=bb1(j);
    D(19,38,j)=cc1(j);
    D(26,44,j)=dd1(j);
    D(12,72,j)=ee1(j);
    D(23,15,j)=ff1(j);
    D(14,34,j)=gg1(j);
    D(9,13,j)=hh1(j);
    D(12,85,j)=ii1(j);
    D(9,37,j)=jj1(j);
    D(18,68,j)=kk1(j);
    D(18,83,j)=ll1(j);
    D(13,67,j)=mm1(j);
    D(38,98,j)=nn1(j);
    D(19,54,j)=oo1(j);
    D(6,57,j)=pp1(j);
    D(7,64,j)=qq1(j);
    D(36,68,j)=rr1(j);
    D(16,66,j)=ss1(j);
    D(25,37,j)=tt1(j);
    D(10,29,j)=uu1(j);
    D(15,74,j)=aaa1(j);
    D(13,67,j)=bbb1(j);
    D(19,54,j)=ccc1(j);
    D(10,24,j)=eee1(j);
    D(11,38,j)=fff1(j);
    D(11,35,j)=ggg1(j);
    D(15,21,j)=hhh1(j);
    D(22,22,j)=iii1(j);
    
    
    end
    outputporo(:,i)=reshape(D,113344,1); 
    %Aa=reshape(B(i),72000,1);
end% 


end