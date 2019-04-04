function [mumyperm,mumyporo,mumyfault]=main_ESMDA_Localization(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective); 
disp(' Author: Clement Etienam-PhD Visiting researcher,University of Manchester,July,2018')
disp('Supervisor: Profesor Colin Macbeth')
% N - size of ensemble
sgsim=reshape(perm,nx*ny*nz,N);
sgsimporo=reshape(poro,nx*ny*nz,N);
sgsim=sgsim.*repmat(effective,1,N);
sgsimporo=sgsimporo.*repmat(effective,1,N);
indices=find(effective);
for i=1:N
    a=sgsim(:,i);
 sgactual(:,i)=a(indices);
end
for i=1:N
    a=sgsimporo(:,i);
 sgporoactual(:,i)=a(indices);
end


Sim11=reshape(overallsim,79,history,N);
%History matching using ESMDA
for i=1:history
 fprintf('Now assimilating timestep %d .\n', i);

Sim1=Sim11(:,i,:);
Sim1=reshape(Sim1,79,N);

f=observation(:,i);
[DupdateK,sgsimporosity,faultout] = ESMDA_Localization2 (sgactual,sgporoactual,faulten,f, N, Sim1,alpha,tol,indices,5);

sgactual=DupdateK;
sgporoactual=sgsimporosity;
faulten=faultout;
 fprintf('Finished assimilating timestep %d \n', i);
end
disp('recover the full permeability and porosity field')
%DupdateK=abs(DupdateK);
%DupdateK(DupdateK>=3996.5)=3996.5;
DupdateK(DupdateK<=0.6550)=0.6550;

%sgsimporosity=abs(sgsimporosity);
%sgsimporosity(sgsimporosity>=0.3473)=0.3473;
sgsimporosity(sgsimporosity<=0.1345)=0.1345;

faultout=(faulten);
%faultout=abs(faultout);
faultout(faultout<=0.000036182)=0.000036182;


DupdateK2=ones(nx*ny*nz,N);
bb=ones(nx*ny*nz,1);
for ii=1:N
    
    aperm=DupdateK(:,ii);
   bb(indices)=aperm;
 DupdateK2(:,ii)=bb;

end

DupdateK2poro=ones(nx*ny*nz,N);
bbporo=ones(nx*ny*nz,1);
for ii=1:N
    
    aporo=sgsimporosity(:,ii);
   bbporo(indices)=aporo;
 DupdateK2poro(:,ii)=bbporo;

end

[output,outputporo] = honour2(rossmary, rossmaryporo, N,DupdateK2poro,DupdateK2);

mumyperm=DupdateK2;
mumyporo=DupdateK2poro;
mumyfault=faultout;
 disp('  program executed  ');
end
 