function writebackfaults(faultensemble,N);
disp(' Author: Clement Etienam-PhD Visiting researcher,University of Manchester,July,2018')
disp('Supervisor: Profesor Colin Macbeth')
 oldfolder=cd;
cd(oldfolder) % setting original directory
  disp(' Get the fault value for all ensemble and write it out to a file  ');

for i=1:N %list of folders 
    
   f = 'Realization_';
  folder = strcat(f, sprintf('%d',i));
   
    cd(folder) % changing directory 
    
    fault=faultensemble(:,i);
fid = fopen('multflt.dat','rt');
A2oilsim = (textscan(fid,'%s%f%s','HeaderLines',1));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid);
 
value11=A2oilsim{1:53,1};
value1=char(value11(:));
value1=value1(:,1:9);

value31=A2oilsim{:,3};
value31=char(value31(:));
% value31=value31(1:53,:);

fid = fopen('multflt.dat','wt');

for j=1:53
 fprintf(fid,'%s\t%f\t%s\n',value1(j,:),fault(j,:),value31(j,:));
end
 fclose(fid);
CStr = regexp(fileread('multflt.dat'), char(10), 'split');
CStr2 = strrep(CStr, 'toReplace', 'Replacement');
CStr2 = cat(2, {'MULTFLT'}, CStr2(1:end));
CStr2 = cat(2, CStr2(1:end), {'/'});
FID = fopen('multflt.dat', 'w');
if FID < 0, error('Cannot open file'); end
fprintf(FID, '%s\n', CStr2{:});
fclose(FID);
    
    cd(oldfolder) % returning to original cd
    
end
end