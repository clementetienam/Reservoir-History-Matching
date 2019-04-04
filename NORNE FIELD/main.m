%----------------------------------------------------------------------------------
% History matching of the NORNE Field
% Running Ensembles
% the code couples ECLIPSE reservoir simulator with MATLAB 
% Author: Clement Etienam-PhD Visiting researcher,University of Manchester,July,2018
% Supervisor: Profesor Colin Macbeth
%-----------------------------------------------------------------------------------
%% 
clc
clear
disp(' Author: Clement Etienam-PhD Visiting researcher,University of Manchester,July,2018')
disp('Supervisor: Profesor Colin Macbeth')

%% Decision on Optimisation method
disp( 'Select the optimisation method')
disp('1-ES-MDA')
disp('2-Ensemble Smoother')
disp('3-EnKF')
disp('4- Genetic algorithm')
optmethod=input(' Enter the  required data assimilation scheme method  ');
disp(' For this optimization methods,it is advisable to use covariance localization for all updates')
disp('1-Yes')
disp('2-No')
seismatch=input(' Do you want to history match seismic data as well?  ');
load clementgrid.out
if seismatch==1
    disp( 'Select the optimisation method for seismic history matching')
disp('1-ES-MDA')
disp('2-Ensemble Smoother')
optmethodseismatch=input(' Enter the  required data assimilation scheme method for seismic history matching  ');
end

%% Ensemble Smoother Multiple Data Assimilation,ES-MDA Section
if optmethod==1
    disp( 'ES-MDA optimisation method Chosen')
% Various variants under ES-MDA
disp('choose from the methods listed below for history matching with ES-MDA')
disp('1-main_ES-MDA')
disp('2-main_ES-MDA_Localization-covariance localization')
disp('3- main_DCT( discrete cosine transform method coupled with ESMDA)')
disp('4-main_ES-MDA determinstic')
method=input(' Enter the  required data assimilation scheme method in the ES-MDA loop  ');
% N - size of ensemble
N=input( ' enter the number of realizations(ensemble size)  '); %100
nx=input( ' enter the number of grid blocks in x direction  '); %46
ny=input( ' enter the number of grid blocks in y direction  '); %112
nz=input( ' enter the number of grid blocks in z direction  '); %22
tol=input( ' enter the tolerance for pseudo inversion  ');
alpha=input( ' enter the alpha value  '); %4-8
% alpha is the number of iteration and damping coefficient
load timestep.out;
measurements=79;
% plothistorymatching(timestep,1,1);
history=numel(timestep); %248
disp('1=yes')
disp('2=no' )
response=input('Do you want to plot the permeability map ');
disp( 'Load the true permeability and porosity')
load rossmary.GRDECL; %true permeability field
load rossmaryporo.GRDECL; %True porosity field
rossmary=reshape(rossmary',46,112,22);
rossmary=reshape(rossmary,113344,1);
rossmaryporo=reshape(rossmaryporo',46,112,22);
rossmaryporo=reshape(rossmaryporo,113344,1);

load effective.out;
oldfolder=cd;
cd(oldfolder) % setting original directory
%%
disp( 'plot the well true production data to see what we are striving to match')
plothistorydata(timestep);
%% Get the historcial data into an Ascii file
 disp(' make the true observation')
 observation=gethistorydata(timestep,measurements,history);
 % 79 measurments with 248 historical data timestep
  oldfolder=cd;
%% The big history matching iterative loop for ES-MDA will start here
tic;
for inelly=1:alpha
fprintf('Now running the code for iteration %d .\n', inelly);   
%% Loading Porosity and Permeability ensemble files
disp(' load the permeability and porosity fields')
if inelly==1
    disp( 'permeability,porosity and fault ensemble loaded from initial ensemble')
load sgsimporo.out; %initial porosity
load sgsim.out; %initial permeabiity
load faultensemble.dat;
perm=reshape(sgsim,nx*ny*nz,N);
poro=reshape(sgsimporo,nx*ny*nz,N);
faulten=reshape(faultensemble,53,N);
else
 disp( 'permeability loaded from UPDATED ensemble')
 perm=reshape(mumyperm,nx*ny*nz,N);
 poro=reshape(mumyporo,nx*ny*nz,N);
 faulten=reshape(mumyfault,53,N);
end
cd(oldfolder) % setting original directory

%% 
for j=1:N
 f = 'Realization_';
 folder = strcat(f, sprintf('%d',j));
copyfile('multflt.dat',folder)
end

%% Write back the fault ensemble into a multflt.dat file
writebackfaults(faulten,N);

%% Inserting KEYWORDS PORO and PERMY 

for i=1:N %list of folders 
    
   f = 'Realization_';
   folder = strcat(f, sprintf('%d',i));
    cd(folder)

   PORO2=poro(:,i);
    PERMX2=perm(:,i);
    
fid = fopen('permx.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PERMX2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('permx.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PERMX'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('permx.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);


fid = fopen('porosity.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PORO2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('porosity.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PORO'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('porosity.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);

    cd(oldfolder) % returning to original cd
    
end
    

%% Running Simulations
disp( 'Solve the Non-Linear fluid flow Forward Problem' )
cd(oldfolder) % setting original directory

parfor i=1:N %list of folders 
    
    f = 'Realization_';
    folder = strcat(f, sprintf('%d',i));
    cd(folder)   

    fid = fopen('FULLNORNE.bat', 'w');
    fprintf(fid,'@ECHO OFF\n');
    % fprintf(fid,'SET SLBSLS_LICENSE_FILE=27008@eclipse.cc.ic.ac.uk\n');
    fprintf(fid,'SET SLBSLS_LICENSE_FILE=27000@10.99.15.78\n');
    fprintf(fid,'@ECHO OFF\n');
    fprintf(fid,['c:\\ecl\\macros\\$eclipse ', 'FULLNORNE'],'\n');
    fclose(fid);
    %while ~exist('HM.F0016','file')
        system('FULLNORNE.bat')
    %end

    cd(oldfolder) % setting original directory
    
end
%%
disp(' plot production profile for the run')
plothistorymatching(timestep,N,inelly);
%%
disp(' Get the cost function to production data match')
index=getcostfunctionvalue(timestep,N,inelly);

decreasingnorm(:,inelly)=index;
bestnorm = find(index == min(index));
%% Plot permeability field
clementPlot(nx,ny,nz, clementgrid,perm,rossmary,N,bestnorm,effective,inelly);
 
 %%
 disp( 'Get the simulated files for all the time step')
 N=100;
 overallsim=getsimulated(timestep,N,history);

cd(oldfolder) % returning to original directory
%% Enter the assimilation loop  
switch method
    case 1
 disp( 'method 1 specified-standard ESMDA')
[mumyperm,mumyporo,mumyfault]=main_ESMDA(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);
   case 2
   disp( 'method 2 specified-Localization with ESMDA')       
[mumyperm,mumyporo,mumyfault]=main_ESMDA_Localization(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective); 
    case 3
 disp( 'method 3 specified-DCT')   
[mumyperm,mumyporo,mumyfault]=main_DCT(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);      
    case 4
  disp( 'method 4 specified')        
 [mumyperm,mumyporo,mumyfault]=main_determinstic(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);            
    otherwise
        disp('method not specified correctly')
end
 mumyperm(mumyperm==1)=0;
 mumyporo(mumyporo==1)=0;


perm=reshape(mumyperm,nx*ny*nz,N);
poro=reshape(mumyporo,nx*ny*nz,N);
faulten=reshape(mumyfault,53,N);
fprintf('Finished Iteration %d .\n', inelly);
end
 disp( 'ES-MDA optimisation method executed')
%%
elseif optmethod==2 %Ensemble smoother (fastest but less acurate)
    inelly=1;
    alpha=1;
disp( 'Ensemble Smoother (ES) optimisation method Chosen')
disp('choose from the methods listed below for history matching with ES')
disp('1-main_ES')
disp('2-main_ES_Localization-covariance localization')
disp('3- main_DCT( discrete cosine transform method coupled with ES)')
disp('4-main_ES-determinstic')
method=input(' Enter the  required data assimilation scheme method  ');
% N - size of ensemble
N=input( ' enter the number of realizations(ensemble size)-100  '); %100
nx=input( ' enter the number of grid blocks in x direction-46  '); %46
ny=input( ' enter the number of grid blocks in y direction-112  '); %112
nz=input( ' enter the number of grid blocks in z direction-22  '); %22
tol=input( ' enter the tolerance for pseudo inversion-0.99  ');
load timestep.out;
measurements=79;
history=numel(timestep); %248
disp('1=yes')
disp('2=no' )
response=input('Do you want to plot the permeability map ');

disp( 'Load the true permeability and porosity')
load rossmary.GRDECL; %true permeability field
load rossmaryporo.GRDECL; %true porosity field
rossmary=reshape(rossmary',46,112,22);
rossmary=reshape(rossmary,113344,1);
rossmaryporo=reshape(rossmaryporo',46,112,22);
rossmaryporo=reshape(rossmaryporo,113344,1);
load effective.out; %active regions
oldfolder=cd;
cd(oldfolder) % setting original directory
disp( 'plot the well true production data to see what we are striving to match')
plothistorydata(timestep);
%% Get the historcial data into an Ascii file
 disp(' make the true observation')
 observation=gethistorydata(timestep,measurements,history);
 % 79 measurments with 248 historical data timestep
  oldfolder=cd;

%% History matching using Ensemble smoother
tic;
inelly=1;
fprintf('Now running the code for Ensemble smoother history matching');   
%% Loading Porosity and Permeability ensemble files
disp(' load the permeability and porosity fields')
load sgsimporo.out; %initial porosity
load sgsim.out; %initial permeabiity
perm=reshape(sgsim,nx*ny*nz,N);
poro=reshape(sgsimporo,nx*ny*nz,N);
load faultensemble.dat;
faulten=reshape(faultensemble,53,N);

cd(oldfolder) % setting original directory

%%
for j=1:N
 f = 'Realization_';
 folder = strcat(f, sprintf('%d',j));
copyfile('multflt.dat',folder)
end

%% Write back te fault ensemble into a multflt.dat file
writebackfaults(faulten,N);
%% Inserting KEYWORDS PORO and PERMY 

for i=1:N %list of folders 
    
   f = 'Realization_';
   folder = strcat(f, sprintf('%d',i));
    cd(folder)

   PORO2=poro(:,i);
    PERMX2=perm(:,i);
    
fid = fopen('permx.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PERMX2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('permx.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PERMX'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('permx.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);


fid = fopen('porosity.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PORO2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('porosity.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PORO'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('porosity.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);

    cd(oldfolder) % returning to original cd
    
end
%% Running Simulations
disp( 'Solve the Non-Linear fluid flow Forward Problem' )
cd(oldfolder) % setting original directory

parfor i=1:N %list of folders 
    
    f = 'Realization_';
    folder = strcat(f, sprintf('%d',i));
    cd(folder)   

    fid = fopen('FULLNORNE.bat', 'w');
    fprintf(fid,'@ECHO OFF\n');
    % fprintf(fid,'SET SLBSLS_LICENSE_FILE=27008@eclipse.cc.ic.ac.uk\n');
    fprintf(fid,'SET SLBSLS_LICENSE_FILE=27000@10.99.15.78\n');
    fprintf(fid,'@ECHO OFF\n');
    fprintf(fid,['c:\\ecl\\macros\\$eclipse ', 'FULLNORNE'],'\n');
    fclose(fid);
    %while ~exist('HM.F0016','file')
        system('FULLNORNE.bat')
    %end

    cd(oldfolder) % setting original directory
    
end
%%
[bestnorm3,PlogK]=clementPlot(nx,ny,nz, clementgrid,mumyperm,rossmary,N,bestnorm,effective);
%%
disp(' plot production profile for the run')
plothistorymatching(timestep,N,1);
%%
disp(' Get the cost function to production data match')
index=getcostfunctionvalue(timestep,N,inelly);
 
decreasingnorm(:,inelly)=index;
bestnorm = find(index == min(index));
%% Plot permeability field
clementPlot(nx,ny,nz, clementgrid,perm,rossmary,N,bestnorm,effective,inelly);
%% 
disp( 'Get the simulated files for all the time step')
 N=100;
 overallsim=getsimulated(timestep,N,history);

cd(oldfolder) % returning to original directory
%% Enter the assimilation loop
disp('now entering the ES- assimilation loop')
 disp('ES-MDA is ES with alpha=1') 
switch method
    case 1
 disp( 'method 1 specified-standard ES')
[mumyperm,mumyporo,mumyfault]=main_ESMDA(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);
   case 2
   disp( 'method 2 specified-Localization with ES')       
[mumyperm,mumyporo,mumyfault]=main_ESMDA_Localization(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective); 
    case 3
 disp( 'method 3 specified-DCT')   
[mumyperm,mumyporo,mumyfault]=main_DCT(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);      
    case 4
  disp( 'method 4 specified')        
 [mumyperm,mumyporo,mumyfault]=main_determinstic(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);           
    otherwise
        disp('method not specified correctly')
end
mumyperm(mumyperm==1)=0;
mumyporo(mumyporo==1)=0;

perm=reshape(mumyperm,nx*ny*nz,N);
 poro=reshape(mumyporo,nx*ny*nz,N);
 faulten=reshape(mumyfault,53,N);
fprintf('Finished Ensemble smoother');
%end
%% Ensemble Kalman Filter section
elseif optmethod==3% history matching using an iterative EnKF
disp( 'Ensemble Kalman Filter (EnKF) optimisation method Chosen')
disp('choose from the methods listed below for history matching with EnKF')
disp('1-main_EnKF')
disp('2-main_EnKF_Localization-covariance localization')
disp('3- main_DCT( discrete cosine transform method coupled with EnKF)')
disp('4-main_EnKF determinstic')
method=input(' Enter the  required data assimilation scheme method  ');
% N - size of ensemble
N=input( ' enter the number of realizations(ensemble size)-100  '); %100
nx=input( ' enter the number of grid blocks in x direction-46  '); %46
ny=input( ' enter the number of grid blocks in y direction-112  '); %112
nz=input( ' enter the number of grid blocks in z direction-22  '); %22
tol=input( ' enter the tolerance for pseudo inversion  ');
alpha=input( ' enter the alpha value  '); %4-8
% alpha is the number of iteration and damping coefficient
load timestep.out;
measurements=79;
% plothistorymatching(timestep,1,1);
history=numel(timestep); %248
disp('1=yes')
disp('2=no' )
response=input('Do you want to plot the permeability map ');
disp( 'Load the true permeability and porosity')
load rossmary.GRDECL; %true permeability field
load rossmaryporo.GRDECL; %True porosity field
rossmary=reshape(rossmary',46,112,22);
rossmary=reshape(rossmary,113344,1);
rossmaryporo=reshape(rossmaryporo',46,112,22);
rossmaryporo=reshape(rossmaryporo,113344,1);
load effective.out;
oldfolder=cd;
cd(oldfolder) % setting original directory
%%
disp( 'plot the well true production data to see what we are striving to match')
plothistorydata(timestep);
%% Get the historcial data into an Ascii file
 disp(' make the true observation')
 observation=gethistorydata(timestep,measurements,history);
 % 79 measurments with 248 historical data timestep
  oldfolder=cd;
%% The big history matching iterative loop for EnKF will start here
tic;
for inelly=1:history
fprintf('Now running the code for iteration %d .\n', inelly);   
%% Loading Porosity and Permeability ensemble files
disp(' load the permeability and porosity fields')
if inelly==1
    disp( 'permeability loaded from initial ensemble')
load sgsimporo.out; %initial porosity
load sgsim.out; %initial permeabiity
load faultensemble.dat;
faulten=reshape(faultensemble,53,N);
perm=reshape(sgsim,nx*ny*nz,N);
poro=reshape(sgsimporo,nx*ny*nz,N);
else
 disp( 'permeability loaded from UPDATED ensemble')
 perm=reshape(mumyperm,nx*ny*nz,N);
 poro=reshape(mumyporo,nx*ny*nz,N);
 faulten=reshape(mumyfault,53,N);
end
cd(oldfolder) % setting original directory

%%
for j=1:N
 f = 'Realization_';
 folder = strcat(f, sprintf('%d',j));
copyfile('multflt.dat',folder)
end

%% Write back the fault ensemble into a multflt.dat file
writebackfaults(faulten,N);
%% Inserting KEYWORDS PORO and PERMY 

for i=1:N %list of folders 
    
   f = 'Realization_';
   folder = strcat(f, sprintf('%d',i));
    cd(folder)

   PORO2=poro(:,i);
    PERMX2=perm(:,i);
    
fid = fopen('permx.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PERMX2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('permx.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PERMX'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('permx.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);


fid = fopen('porosity.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PORO2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('porosity.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PORO'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('porosity.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);

    cd(oldfolder) % returning to original cd
    
end


%% Running Simulations
disp( 'Solve the Non-Linear fluid flow Forward Problem' )
cd(oldfolder) % setting original directory

parfor i=1:N %list of folders 
    
    f = 'Realization_';
    folder = strcat(f, sprintf('%d',i));
    cd(folder)   

    fid = fopen('FULLNORNE.bat', 'w');
    fprintf(fid,'@ECHO OFF\n');
    % fprintf(fid,'SET SLBSLS_LICENSE_FILE=27008@eclipse.cc.ic.ac.uk\n');
    fprintf(fid,'SET SLBSLS_LICENSE_FILE=27000@10.99.15.78\n');
    fprintf(fid,'@ECHO OFF\n');
    fprintf(fid,['c:\\ecl\\macros\\$eclipse ', 'FULLNORNE'],'\n');
    fclose(fid);
    %while ~exist('HM.F0016','file')
        system('FULLNORNE.bat')
    %end

    cd(oldfolder) % setting original directory
    
end
%%
disp(' plot production profile for the run')
plothistorymatching(timestep,N,inelly);
%%
disp(' Get the cost function to production data match')
index=getcostfunctionvalue(timestep,N,inelly);

decreasingnorm(:,inelly)=index;
bestnorm = find(index == min(index));
%% Plot permeability field
clementPlot(nx,ny,nz, clementgrid,perm,rossmary,N,bestnorm,effective,inelly); 
 %%
 disp( 'Get the simulated files for all the time step')
 N=100;
 overallsim=getsimulated(timestep,N,history);

cd(oldfolder) % returning to original directory
%% Enter the assimilation loop
%%
disp('now entering the assimilation loop')
  
switch method
    case 1
 disp( 'method 1 specified-standard EnKF')
[mumyperm,mumyporo,mumyfault]=main_EnKF(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,inelly,effective);
   case 2
   disp( 'method 2 specified-Localization with ESMDA')       
[mumyperm,mumyporo,mumyfault]=main_EnKF_Localization(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,inelly,effective); 
    case 3
 disp( 'method 3 specified-DCT')   
[mumyperm,mumyporo,mumyfault]=main_DCT_EnKF(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,inelly,effective);      
    case 4
  disp( 'method 4 specified')        
 [mumyperm,mumyporo,mumyfault]=main_determinstic_EnKF(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,inelly,effective);            
    otherwise
        disp('method not specified correctly')
end
mumyperm(mumyperm==1)=0;
mumyporo(mumyporo==1)=0;

perm=reshape(mumyperm,nx*ny*nz,N);
 poro=reshape(mumyporo,nx*ny*nz,N);
faulten=reshape(mumyfault,53,N);
fprintf('Finished Iteration %d .\n', inelly);
end
 disp( 'EnKF optimisation method executed')
%% Genetic Algorithm loop

else %% Using Genetic Algorithm
     disp( 'Genetic Algorithm optimisation method  Chosen (not recommended)')
 % Variants under Genetic Algorithm
disp('choose from the methods listed below for history matching with ESMDA')
disp('1-main_GA')
disp('2-main_GA2')
disp('3- main_GA_Adaptive')
method=input(' Enter the  required data assimilation scheme method  ');
% N - size of ensemble
N=input( ' enter the number of realizations(ensemble size)-100  '); %100
nx=input( ' enter the number of grid blocks in x direction-46  '); %46
ny=input( ' enter the number of grid blocks in y direction-112  '); %112
nz=input( ' enter the number of grid blocks in z direction-22  '); %22
tol=input( ' enter the tolerance for pseudo inversion-0.99  ');
load timestep.out;
measurements=79;
history=numel(timestep); %248
disp('1=yes')
disp('2=no' )
response=input('Do you want to plot the permeability map ');

disp( 'Load the true permeability and porosity')
load rossmary.GRDECL; %true permeability field
load rossmaryporo.GRDECL; %true porosity field
load effective.out; %active regions
oldfolder=cd;
cd(oldfolder) % setting original directory
disp( 'plot the well true production data to see what we are striving to match')
plothistorydata(timestep);
%% Get the historcial data into an Ascii file
 disp(' make the true observation')
 observation=gethistorydata(timestep,measurements,history);
 % 79 measurments with 248 historical data timestep
  oldfolder=cd;

%% History matching using Genetic Algorithm
tic;
inelly=1;
fprintf('Now running the code for Ensemble smoother');   
%% Loading Porosity and Permeability ensemble files
disp(' load the permeability and porosity fields')
load sgsimporo.out; %initial porosity
load sgsim.out; %initial permeabiity
load faultensemble.dat;
faulten=reshape(faultensemble,53,N);
perm=reshape(sgsim,nx*ny*nz,N);
poro=reshape(sgsimporo,nx*ny*nz,N);

cd(oldfolder) % setting original directory

%%
for j=1:N
 f = 'Realization_';
 folder = strcat(f, sprintf('%d',j));
copyfile('multflt.dat',folder)
end

%% Write back te fault ensemble into a multflt.dat file
writebackfaults(faulten,N);
%% Inserting KEYWORDS PORO and PERMY 

for i=1:N %list of folders 
    
   f = 'Realization_';
   folder = strcat(f, sprintf('%d',i));
    cd(folder)

   PORO2=poro(:,i);
    PERMX2=perm(:,i);
    
fid = fopen('permx.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PERMX2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('permx.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PERMX'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('permx.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);


fid = fopen('porosity.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PORO2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('porosity.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PORO'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('porosity.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);

    cd(oldfolder) % returning to original cd
    
end
%% Running Simulations
disp( 'Solve the Non-Linear fluid flow Forward Problem' )
cd(oldfolder) % setting original directory

parfor i=1:N %list of folders 
    
    f = 'Realization_';
    folder = strcat(f, sprintf('%d',i));
    cd(folder)   

    fid = fopen('FULLNORNE.bat', 'w');
    fprintf(fid,'@ECHO OFF\n');
    % fprintf(fid,'SET SLBSLS_LICENSE_FILE=27008@eclipse.cc.ic.ac.uk\n');
    fprintf(fid,'SET SLBSLS_LICENSE_FILE=27000@10.99.15.78\n');
    fprintf(fid,'@ECHO OFF\n');
    fprintf(fid,['c:\\ecl\\macros\\$eclipse ', 'FULLNORNE'],'\n');
    fclose(fid);
    %while ~exist('HM.F0016','file')
        system('FULLNORNE.bat')
    %end

    cd(oldfolder) % setting original directory
    
end
%%
disp(' plot production profile for the run')
plothistorymatching(timestep,N,1);
%%
disp(' Get the cost function to production data match')
index=getcostfunctionvalue(timestep,N,inelly);
 
decreasingnorm(:,inelly)=index;
bestnorm = find(index == min(index));
%% Plot permeability field
clementPlot(nx,ny,nz, clementgrid,perm,rossmary,N,bestnorm,effective,inelly);
%% 
 
disp( 'Get the simulated files for all the time step')
 N=100;
 overallsim=getsimulated(timestep,N,history);

cd(oldfolder) % returning to original directory
%% Enter the assimilation loop

disp('now entering the assimilation loop')
  
switch method
    case 1
 disp( 'method 1 specified-standard ESMDA')
[mumyperm,mumyporo,mumyfault]=main_GA(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);
   case 2
   disp( 'method 2 specified-Localization with ESMDA')       
[mumyperm,mumyporo,mumyfault]=main_GA2(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective); 
    case 3
 disp( 'method 3 specified-DCT')   
[mumyperm,mumyporo,mumyfault]=main_GA_Adaptive(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);    
          
 %[mumyperm,mumyporo,mumyfault]=main_EnKF_determinstic(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective,innermethod);            
    otherwise
        disp('method not specified correctly')
end
mumyperm(mumyperm==1)=0;
mumyporo(mumyporo==1)=0;

perm=reshape(mumyperm,nx*ny*nz,N);
 poro=reshape(mumyporo,nx*ny*nz,N);
 faulten=reshape(mumyfault,53,N);
fprintf('Finished Code for Genetic Algorithm History matching');
end

 %% Seismic history matching part-Done after production data part
 if seismatch==1
     if optmethodseismatch==1
    disp( 'ES-MDA optimisation method Chosen for seismic history matching')
% Various variants under ES-MDA
disp('choose from the methods listed below for history matching with ES-MDA')
disp('1-main_ES-MDA')
disp('2-main_ES-MDA_Localization-covariance localization')
disp('3- main_DCT( discrete cosine transform method coupled with ESMDA)')
disp('5-main_ES-MDA determinstic')
method=input(' Enter the  required data assimilation scheme method in the ES-MDA loop  ');
% N - size of ensemble
N=input( ' enter the number of realizations(ensemble size)  '); %100
nx=input( ' enter the number of grid blocks in x direction  '); %46
ny=input( ' enter the number of grid blocks in y direction  '); %112
nz=input( ' enter the number of grid blocks in z direction  '); %22
tol=input( ' enter the tolerance for pseudo inversion  ');
alpha=input( ' enter the alpha value  '); %4-8
% alpha is the number of iteration and damping coefficient
load timestep.out;
measurements=79;
% plothistorymatching(timestep,1,1);
history=numel(timestep); %248
disp('1=yes')
disp('2=no' )
response=input('Do you want to plot the permeability map ');
disp( 'Load the true permeability and porosity')
load rossmary.GRDECL; %true permeability field
load rossmaryporo.GRDECL; %True porosity field
rossmary=reshape(rossmary',46,112,22);
rossmary=reshape(rossmary,113344,1);

load rossmaryporo.GRDECL;
rossmaryporo=reshape(rossmaryporo',46,112,22);
rossmaryporo=reshape(rossmaryporo,113344,1);

load effective.out;
oldfolder=cd;
cd(oldfolder) % setting original directory
%%
disp( 'plot the well true production data to see what we are striving to match')
plothistorydata(timestep);
%% Get the historcial data into an Ascii file
 disp(' make the true observation')
 observation=gethistorydata(timestep,measurements,history);
 % 79 measurments with 248 historical data timestep
  oldfolder=cd;
%% The big history matching iterative loop for ES-MDA will start here
tic;
for inelly=1:alpha
fprintf('Now running the code for iteration %d .\n', inelly);   
%% Loading Porosity and Permeability ensemble files

 disp( 'permeability loaded from production data history matching part')
 perm=reshape(mumyperm,nx*ny*nz,N);
 poro=reshape(mumyporo,nx*ny*nz,N);
 faulten=reshape(mumyfault,53,N);

cd(oldfolder) % setting original directory

%% 
for j=1:N
 f = 'Realization_';
 folder = strcat(f, sprintf('%d',j));
copyfile('multflt.dat',folder)
copyfile('FULLNORNE.DATA',folder) %% A new data file with FMTOUT specified
end

%% Write back the fault ensemble into a multflt.dat file
writebackfaults(faulten,N);

%% Inserting KEYWORDS PORO and PERMY 

for i=1:N %list of folders 
    
   f = 'Realization_';
   folder = strcat(f, sprintf('%d',i));
    cd(folder)

   PORO2=poro(:,i);
    PERMX2=perm(:,i);
    
fid = fopen('permx.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PERMX2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('permx.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PERMX'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('permx.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);


fid = fopen('porosity.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PORO2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('porosity.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PORO'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('porosity.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);

    cd(oldfolder) % returning to original cd
    
end


%% Running Simulations
disp( 'Solve the Non-Linear fluid flow Forward Problem' )
cd(oldfolder) % setting original directory

parfor i=1:N %list of folders 
    
    f = 'Realization_';
    folder = strcat(f, sprintf('%d',i));
    cd(folder)   

    fid = fopen('FULLNORNE.bat', 'w');
    fprintf(fid,'@ECHO OFF\n');
    % fprintf(fid,'SET SLBSLS_LICENSE_FILE=27008@eclipse.cc.ic.ac.uk\n');
    fprintf(fid,'SET SLBSLS_LICENSE_FILE=27000@10.99.15.78\n');
    fprintf(fid,'@ECHO OFF\n');
    fprintf(fid,['c:\\ecl\\macros\\$eclipse ', 'FULLNORNE'],'\n');
    fclose(fid);
    %while ~exist('HM.F0016','file')
        system('FULLNORNE.bat')
    %end

    cd(oldfolder) % setting original directory
    
end
%%
disp(' plot production profile for the run')
plothistorymatching(timestep,N,inelly);
%%
disp(' Get the cost function to production data match')
index=getcostfunctionvalue(timestep,N,inelly);

decreasingnorm(:,inelly)=index;
 bestnorm = find(index == min(index));
%% Plot permeability field
clementPlot(nx,ny,nz, clementgrid,perm,rossmary,N,bestnorm,effective,inelly);
 %%
 disp( 'Get the simulated files for all the time step')
 N=100;
 overallsim=getsimulated(timestep,N,history);

cd(oldfolder) % returning to original directory
%% Enter the assimilation loop
%% 
disp('now entering the assimilation loop')
  
switch method
    case 1
 disp( 'method 1 specified-standard ESMDA')
[mumyperm,mumyporo,mumyfault]=main_ESMDA_seismic(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);
   case 2
   disp( 'method 2 specified-Localization with ESMDA')       
[mumyperm,mumyporo,mumyfault]=main_ESMDA_Localization_seismic(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective); 
    case 3
 disp( 'method 3 specified-DCT')   
[mumyperm,mumyporo,mumyfault]=main_DCT_seismic(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);      
    case 4
  disp( 'method 4 specified')        
 [mumyperm,mumyporo,mumyfault]=main_determinstic_seismic(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);            
    otherwise
        disp('method not specified correctly')
end
 mumyperm(mumyperm==1)=0;
 mumyporo(mumyporo==1)=0;


perm=reshape(mumyperm,nx*ny*nz,N);
poro=reshape(mumyporo,nx*ny*nz,N);
faulten=reshape(mumyfault,53,N);
fprintf('Finished Iteration %d .\n', inelly);
end
 disp( 'ES-MDA seismic optimisation method executed')
 else %Ensemble smoother (fastest but less acurate)
    inelly=1;
    alpha=1;
disp( 'Ensemble Smoother (ES) optimisation method Chosen for seismic history matching')
disp('choose from the methods listed below for history matching with ES')
disp('1-main_ES')
disp('2-main_ES_Localization-covariance localization')
disp('3- main_DCT( discrete cosine transform method coupled with ES)')
disp('4-main_ES-determinstic')
method=input(' Enter the  required data assimilation scheme method  ');
% N - size of ensemble
N=input( ' enter the number of realizations(ensemble size)-100  '); %100
nx=input( ' enter the number of grid blocks in x direction-46  '); %46
ny=input( ' enter the number of grid blocks in y direction-112  '); %112
nz=input( ' enter the number of grid blocks in z direction-22  '); %22
tol=input( ' enter the tolerance for pseudo inversion-0.99  ');
load timestep.out;
measurements=79;
history=numel(timestep); %248
disp('1=yes')
disp('2=no' )
response=input('Do you want to plot the permeability map ');

disp( 'Load the true permeability and porosity')
load rossmary.GRDECL; %true permeability field
load rossmaryporo.GRDECL; %true porosity field
rossmary=reshape(rossmary',46,112,22);
rossmary=reshape(rossmary,113344,1);
rossmaryporo=reshape(rossmaryporo',46,112,22);
rossmaryporo=reshape(rossmaryporo,113344,1);
load effective.out; %active regions
oldfolder=cd;
cd(oldfolder) % setting original directory
disp( 'plot the well true production data to see what we are striving to match')
plothistorydata(timestep);
%% Get the historcial data into an Ascii file
 disp(' make the true observation')
 observation=gethistorydata(timestep,measurements,history);
 % 79 measurments with 248 historical data timestep
  oldfolder=cd;

%% History matching using Ensemble smoother
tic;
inelly=1;
fprintf('Now running the code for Ensemble smoother seismic history matching');   
%% Loading Porosity and Permeability ensemble files

perm=reshape(mumyperm,nx*ny*nz,N);
poro=reshape(mumyporo,nx*ny*nz,N);

faulten=reshape(faulten,53,N);

cd(oldfolder) % setting original directory

%% 
for j=1:N
 f = 'Realization_';
 folder = strcat(f, sprintf('%d',j));
copyfile('multflt.dat',folder)
end

%% Write back te fault ensemble into a multflt.dat file
writebackfaults(faulten,N);
%% Inserting KEYWORDS PORO and PERMY 

for i=1:N %list of folders 
    
   f = 'Realization_';
   folder = strcat(f, sprintf('%d',i));
    cd(folder)

   PORO2=poro(:,i);
    PERMX2=perm(:,i);
    
fid = fopen('permx.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PERMX2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('permx.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PERMX'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('permx.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);


fid = fopen('porosity.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PORO2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('porosity.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PORO'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('porosity.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);

    cd(oldfolder) % returning to original cd
    
end
%% Running Simulations
disp( 'Solve the Non-Linear fluid flow Forward Problem' )
cd(oldfolder) % setting original directory

parfor i=1:N %list of folders 
    
    f = 'Realization_';
    folder = strcat(f, sprintf('%d',i));
    cd(folder)   

    fid = fopen('FULLNORNE.bat', 'w');
    fprintf(fid,'@ECHO OFF\n');
    % fprintf(fid,'SET SLBSLS_LICENSE_FILE=27008@eclipse.cc.ic.ac.uk\n');
  fprintf(fid,'SET SLBSLS_LICENSE_FILE=27000@10.99.15.78\n');
    fprintf(fid,'@ECHO OFF\n');
    fprintf(fid,['c:\\ecl\\macros\\$eclipse ', 'FULLNORNE'],'\n');
    fclose(fid);
    %while ~exist('HM.F0016','file')
        system('FULLNORNE.bat')
    %end

    cd(oldfolder) % setting original directory
    
end
%%
disp(' plot production profile for the run')
plothistorymatching(timestep,N,1);
%%
disp(' Get the cost function to production data match')
index=getcostfunctionvalue(timestep,N,inelly);
 
decreasingnorm(:,inelly)=index;
bestnorm = find(index == min(index));
%% Plot permeability field
clementPlot(nx,ny,nz, clementgrid,perm,rossmary,N,bestnorm,effective,inelly);
%% 
 
disp( 'Get the simulated files for all the time step')
 N=100;
 overallsim=getsimulated(timestep,N,history);

cd(oldfolder) % returning to original directory
%% Enter the assimilation loop

disp('now entering the ES- assimilation loop for the seimic history matching')
 disp('ES-MDA is ES with alpha=1') 
switch method
    case 1
 disp( 'method 1 specified-standard ES')
[mumyperm,mumyporo,mumyfault]=main_ESMDA(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);
   case 2
   disp( 'method 2 specified-Localization with ES')       
[mumyperm,mumyporo,mumyfault]=main_ESMDA_Localization(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective); 
    case 3
 disp( 'method 3 specified-DCT')   
[mumyperm,mumyporo,mumyfault]=main_DCT(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);      
    case 4
  disp( 'method 4 specified')        
 [mumyperm,mumyporo,mumyfault]=main_determinstic(nx,ny,nz,N,tol,observation,overallsim,rossmary,rossmaryporo,perm,poro,faulten,history,alpha,effective);           
    otherwise
        disp('method not specified correctly')
end
mumyperm(mumyperm==1)=0;
mumyporo(mumyporo==1)=0;

perm=reshape(mumyperm,nx*ny*nz,N);
 poro=reshape(mumyporo,nx*ny*nz,N);
 faulten=reshape(mumyfault,53,N);
fprintf('Finished Ensemble smoother seismic history');
     end
 end %% Exit the seismic history matching loop if you did it
 %%
 disp( 'now run the code after the last Iteration to see how good')
 fprintf('Get the RMS after Final History mattching loop');   
%% Loading Porosity and Permeability ensemble files
disp(' use the permeability and porosity fields after Last iteration')
cd(oldfolder) % setting original directory
%%
for j=1:N
 f = 'Realization_';
 folder = strcat(f, sprintf('%d',j));
copyfile('multflt.dat',folder)
end
writebackfaults(faulten,N);
%% Inserting KEYWORDS PORO and PERMY 

for i=1:N %list of folders 
    
   f = 'Realization_';
   folder = strcat(f, sprintf('%d',i));
    cd(folder)

   PORO2=poro(:,i);
    PERMX2=perm(:,i);
    
fid = fopen('permx.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PERMX2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('permx.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PERMX'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('permx.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);


fid = fopen('porosity.dat','wt');
for j=1:numel(PORO2)
 fprintf(fid,'%f\n',PORO2(j,:));
end
 fclose(fid);
CStr = regexp(fileread('porosity.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'PORO'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('porosity.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);

    cd(oldfolder) % returning to original cd
    
end


%% Running Simulations
disp( 'Solve the Non-Linear fluid flow Forward Problem' )
cd(oldfolder) % setting original directory

parfor i=1:N %list of folders 
    
    f = 'Realization_';
    folder = strcat(f, sprintf('%d',i));
    cd(folder)   

    fid = fopen('FULLNORNE.bat', 'w');
    fprintf(fid,'@ECHO OFF\n');
    % fprintf(fid,'SET SLBSLS_LICENSE_FILE=27008@eclipse.cc.ic.ac.uk\n');
    fprintf(fid,'SET SLBSLS_LICENSE_FILE=27000@10.99.15.78\n');
    fprintf(fid,'@ECHO OFF\n');
    fprintf(fid,['c:\\ecl\\macros\\$eclipse ', 'FULLNORNE'],'\n');
    fclose(fid);
    %while ~exist('HM.F0016','file')
        system('FULLNORNE.bat')
    %end

    cd(oldfolder) % setting original directory
    
end

%%
disp(' plot production profile for the run')
plothistorymatching(timestep,N,inelly+1);
%%
disp(' Get the cost function to production data match')
index=getcostfunctionvalue(timestep,N,inelly+1);
decreasingseries=zeros(N,inelly+1);
decreasingseries(:,1:inelly)=decreasingnorm;
decreasingseries(:,inelly+1)=index;
 disp('  Final RMS computation executed  ');
disp( 'output the permeability and porosity history matched model after the last iteration')
file = fopen('sgsimfinal.out','w+'); %output the dictionary
for k=1:numel(mumyperm)                                                                       
fprintf(file,' %4.6f \n',mumyperm(k) );             
end

file2 = fopen('sgsimporofinal.out','w+'); %output the dictionary
for k=1:numel(mumyporo)                                                                       
fprintf(file2,' %4.6f \n',mumyporo(k) );             
end

file5 = fopen('faultfinal.out','w+'); %output the dictionary
for k=1:numel(faulten)                                                                       
fprintf(file5,' %4.6f \n',faulten(k) );             
end

file3 = fopen('genesisNorm.out','w+');
 for k=1:numel(decreasingnorm)                                                                       
 fprintf(file3,' %4.4f \n',decreasingnorm(k) );             
 end
 
 file4 = fopen('evolvingNorm.out','w+');
 for k=1:numel(decreasingseries)                                                                       
 fprintf(file4,' %4.4f \n',decreasingseries(k) );             
 end
 
 bestnorm=double(bestnorm);


effective=reshape(effective,nx*ny*nz,1);
if response==1
    disp( 'Pixel map needed')
    bestnorm = find(index == min(index));
%% Plot permeability field
clementPlot(nx,ny,nz, clementgrid,perm,rossmary,N,bestnorm,effective,inelly+1);

else
    disp (' pixel map not needed')
end

fprintf('Finished Iterations with the History matching method %d .\n', optmethod);
if method==1
disp('The method used was ES-MDA')
elseif method==2
disp('The method used was ES')
elseif method==3
disp('The method used was EnKF')
else
disp('The method used was Genetic Algorithm')
end
disp('  The overall program has been executed and the history matched files saved in the folder  ');
toc