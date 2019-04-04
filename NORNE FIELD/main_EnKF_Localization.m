function [mumyperm,mumyporo,mumyfault]=main_EnKF_Localization(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,inelly,effective);
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
i=inelly;

 fprintf('Now assimilating timestep %d .\n', i);

Sim1=Sim11(:,i,:);
Sim1=reshape(Sim1,79,N);

f=observation(:,i);
sgsim1=log(sgactual);
 sgsim11 = reshape(sgsim1,44431,N);
 sgsim11poro = reshape(sgporoactual,44431,N);
 
A=zeros(46,112,22);
for j=1:22
    A(10,32,j)=1;
    A(14,28,j)=1;
    A(19,38,j)=1;
    A(26,44,j)=1;
    A(12,72,j)=1;
    A(23,15,j)=1;
    A(14,34,j)=1;
    A(9,13,j)=1;
    A(12,85,j)=1;
    A(9,37,j)=1;
    A(18,68,j)=1;
    A(18,83,j)=1;
    A(13,67,j)=1;
    A(38,98,j)=1;
    A(19,54,j)=1;
    A(6,57,j)=1;
    A(7,64,j)=1;
    A(36,68,j)=1;
    A(16,66,j)=1;
    A(25,37,j)=1;
    A(10,29,j)=1;
    A(15,74,j)=1;
    A(13,67,j)=1;
    A(19,54,j)=1;
    A(10,24,j)=1;
    A(11,38,j)=1;
    A(11,35,j)=1;
    A(15,21,j)=1;
    A(22,22,j)=1;
    
end
disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,46,112,22);
   for j=1:22;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,5152,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,113344,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;

   c0OIL1=zeros(113344,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:113344;
 if (0<=z(i,:) || z(i,:)<=c)
  c0OIL1(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0OIL1(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0OIL1(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0OIL1(i,:)=0;
 end
  
  end
  
c0OIL1(c0OIL1<0)=0;
  %[c0OIL1] = calc_loccoeffs(c, 'Gaspari_Cohn', z); 

 disp(' get the gaspari cohn for Cyd') 
 
    schur=c0OIL1;
   schuruse =schur(indices);    
  Bsch = repmat(schuruse,1,N);
  
  yoboschur=ones(88981,N);
 
  yoboschur(1:44431,:)=Bsch;
 yoboschur(44432:88862,1:N)=Bsch; 
disp('  generate Gaussian noise for the observed measurments  ');
    stddOIL1 = 0.1*f(1,:);
	stddOIL2 = 0.1*f(2,:);
    stddOIL3 = 0.1*f(3,:);
    stddOIL4 = 0.1*f(4,:);
    stddOIL5 = 0.1*f(5,:);
	stddOIL6 = 0.1*f(6,:);
	stddOIL7 = 0.1*f(7,:);
	stddOIL8 = 0.1*f(8,:);
    stddOIL9 = 0.1*f(9,:);
    stddOIL10 = 0.1*f(10,:);
    stddOIL11 = 0.1*f(11,:);
    stddOIL12 = 0.1*f(12,:);
    stddOIL13 = 0.1*f(13,:);
    stddOIL14 = 0.1*f(14,:);
    stddOIL15 = 0.1*f(15,:);
    stddOIL16 = 0.1*f(16,:);
    stddOIL17 = 0.1*f(17,:);
    stddOIL18 = 0.1*f(18,:);
    stddOIL19 = 0.1*f(19,:);
    stddOIL20 = 0.1*f(20,:);
    stddOIL21 = 0.1*f(21,:);
    stddOIL22 = 0.1*f(22,:);
    
    stddWATER1 = 0.15*f(23,:);
    stddWATER2 = 0.15*f(24,:);
    stddWATER3 = 0.15*f(25,:);
    stddWATER4 = 0.15*f(26,:);
    stddWATER5 = 0.15*f(27,:);
    stddWATER6 = 0.15*f(28,:);
    stddWATER7 = 0.15*f(29,:);
    stddWATER8 = 0.15*f(30,:);
    stddWATER9 = 0.15*f(31,:);
    stddWATER10 = 0.15*f(32,:);
    stddWATER11 = 0.15*f(33,:);
    stddWATER12 = 0.15*f(34,:);
    stddWATER13 = 0.15*f(35,:);
    stddWATER14 = 0.15*f(36,:);
    stddWATER15 = 0.15*f(37,:);
    stddWATER16 = 0.15*f(38,:);
    stddWATER17 = 0.15*f(39,:);
    stddWATER18 = 0.15*f(40,:);
    stddWATER19 = 0.15*f(41,:);
    stddWATER20 = 0.15*f(42,:);
    stddWATER21 = 0.15*f(43,:);
    stddWATER22 = 0.15*f(44,:);
    
    
    stddGAS1 = 0.15*f(45,:);
    stddGAS2 = 0.15*f(46,:);
    stddGAS3 = 0.15*f(47,:);
    stddGAS4 = 0.15*f(48,:);
    stddGAS5 = 0.15*f(49,:);
    stddGAS6 = 0.15*f(50,:);
    stddGAS7 = 0.15*f(51,:);
    stddGAS8 = 0.15*f(52,:);
    stddGAS9 = 0.15*f(53,:);
    stddGAS10 = 0.15*f(54,:);
    stddGAS11 = 0.15*f(55,:);
    stddGAS12 = 0.15*f(56,:);
    stddGAS13 = 0.15*f(57,:);
    stddGAS14 = 0.15*f(58,:);
    stddGAS15 = 0.15*f(59,:);
    stddGAS16 = 0.15*f(60,:);
    stddGAS17 = 0.15*f(61,:);
    stddGAS18 = 0.15*f(62,:);
    stddGAS19 = 0.15*f(63,:);
    stddGAS20 = 0.15*f(64,:);
    stddGAS21 = 0.15*f(65,:);
    stddGAS22 = 0.15*f(66,:);
    
  

    stddWINJ1 = 0.2*f(67,:);
    stddWINJ2 = 0.2*f(68,:);
    stddWINJ3 =0.2*f(69,:);
    stddWINJ4 = 0.2*f(70,:);
	stddWINJ5 = 0.2*f(71,:);
	stddWINJ6 = 0.2*f(72,:);
    stddWINJ7 = 0.2*f(73,:);
    stddWINJ8 = 0.2*f(74,:);
    stddWINJ9 = 0.2*f(75,:);
    
    
    stddGINJ1 = 0.2*f(76,:);
    stddGINJ2 = 0.2*f(77,:);
    stddGINJ3 = 0.2*f(78,:);
    stddGINJ4 = 0.2*f(79,:);
  
Error1=ones(79,N);
Error1(1,:)=normrnd(0,stddOIL1,1,N);
Error1(2,:)=normrnd(0,stddOIL2,1,N);
Error1(3,:)=normrnd(0,stddOIL3,1,N);
Error1(4,:)=normrnd(0,stddOIL4,1,N);
Error1(5,:)=normrnd(0,stddOIL5,1,N);
Error1(6,:)=normrnd(0,stddOIL6,1,N);
Error1(7,:)=normrnd(0,stddOIL7,1,N);
Error1(8,:)=normrnd(0,stddOIL8,1,N);
Error1(9,:)=normrnd(0,stddOIL9,1,N);
Error1(10,:)=normrnd(0,stddOIL10,1,N);
Error1(11,:)=normrnd(0,stddOIL11,1,N);
Error1(12,:)=normrnd(0,stddOIL12,1,N);
Error1(13,:)=normrnd(0,stddOIL13,1,N);
Error1(14,:)=normrnd(0,stddOIL14,1,N);
Error1(15,:)=normrnd(0,stddOIL15,1,N);
Error1(16,:)=normrnd(0,stddOIL16,1,N);
Error1(17,:)=normrnd(0,stddOIL17,1,N);
Error1(18,:)=normrnd(0,stddOIL18,1,N);
Error1(19,:)=normrnd(0,stddOIL19,1,N);
Error1(20,:)=normrnd(0,stddOIL20,1,N);
Error1(21,:)=normrnd(0,stddOIL21,1,N);
Error1(22,:)=normrnd(0,stddOIL22,1,N);
Error1(23,:)= normrnd(0,stddWATER1,1,N);
Error1(24,:)= normrnd(0,stddWATER2,1,N);
Error1(25,:)= normrnd(0,stddWATER3,1,N);
Error1(26,:)= normrnd(0,stddWATER4,1,N);
Error1(27,:)= normrnd(0,stddWATER5,1,N);
Error1(28,:)= normrnd(0,stddWATER6,1,N);
Error1(29,:)= normrnd(0,stddWATER7,1,N);
Error1(30,:)= normrnd(0,stddWATER8,1,N);
Error1(31,:)= normrnd(0,stddWATER9,1,N);
Error1(32,:)= normrnd(0,stddWATER10,1,N);
Error1(33,:)= normrnd(0,stddWATER11,1,N);
Error1(34,:)= normrnd(0,stddWATER12,1,N);
Error1(35,:)= normrnd(0,stddWATER13,1,N);
Error1(36,:)= normrnd(0,stddWATER14,1,N);
Error1(37,:)= normrnd(0,stddWATER15,1,N);
Error1(38,:)= normrnd(0,stddWATER16,1,N);
Error1(39,:)= normrnd(0,stddWATER17,1,N);
Error1(40,:)= normrnd(0,stddWATER18,1,N);
Error1(41,:)= normrnd(0,stddWATER19,1,N);
Error1(42,:)= normrnd(0,stddWATER20,1,N);
Error1(43,:)= normrnd(0,stddWATER21,1,N);
Error1(44,:)= normrnd(0,stddWATER22,1,N);
Error1(45,:)= normrnd(0,stddGAS1,1,N);
Error1(46,:)= normrnd(0,stddGAS2,1,N);
Error1(47,:)= normrnd(0,stddGAS3,1,N);
Error1(48,:)= normrnd(0,stddGAS4,1,N);
Error1(49,:)= normrnd(0,stddGAS5,1,N);
Error1(50,:)= normrnd(0,stddGAS6,1,N);
Error1(51,:)= normrnd(0,stddGAS7,1,N);
Error1(52,:)= normrnd(0,stddGAS8,1,N);
Error1(53,:)= normrnd(0,stddGAS9,1,N);
Error1(54,:)= normrnd(0,stddGAS10,1,N);
Error1(55,:)= normrnd(0,stddGAS11,1,N);
Error1(56,:)= normrnd(0,stddGAS12,1,N);
Error1(57,:)= normrnd(0,stddGAS13,1,N);
Error1(58,:)= normrnd(0,stddGAS14,1,N);
Error1(59,:)= normrnd(0,stddGAS15,1,N);
Error1(60,:)= normrnd(0,stddGAS16,1,N);
Error1(61,:)= normrnd(0,stddGAS17,1,N);
Error1(62,:)= normrnd(0,stddGAS18,1,N);
Error1(63,:)= normrnd(0,stddGAS19,1,N);
Error1(64,:)= normrnd(0,stddGAS20,1,N);
Error1(65,:)= normrnd(0,stddGAS21,1,N);
Error1(66,:)= normrnd(0,stddGAS22,1,N);
Error1(67,:)= normrnd(0,stddWINJ1,1,N);
Error1(68,:)= normrnd(0,stddWINJ2,1,N);
Error1(69,:)= normrnd(0,stddWINJ3,1,N);
Error1(70,:)= normrnd(0,stddWINJ4,1,N);
Error1(71,:)= normrnd(0,stddWINJ5,1,N);
Error1(72,:)= normrnd(0,stddWINJ6,1,N);
Error1(73,:)= normrnd(0,stddWINJ7,1,N);
Error1(74,:)= normrnd(0,stddWINJ8,1,N);
Error1(75,:)= normrnd(0,stddWINJ9,1,N);
Error1(76,:)= normrnd(0, stddGINJ1,1,N);
Error1(77,:)= normrnd(0, stddGINJ2,1,N);
Error1(78,:)= normrnd(0, stddGINJ3,1,N);
Error1(79,:)= normrnd(0, stddGINJ4,1,N);


Erroruse=Error1(1:66,:);
Cd2 = (Erroruse*Erroruse')./(N-1);

for i=1:N
    Dj(:,i)=f+(Error1(:,i));
	
 end

disp('  generate the ensemble state matrix containing parameters and states  ');
%Saturation,Pressure,SaturationG,RSG
Djuse=Dj(1:66,:);
Simuse=Sim1(1:66,:);

overall=zeros(88981,N); 

overall(1:44431,1:N)=sgsim11;
overall(44432:88862,1:N)=sgsim11poro;
overall(88863:88915,1:N)=faulten;
overall(88916:88981,1:N)=Simuse;
Y=overall; %State variable,it is important we include simulated measurements in the ensemble state variable
M = mean(Simuse,2);
% Mean of the ensemble state
M2=mean(overall,2);

for j=1:N
    S(:,j)=Simuse(:,j)-M;
end
for j=1:N
    yprime(:,j)=overall(:,j)-M2;
end

disp('  update the new ensemble  ');
 H=zeros(66,88981);
 H(1:66,88916,88981)=eye(66);
unie=H*yprime;
Sim=H*Y;
unie2=unie+Error1;
%[U0,Z0,V0] = svd(unie2,'econ');
[U0,Z0,V0] = svd(unie2);
joy2=Z0*Z0';
X1=pinv(joy2)*U0';
% Residual vector
X2=X1*(Djuse-Simuse);
X3=U0*X2;
X4=unie'*X3;
%Update the ensemble state
Ynew=Y+((yprime*X4).*yoboschur);
disp( 'extract the active permeability field ')
value1=Ynew(1:44431,1:N);
DupdateK=exp(value1);
sgsimporosity=Ynew(44432:88862,1:N);
faulten=faulten(88863:88915,1:N);

%DupdateK=abs(DupdateK);
%DupdateK(DupdateK>=3996.5)=3996.5;
DupdateK(DupdateK<=0.6550)=0.6550;

%sgsimporosity=abs(sgsimporosity);
%sgsimporosity(sgsimporosity>=0.3473)=0.3473;
sgsimporosity(sgsimporosity<=0.1345)=0.1345;


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
faultout=(faulten);
%faultout=abs(faultout);
faultout(faultout<=0.000036182)=0.000036182;
[output,outputporo] = honour2(rossmary, rossmaryporo, N,DupdateK2poro,DupdateK2);

mumyperm=DupdateK2;
mumyporo=DupdateK2poro;
mumyfault=faultout;
 disp('  program executed  ');
end
 