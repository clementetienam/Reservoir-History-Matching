function faultensemble=getfaults(N);
%% This function is to get al the value of faults for the ensemble members for all the timesteps at once
disp(' Author: Clement Etienam-PhD Visiting researcher,University of Manchester,July,2018')
disp('Supervisor: Profesor Colin Macbeth')

%% Extract the simulated data
 oldfolder=cd;
cd(oldfolder) % setting original directory
  disp(' Get the fault value for all ensemble  ');
for i=1:N %list of folders 
   f = 'Realization_';
    folder = strcat(f, sprintf('%d',i)); 
    cd(folder);
fid = fopen('multflt.dat','rt');
A2oilsim = (textscan(fid,'%s%f%s','HeaderLines',1));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid);
 B_2Hoilsim=A2oilsim{:,2};
  B_2fault= B_2Hoilsim(1:53,:);

faultensemble(:,i)= B_2fault;
cd(oldfolder);
end
end