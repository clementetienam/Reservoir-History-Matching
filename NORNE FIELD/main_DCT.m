function [mumyperm,mumyporo,mumyfault]=main_DCT(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);
disp(' Author: Clement Etienam-PhD Visiting researcher,University of Manchester,July,2018')
disp('Supervisor: Profesor Colin Macbeth')

sgsim=reshape(perm,nx*ny*nz,N);
sgsimporo=reshape(poro,nx*ny*nz,N);
Sim11=reshape(overallsim,79,history,N);
clement2 = mainDCT(sgsim, N);
clement2poro = mainDCTporo(sgsimporo, N);
indices=find(effective);

for i=1:history
 fprintf('Now assimilating timestep %d .\n', i);
  
Sim1=Sim11(:,i,:);
Sim1=reshape(Sim1,79,N);
f=observation(:,i);
[DupdateK,sgsimporosity,faultout] = Assimilate_DCT (clement2,clement2poro,faulten,f, N, Sim1,alpha,tol,indices);

clement2=DupdateK;
clement2poro=sgsimporosity;
faulten=faultout;
 fprintf('Finished assimilating timestep %d \n', i);
end
valuepermjoy=clement2;
for ii=1:N
    lf=reshape(valuepermjoy(:,ii),25,50,nz);
     for jj=1:nz
         valueperm=lf(:,:,jj);
         big=zeros(nx,ny,nz);

        big(1:25,1:50,jj)=valueperm;
        kkperm=big(:,:,jj);
        rec = mirt_idctn(kkperm);
        rec=(abs(rec));
         usdf=reshape(rec,5152,1);
         young(:,jj)=usdf;
     end
      sdfbig=reshape(young,113344,1);
  clementperm(:,ii)=sdfbig;
end

sgsim11=(clementperm);
DupdateK= sgsim11;

valueporojoy=clement2poro;
for ii=1:N
    lf=reshape(valueporojoy(:,ii),25,50,nz);
     for jj=1:nz
         valueperm=lf(:,:,jj);
         big=zeros(nx,ny,nz);

        big(1:25,1:50,jj)=valueperm;
        kkperm=big(:,:,jj);
        rec = mirt_idctn(kkperm);
        rec=(abs(rec));
         usdf=reshape(rec,5152,1);
         young(:,jj)=usdf;
     end
      sdfbig=reshape(young,113344,1);
  clementporo(:,ii)=sdfbig;
end
DupdateK2poro=clementporo;

%DupdateK=abs(DupdateK);
%DupdateK(DupdateK>=3996.5)=3996.5;
DupdateK(DupdateK<=0.6550)=0.6550;

%DupdateK2poro=abs(DupdateK2poro);
%DupdateK2poro(DupdateK2poro>=0.3473)=0.3473;
DupdateK2poro(DupdateK2poro<=0.1345)=0.1345;

%faultout=abs(faultout);
faultout(faultout<=0.000036182)=0.000036182;
%[output,outputporo] = honour2(rossmary, rossmaryporo, N,DupdateK2poro,DupdateK);


mumyperm=DupdateK;
mumyperm=mumyperm.*effective;

mumyporo=DupdateK2poro;
mumyporo=mumyporo.*effective;

mumyfault=faultout;

end

 