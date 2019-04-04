function index=getcostfunctionvalue(timestep,N,inelly);
% oldfolder=cd;
% N=1;
% inelly=1;
% cd(oldfolder) % setting original directory
%% This function is to get the productiondata cost function for all the ensemble
disp(' Author: Clement Etienam-PhD Visiting researcher,University of Manchester,July,2018')
disp('Supervisor: Profesor Colin Macbeth')
indices=timestep;
% N=ensemble size
%inelly=iteration count
%%
disp(' Get the Well Oil Production Rate')
   % A1 = importdata('NORNE_ATW2013.RSM',' ',47873); %(Wells-B-2H,D-1H,D-2H,B-4H,D-4H,E-3H)
  
  
  A11 = importdata('NORNE_ATW2013.RSM',' ',47873); %(Wells-B-2H,D-1H,D-2H,B-4H,D-4H,E-3H)
  data=A11.data;
  text=A11.textdata;

  kk=text(10:870,1);
 for j=1:861
  B = kk{j,:};
  B2=B(1:12);
  dd{j,:}=B2;
 end
dd=dd(indices);
 fid = fopen('NORNE_ATW2013.RSM','rt');
A1 = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',47873));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid); 
  
%A1=A1.data;
 B_2H=A1{1:861,3};
 B_2H=B_2H(indices);
 
 D_1H=A1{1:861,4};
 D_1H=D_1H(indices);
 
 D_2H=A1{1:861,5};
 D_2H=D_2H(indices);
 B_4H=A1{1:861,6};
  B_4H=B_4H(indices);
 D_4H=A1{1:861,7};
  D_4H=D_4H(indices);
 E_3H=A1{1:861,9};
  E_3H=E_3H(indices);
 
  %A2 = importdata('NORNE_ATW2013.RSM',' ',48743); %(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
 fid = fopen('NORNE_ATW2013.RSM','rt');
A2 = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',48743));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid);
 B_1H=A2{1:861,2};
  B_1H=B_1H(indices);
 B_3H=A2{1:861,5};
  B_3H=B_3H(indices);
 E_1H=A2{1:861,6};
  E_1H=E_1H(indices);
 E_2H=A2{1:861,8};
  E_2H=E_2H(indices);
 E_4AH=A2{1:861,10};
  E_4AH=E_4AH(indices);
  
  fid = fopen('NORNE_ATW2013.RSM','rt');
A3= (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',49613));%(Wells-D-3AH,E-3AH,B-4BH,D-4AH,D-1CH) 
fclose(fid);
%   A3 = importdata('NORNE_ATW2013.RSM',' ',49613); %(Wells-D-3AH,E-3AH,B-4BH,D-4AH,D-1CH) 
%  A3=A3.data;
 D_3AH=A3{1:861,3};
  D_3AH=D_3AH(indices);
 E_3AH=A3{1:861,5};
  E_3AH=E_3AH(indices);
 B_4BH=A3{1:861,8};
  B_4BH=B_4BH(indices);
  D_4AH=A3{1:861,9};
  D_4AH=D_4AH(indices);
 D_1CH=A3{1:861,10};
  D_1CH=D_1CH(indices);
 
  
%   A4 = importdata('NORNE_ATW2013.RSM',' ',50483); %(Wells-B-4DH,E-3CH,E-2AH,D-3BH,B-1BH,K-3H) 
%   A4=A4.data;
 fid = fopen('NORNE_ATW2013.RSM','rt');
 A4 = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',50483));%(Wells-B-4DH,E-3CH,E-2AH,D-3BH,B-1BH,K-3H)  
fclose(fid);
  
 B_4DH=A4{1:861,3};
  B_4DH=B_4DH(indices);
 E_3CH=A4{1:861,5};
  E_3CH=E_3CH(indices);
 E_2AH=A4{1:861,6};
  E_2AH=E_2AH(indices);
 D_3BH=A4{1:861,7};
  D_3BH=D_3BH(indices);
 B_1BH=A4{1:861,9};
  B_1BH=B_1BH(indices);
 K_3H=A4{1:861,10};
  K_3H=K_3H(indices);
 %clem=1:861;
 grey = [0.4,0.4,0.4]; 
 linecolor1 = colordg(3);
datax=(1:248).';

%% Import for Water production rate
disp(' Get the Well Water Production Rate')
%     A1w = importdata('NORNE_ATW2013.RSM',' ',40913); %(Wells-B-2H,D-1H,D-2H,B-4H,D-4H,E-3H)
  fid = fopen('NORNE_ATW2013.RSM','rt');
 A1w = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',40913));%(Wells-B-2H,D-1H,D-2H,B-4H,D-4H,E-3H)  
fclose(fid);
 B_2Hw=A1w{1:861,3};
 B_2Hw=B_2Hw(indices);
 D_1Hw=A1w{1:861,4};
 D_1Hw=D_1Hw(indices);
 D_2Hw=A1w{1:861,5};
 D_2Hw=D_2Hw(indices);
 B_4Hw=A1w{1:861,6};
 B_4Hw=B_4Hw(indices);
 D_4Hw=A1w{1:861,7};
 D_4Hw=D_4Hw(indices);
 E_3Hw=A1w{1:861,9};
 E_3Hw=E_3Hw(indices);
 
 
  %A2w = importdata('NORNE_ATW2013.RSM',' ',48743); %(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
   fid = fopen('NORNE_ATW2013.RSM','rt');
 A2w = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',48743));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH) 
fclose(fid);

 B_1Hw=A2w{1:861,2};
 B_1Hw=B_1Hw(indices);
 B_3Hw=A2w{1:861,5};
 B_3Hw=B_3Hw(indices);
 E_1Hw=A2w{1:861,6};
 E_1Hw=E_1Hw(indices);
 E_2Hw=A2w{1:861,8};
 E_2Hw=E_2Hw(indices);
 
 E_4AHw=A2w{1:861,10};
 E_4AHw=E_4AHw(indices);
 
 
    fid = fopen('NORNE_ATW2013.RSM','rt');
 A3w = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',49613));%(Wells-D-3AH,E-3AH,B-4BH,D-4AH,D-1CH)
fclose(fid); 

 
 D_3AHw=A3w{1:861,3};
 D_3AHw=D_3AHw(indices);
 E_3AHw=A3w{1:861,5};
 E_3AHw=E_3AHw(indices);
 B_4BHw=A3w{1:861,8};
 B_4BHw=B_4BHw(indices);
 D_4AHw=A3w{1:861,9};
 D_4AHw=D_4AHw(indices);
 D_1CHw=A3w{1:861,10};
 D_1CHw=D_1CHw(indices);
 
 
     fid = fopen('NORNE_ATW2013.RSM','rt');
 A4w = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',50483));%(Wells-B-4DH,E-3CH,E-2AH,D-3BH,B-1BH,K-3H)
fclose(fid); 
 
 B_4DHw=A4w{1:861,3};
 B_4DHw=B_4DHw(indices);
 E_3CHw=A4w{1:861,5};
 E_3CHw=E_3CHw(indices);
 E_2AHw=A4w{1:861,6};
 E_2AHw=E_2AHw(indices);
 D_3BHw=A4w{1:861,7};
 D_3BHw=D_3BHw(indices);
 B_1BHw=A4w{1:861,9};
 B_1BHw=B_1BHw(indices);
 K_3Hw=A4w{1:861,10};
 K_3Hw=K_3Hw(indices);

%% Import for Gas production rate
disp(' Get the Well Gas Production Rate')
    %A1g = importdata('NORNE_ATW2013.RSM',' ',54833); %(Wells-B-2H,D-1H,D-2H,B-4H,D-4H,E-3H)
 fid = fopen('NORNE_ATW2013.RSM','rt');
 A1g = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',54833));%(Wells-B-2H,D-1H,D-2H,B-4H,D-4H,E-3H)
fclose(fid);    

 B_2Hg=A1g{1:861,3};
 B_2Hg=B_2Hg(indices);
 
 D_1Hg=A1g{1:861,4};
  D_1Hg=D_1Hg(indices);
 D_2Hg=A1g{1:861,5};
 D_2Hg=D_2Hg(indices);
 B_4Hg=A1g{1:861,6};
 B_4Hg=B_4Hg(indices);
 D_4Hg=A1g{1:861,7};
 D_4Hg=D_4Hg(indices);
 E_3Hg=A1g{1:861,9};
 E_3Hg=E_3Hg(indices);
 
 fid = fopen('NORNE_ATW2013.RSM','rt');
A2g = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',55703));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid);

 B_1Hg=A2g{:,2};
 B_1Hg=B_1Hg(1:861,:);
 B_1Hg=B_1Hg(indices);
 
 B_3Hg=A2g{:,5};
 B_3Hg=B_3Hg(1:861,:);
 B_3Hg=B_3Hg(indices);
  
 E_1Hg=A2g{:,6};
 E_1Hg=E_1Hg(1:861,:);
  E_1Hg=E_1Hg(indices);
  
 E_2Hg=A2g{:,8};
 E_2Hg=E_2Hg(1:861,:);
 E_2Hg=E_2Hg(indices);
 
 E_4AHg=A2g{:,10};
 E_4AHg=E_4AHg(1:861,:);
 E_4AHg=E_4AHg(indices);
 

 fid = fopen('NORNE_ATW2013.RSM','rt');
 A3g = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',56573));%(Wells-D-3AH,E-3AH,B-4BH,D-4AH,D-1CH)
fclose(fid);  
 D_3AHg=A3g{1:861,3};
 D_3AHg= D_3AHg(indices);
 
 E_3AHg=A3g{1:861,5};
 E_3AHg= E_3AHg(indices);
 
 B_4BHg=A3g{1:861,8};
 B_4BHg= B_4BHg(indices);
 
 D_4AHg=A3g{1:861,9};
 D_4AHg= D_4AHg(indices);
 D_1CHg=A3g{1:861,10};
 D_1CHg= D_1CHg(indices);
 
  fid = fopen('NORNE_ATW2013.RSM','rt');
 A4g  = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',57443));%(Wells-B-4DH,E-3CH,E-2AH,D-3BH,B-1BH,K-3H)
fclose(fid);  
 B_4DHg=A4g{1:861,3};
 B_4DHg=B_4DHg(indices);
 
 E_3CHg=A4g{1:861,5};
 E_3CHg=E_3CHg(indices);
 
 E_2AHg=A4g{1:861,6};
 E_2AHg=E_2AHg(indices);
 
 D_3BHg=A4g{1:861,7};
 D_3BHg=D_3BHg(indices);
 
 B_1BHg=A4g{1:861,9};
 B_1BHg=B_1BHg(indices);
 
 K_3Hg=A4g{1:861,10};
 K_3Hg=K_3Hg(indices);
 clem=1:861;
 grey = [0.4,0.4,0.4]; 
 linecolor1 = colordg(3);
datax=(1:248).';
 %time2=Time(:,1:50:numel
 %% Import for Water injection rate
disp(' Get the Well Injection Rate')
    %A1win = importdata('NORNE_ATW2013.RSM',' ',72237); %(Wells-B-2H,D-1H,D-2H,B-4H,D-4H,E-3H)
    fid = fopen('NORNE_ATW2013.RSM','rt');
A1win = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',72237));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid); 

 C_1Hwin=A1win{1:861,2};
 C_1Hwin=C_1Hwin(indices);
 
 C_2Hwin=A1win{1:861,3};
 C_2Hwin=C_2Hwin(indices);
 C_3Hwin=A1win{1:861,4};
 C_3Hwin=C_3Hwin(indices);
 C_4Hwin=A1win{1:861,5};
 C_4Hwin=C_4Hwin(indices);
 C_4AHwin=A1win{1:861,6};
 C_4AHwin=C_4AHwin(indices);
 F_1Hwin=A1win{1:861,7};
 F_1Hwin=F_1Hwin(indices);
 
 F_2Hwin=A1win{1:861,8};
 F_2Hwin=F_2Hwin(indices);
 
 F_3Hwin=A1win{1:861,9};
 F_3Hwin=F_3Hwin(indices);
 F_4Hwin=A1win{1:861,10};
 F_4Hwin=F_4Hwin(indices);
 
 %% Import for Gas injection rate
disp(' Get the Well Gas injection  Rate')

fid = fopen('NORNE_ATW2013.RSM','rt');
A1gin = (textscan(fid,'%s%f%f%f%f%f%f%f%f%f','HeaderLines',73977));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid);

 C_1Hgin=A1gin{:,2};
 C_1Hgin=C_1Hgin(1:861,:);
 C_1Hgin=C_1Hgin(indices);
 
 C_3Hgin=A1gin{:,4};
 C_3Hgin=C_3Hgin(1:861,:);
 C_3Hgin=C_3Hgin(indices);
 
 C_4Hgin=A1gin{:,5};
 C_4Hgin=C_4Hgin(1:861,:);
  C_4Hgin=C_4Hgin(indices);
  
 C_4AHgin=A1gin{:,6};
C_4AHgin=C_4AHgin(1:861,:);
 C_4AHgin=C_4AHgin(indices);
 

 %% Extract the simulated data
 oldfolder=cd;
cd(oldfolder) % setting original directory
  disp(' Get the simulated data for all ensemble  ');
   for i=1:N %list of folders 
   f = 'Realization_';
    folder = strcat(f, sprintf('%d',i)); 
    cd(folder);
 %%IMPORT FOR OIL       
fid = fopen('FULLNORNE.RSM','rt');
A2oilsim = (textscan(fid,'%f%f%f%f%f%f%f%f%f%f','HeaderLines',9));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid);

  B_2Hoilsim=A2oilsim{:,3};
  B_2Hoilsim= B_2Hoilsim(1:248,:);
  B_4Hoilsim=A2oilsim{:,4};
  B_4Hoilsim= B_4Hoilsim(1:248,:);
  B_1Hoilsim=A2oilsim{:,5};
  B_1Hoilsim= B_1Hoilsim(1:248,:);
  B_3Hoilsim=A2oilsim{:,6};
  B_3Hoilsim= B_3Hoilsim(1:248,:);
  B_4BHoilsim=A2oilsim{:,7};
  B_4BHoilsim= B_4BHoilsim(1:248,:);
  B_4DHoilsim=A2oilsim{:,8};
  B_4DHoilsim= B_4DHoilsim(1:248,:);
  B_1BHoilsim=A2oilsim{:,9};
  B_1BHoilsim= B_1BHoilsim(1:248,:);
  D_1Hoilsim=A2oilsim{:,10};
  D_1Hoilsim= D_1Hoilsim(1:248,:);
  
fid = fopen('FULLNORNE.RSM','rt');
A22oilsim = (textscan(fid,'%f%f%f%f%f%f%f%f%f%f','HeaderLines',266));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid);

  D_2Hoilsim=A22oilsim{:,2};
  D_2Hoilsim= D_2Hoilsim(1:248,:);
  D_4Hoilsim=A22oilsim{:,3};
  D_4Hoilsim= D_4Hoilsim(1:248,:);
  D_3AHoilsim=A22oilsim{:,4};
  D_3AHoilsim= D_3AHoilsim(1:248,:);
  D_4AHoilsim=A22oilsim{:,5};
  D_4AHoilsim= D_4AHoilsim(1:248,:);
  D_1CHoilsim=A22oilsim{:,6};
  D_1CHoilsim= D_1CHoilsim(1:248,:);
  D_3BHoilsim=A22oilsim{:,7};
  D_3BHoilsim= D_3BHoilsim(1:248,:);
  E_3Hoilsim=A22oilsim{:,8};
  E_3Hoilsim= E_3Hoilsim(1:248,:);
  E_1Hoilsim=A22oilsim{:,9};
  E_1Hoilsim= E_1Hoilsim(1:248,:);
  E_2Hoilsim=A22oilsim{:,10};
  E_2Hoilsim= E_2Hoilsim(1:248,:);
  
  
 fid = fopen('FULLNORNE.RSM','rt');
A222oilsim = (textscan(fid,'%f%f%f%f%f%f%f%f%f%f','HeaderLines',523));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid);

  E_4AHoilsim=A222oilsim{:,2};
  E_4AHoilsim= E_4AHoilsim(1:248,:);
  E_3AHoilsim=A222oilsim{:,3};
  E_3AHoilsim= E_3AHoilsim(1:248,:);
  E_3CHoilsim=A222oilsim{:,4};
  E_3CHoilsim= E_3CHoilsim(1:248,:);
  E_2AHoilsim=A222oilsim{:,5};
  E_2AHoilsim= E_2AHoilsim(1:248,:);
  K_3Hoilsim=A222oilsim{:,6};
  K_3Hoilsim= K_3Hoilsim(1:248,:);
  
  
   %%IMPORT FOR WATER
  
fid = fopen('FULLNORNE.RSM','rt');
A222watersim = (textscan(fid,'%f%f%f%f%f%f%f%f%f%f','HeaderLines',780));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid);  
  B_2Hwatersim=A222oilsim{:,7};
  B_2Hwatersim=  B_2Hwatersim(1:248,:);
  B_4Hwatersim=A222oilsim{:,8};
  B_4Hwatersim=  B_4Hwatersim(1:248,:);
  B_1Hwatersim=A222oilsim{:,9};
  B_1Hwatersim=  B_1Hwatersim(1:248,:);
  B_3Hwatersim=A222oilsim{:,7};
  B_3Hwatersim=  B_3Hwatersim(1:248,:);
  B_4BHwatersim=A222watersim{:,2};
  B_4BHwatersim=  B_4BHwatersim(1:248,:);
  B_4DHwatersim=A222watersim{:,3};
  B_4DHwatersim=  B_4DHwatersim(1:248,:);
  B_1BHwatersim=A222watersim{:,4};
  B_1BHwatersim=  B_1BHwatersim(1:248,:);
  D_1Hwatersim=A222watersim{:,5};
  D_1Hwatersim=  D_1Hwatersim(1:248,:);
  D_2Hwatersim=A222watersim{:,6};
  D_2Hwatersim =D_2Hwatersim(1:248,:);
  D_4Hwatersim=A222watersim{:,7};
  D_4Hwatersim=  D_4Hwatersim(1:248,:);
  D_3AHwatersim=A222watersim{:,8};
  D_3AHwatersim=  D_3AHwatersim(1:248,:);
  D_4AHwatersim=A222watersim{:,9};
  D_4AHwatersim=  D_4AHwatersim(1:248,:);
  D_1CHwatersim=A222watersim{:,10};
  D_1CHwatersim=  D_1CHwatersim(1:248,:);
  
  fid = fopen('FULLNORNE.RSM','rt');
A2222watersim = (textscan(fid,'%f%f%f%f%f%f%f%f%f%f','HeaderLines',1037));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid); 
 D_3BHwatersim=A2222watersim{:,2};
 D_3BHwatersim=  D_3BHwatersim(1:248,:);  
 E_3Hwatersim=A2222watersim{:,3};
 E_3Hwatersim=  E_3Hwatersim(1:248,:); 
 E_1Hwatersim=A2222watersim{:,4};
 E_1Hwatersim=  E_1Hwatersim(1:248,:); 
 E_2Hwatersim=A2222watersim{:,5};
 E_2Hwatersim=  E_2Hwatersim(1:248,:);  
 E_4AHwatersim=A2222watersim{:,6};
 E_4AHwatersim=  E_4AHwatersim(1:248,:);  
 E_3AHwatersim=A2222watersim{:,7};
 E_3AHwatersim=  E_3AHwatersim(1:248,:);  
 E_3CHwatersim=A2222watersim{:,8};
 E_3CHwatersim=  E_3CHwatersim(1:248,:);  
 E_2AHwatersim=A2222watersim{:,9};
 E_2AHwatersim=  E_2AHwatersim(1:248,:); 
 K_3Hwatersim=A2222watersim{:,10};
 K_3Hwatersim=  K_3Hwatersim(1:248,:); 
 

 %%GAS PRODUCTION RATE
 fid = fopen('FULLNORNE.RSM','rt');
A2gassim = (textscan(fid,'%f%f%f%f%f%f%f%f%f%f','HeaderLines',1294));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid); 
 B_2Hgassim=A2gassim{:,2};
 B_2Hgassim=  B_2Hgassim(1:248,:); 
  B_4Hgassim=A2gassim{:,3};
 B_4Hgassim=  B_4Hgassim(1:248,:); 
  B_1Hgassim=A2gassim{:,4};
 B_1Hgassim=  B_1Hgassim(1:248,:); 
  B_3Hgassim=A2gassim{:,5};
 B_3Hgassim=  B_3Hgassim(1:248,:); 
  B_4BHgassim=A2gassim{:,6};
 B_4BHgassim=  B_4BHgassim(1:248,:); 
  B_4DHgassim=A2gassim{:,7};
 B_4DHgassim=  B_4DHgassim(1:248,:); 
  B_1BHgassim=A2gassim{:,8};
 B_1BHgassim=  B_1BHgassim(1:248,:); 
 D_1Hgassim=A2gassim{:,9};
 D_1Hgassim=  D_1Hgassim(1:248,:); 
 D_2Hgassim=A2gassim{:,10};
 D_2Hgassim=  D_2Hgassim(1:248,:); 
 
 fid = fopen('FULLNORNE.RSM','rt');
A22gassim = (textscan(fid,'%f%f%f%f%f%f%f%f%f%f','HeaderLines',1551));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid); 
  D_4Hgassim=A22gassim{:,2};
 D_4Hgassim=  D_4Hgassim(1:248,:); 
  D_3AHgassim=A22gassim{:,3};
 D_3AHgassim=  D_3AHgassim(1:248,:); 
 D_4AHgassim=A22gassim{:,4};
 D_4AHgassim=  D_4AHgassim(1:248,:);  
 D_1CHgassim=A22gassim{:,5};
 D_1CHgassim=  D_1CHgassim(1:248,:); 
 D_3BHgassim=A22gassim{:,6};
 D_3BHgassim=  D_3BHgassim(1:248,:); 
 E_3Hgassim=A22gassim{:,7};
 E_3Hgassim=  E_3Hgassim(1:248,:); 
  E_1Hgassim=A22gassim{:,8};
 E_1Hgassim=  E_1Hgassim(1:248,:); 
  E_2Hgassim=A22gassim{:,9};
 E_2Hgassim=  E_2Hgassim(1:248,:); 
  E_4AHgassim=A22gassim{:,10};
 E_4AHgassim=  E_4AHgassim(1:248,:); 
 
  fid = fopen('FULLNORNE.RSM','rt');
A222gassim = (textscan(fid,'%f%f%f%f%f%f%f%f%f%f','HeaderLines',1808));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid); 
 E_3AHgassim=A222gassim{:,2};
 E_3AHgassim=  E_3AHgassim(1:248,:); 
 E_3CHgassim=A222gassim{:,3};
 E_3CHgassim=  E_3CHgassim(1:248,:); 
  E_2AHgassim=A222gassim{:,4};
 E_2AHgassim=  E_2AHgassim(1:248,:); 
  K_3Hgassim=A222gassim{:,5};
 K_3Hgassim=  K_3Hgassim(1:248,:); 
 
 %%WATER INJECTOR RATE
  C_4Hwaterinjsim=A222gassim{:,6};
 C_4Hwaterinjsim= C_4Hwaterinjsim(1:248,:); 
 C_1Hwaterinjsim=A222gassim{:,7};
 C_1Hwaterinjsim= C_1Hwaterinjsim(1:248,:); 
 C_2Hwaterinjsim=A222gassim{:,8};
 C_2Hwaterinjsim= C_2Hwaterinjsim(1:248,:); 
 C_3Hwaterinjsim=A222gassim{:,9};
 C_3Hwaterinjsim= C_3Hwaterinjsim(1:248,:); 
 F_1Hwaterinjsim=A222gassim{:,10};
 F_1Hwaterinjsim= F_1Hwaterinjsim(1:248,:); 
 
 fid = fopen('FULLNORNE.RSM','rt');
A2222gassim = (textscan(fid,'%f%f%f%f%f%f%f%f%f%f','HeaderLines',2065));%(Wells-B-1H, B-3H,E-1H,E-2H,E-4AH)
fclose(fid);
 F_2Hwaterinjsim=A2222gassim{:,2};
 F_2Hwaterinjsim= F_2Hwaterinjsim(1:248,:); 
 
 F_3Hwaterinjsim=A2222gassim{:,3};
 F_3Hwaterinjsim= F_3Hwaterinjsim(1:248,:); 
 F_4Hwaterinjsim=A2222gassim{:,4};
 F_4Hwaterinjsim= F_4Hwaterinjsim(1:248,:); 
 C_4AHwaterinjsim=A2222gassim{:,5};
 C_4AHwaterinjsim= C_4AHwaterinjsim(1:248,:); 
 

 %%GAS INJECTION RATE
 C_4Hgasinjsim=A2222gassim{:,6};
 C_4Hgasinjsim= C_4Hgasinjsim(1:248,:); 
 C_1Hgasinjsim=A2222gassim{:,7};
 C_1Hgasinjsim= C_1Hgasinjsim(1:248,:); 
  C_3Hgasinjsim=A2222gassim{:,8};
 C_3Hgasinjsim= C_3Hgasinjsim(1:248,:); 
  C_4AHgasinjsim=A2222gassim{:,9};
 C_4AHgasinjsim= C_4AHgasinjsim(1:248,:); 
 
 
  
    %OIL PRODUCTION RATE
    WOIL1(:,i)=B_2Hoilsim;
    WOIL2(:,i)=D_1Hoilsim;
    WOIL3(:,i)=D_2Hoilsim;
    WOIL4(:,i)=B_4Hoilsim;
    WOIL5(:,i)=D_4Hoilsim;
    WOIL6(:,i)=E_3Hoilsim;
    WOIL7(:,i)=B_1Hoilsim;
    WOIL8(:,i)=B_3Hoilsim;
    WOIL9(:,i)=E_1Hoilsim;
    WOIL10(:,i)=E_2Hoilsim;
    WOIL11(:,i)=E_4AHoilsim;
    WOIL12(:,i)=D_3AHoilsim;
    WOIL13(:,i)=E_3AHoilsim;
    WOIL14(:,i)=B_4BHoilsim;
    WOIL15(:,i)=D_4AHoilsim;
    WOIL16(:,i)=D_1CHoilsim;
    WOIL17(:,i)=B_4DHoilsim;
    WOIL18(:,i)=E_3CHoilsim;
    WOIL19(:,i)=E_2AHoilsim;
    WOIL20(:,i)=D_3BHoilsim;
    WOIL21(:,i)=B_1BHoilsim;
    WOIL22(:,i)=K_3Hoilsim;
    
   %WATER PRODUCTION RATE 
    WWATER1(:,i)=B_2Hwatersim;
    WWATER2(:,i)=D_1Hwatersim;
    WWATER3(:,i)=D_2Hwatersim;
    WWATER4(:,i)=B_4Hwatersim;
    WWATER5(:,i)=D_4Hwatersim;
    WWATER6(:,i)=E_3Hwatersim;
    WWATER7(:,i)=B_1Hwatersim;
    WWATER8(:,i)=B_3Hwatersim;
    WWATER9(:,i)=E_1Hwatersim;
    WWATER10(:,i)=E_2Hwatersim;
    WWATER11(:,i)=E_4AHwatersim;
    WWATER12(:,i)=D_3AHwatersim;
    WWATER13(:,i)=E_3AHwatersim;
    WWATER14(:,i)=B_4BHwatersim;
    WWATER15(:,i)=D_4AHwatersim;
    WWATER16(:,i)=D_1CHwatersim;
    WWATER17(:,i)=B_4DHwatersim;
    WWATER18(:,i)=E_3CHwatersim;
    WWATER19(:,i)=E_2AHwatersim;
    WWATER20(:,i)=D_3BHwatersim;
    WWATER21(:,i)=B_1BHwatersim;
    WWATER22(:,i)=K_3Hwatersim;
    
    %GAS PRODUCTION RATE 
    WGAS1(:,i)=B_2Hgassim;
    WGAS2(:,i)=D_1Hgassim;
    WGAS3(:,i)=D_2Hgassim;
    WGAS4(:,i)=B_4Hgassim;
    WGAS5(:,i)=D_4Hgassim;
    WGAS6(:,i)=E_3Hgassim;
    WGAS7(:,i)=B_1Hgassim;
    WGAS8(:,i)=B_3Hgassim;
    WGAS9(:,i)=E_1Hgassim;
    WGAS10(:,i)=E_2Hgassim;
    WGAS11(:,i)=E_4AHgassim;
    WGAS12(:,i)=D_3AHgassim;
    WGAS13(:,i)=E_3AHgassim;
    WGAS14(:,i)=B_4BHgassim;
    WGAS15(:,i)=D_4AHgassim;
    WGAS16(:,i)=D_1CHgassim;
    WGAS17(:,i)=B_4DHgassim;
    WGAS18(:,i)=E_3CHgassim;
    WGAS19(:,i)=E_2AHgassim;
    WGAS20(:,i)=D_3BHgassim;
    WGAS21(:,i)=B_1BHgassim;
    WGAS22(:,i)=K_3Hgassim;
    
    
    % WATER INJECTOR RATE
    WWATERINJ1(:,i)=C_1Hwaterinjsim;
    WWATERINJ2(:,i)=C_2Hwaterinjsim;
    WWATERINJ3(:,i)=C_3Hwaterinjsim;
    WWATERINJ4(:,i)=C_4Hwaterinjsim;
    WWATERINJ5(:,i)=C_4AHwaterinjsim;
    WWATERINJ6(:,i)=F_1Hwaterinjsim;
    WWATERINJ7(:,i)=F_2Hwaterinjsim;
    WWATERINJ8(:,i)=F_3Hwaterinjsim;
    WWATERINJ9(:,i)=F_4Hwaterinjsim;
   
      % GAS INJECTOR RATE
    WGASINJ1(:,i)=C_1Hgasinjsim;
    WGASINJ2(:,i)=C_3Hgasinjsim;
    WGASINJ3(:,i)=C_4Hgasinjsim;
    WGASINJ4(:,i)=C_4AHgasinjsim;
    
    cd(oldfolder);
    end
   cd(oldfolder) % returning to original directory
   
for i=1:N

    EOIL1(i,:)=immse(WOIL1(:,i),B_2H);
    EOIL2(i,:)=immse(WOIL2(:,i),D_1H);
    EOIL3(i,:)=immse(WOIL3(:,i),D_2H);
    EOIL4(i,:)=immse(WOIL4(:,i),B_4H);
	EOIL5(i,:)=immse(WOIL5(:,i),D_4H);
    EOIL6(i,:)=immse(WOIL6(:,i),E_3H);
	EOIL7(i,:)=immse(WOIL7(:,i),B_1H);
	EOIL8(i,:)=immse(WOIL8(:,i),B_3H);
    EOIL9(i,:)=immse(WOIL9(:,i),E_1H);
    EOIL10(i,:)=immse(WOIL10(:,i),E_2H);
    EOIL11(i,:)=immse(WOIL11(:,i),E_4AH);
    EOIL12(i,:)=immse(WOIL12(:,i),D_3AH);
    EOIL13(i,:)=immse(WOIL13(:,i),E_3AH);
    EOIL14(i,:)=immse(WOIL14(:,i),B_4BH);
    EOIL15(i,:)=immse(WOIL15(:,i),D_4AH);
    EOIL16(i,:)=immse(WOIL16(:,i),D_1CH);
    EOIL17(i,:)=immse(WOIL17(:,i),B_4DH);
    EOIL18(i,:)=immse(WOIL18(:,i),E_3CH);
    EOIL19(i,:)=immse(WOIL19(:,i),E_2AH);
    EOIL20(i,:)=immse(WOIL20(:,i),D_3BH);
    EOIL21(i,:)=immse(WOIL21(:,i),B_1BH);
    EOIL22(i,:)=immse(WOIL22(:,i),K_3H);
    
    
     EWATER1(i,:)=immse(WWATER1(:,i),B_2Hw);
     EWATER2(i,:)=immse(WWATER2(:,i),D_1Hw);
     EWATER3(i,:)=immse(WWATER3(:,i),D_2Hw);
     EWATER4(i,:)=immse(WWATER4(:,i),B_4Hw);
     EWATER5(i,:)=immse(WWATER5(:,i),D_4Hw);
     EWATER6(i,:)=immse(WWATER6(:,i),E_3Hw);
     EWATER7(i,:)=immse(WWATER7(:,i),B_1Hw);
     EWATER8(i,:)=immse(WWATER8(:,i),B_3Hw);
     EWATER9(i,:)=immse(WWATER9(:,i),E_1Hw);
     EWATER10(i,:)=immse(WWATER10(:,i),E_2Hw);
     EWATER11(i,:)=immse(WWATER11(:,i),E_4AHw);
     EWATER12(i,:)=immse(WWATER12(:,i),D_3AHw);
     EWATER13(i,:)=immse(WWATER13(:,i),E_3AHw);
     EWATER14(i,:)=immse(WWATER14(:,i),B_4BHw);
     EWATER15(i,:)=immse(WWATER15(:,i),D_4AHw);
     EWATER16(i,:)=immse(WWATER16(:,i),D_1CHw);
     EWATER17(i,:)=immse(WWATER17(:,i),B_4DHw);
     EWATER18(i,:)=immse(WWATER18(:,i),E_3CHw);
     EWATER19(i,:)=immse(WWATER19(:,i),E_2AHw);
     EWATER20(i,:)=immse(WWATER20(:,i),D_3BHw);
     EWATER21(i,:)=immse(WWATER21(:,i),B_1BHw);
     EWATER22(i,:)=immse(WWATER22(:,i),K_3Hw);
     
     
      EGAS1(i,:)=immse(WGAS1(:,i),B_2Hg);
     EGAS2(i,:)=immse(WGAS2(:,i),D_1Hg);
     EGAS3(i,:)=immse(WGAS3(:,i),D_2Hg);
     EGAS4(i,:)=immse(WGAS4(:,i),B_4Hg);
     EGAS5(i,:)=immse(WGAS5(:,i),D_4Hg);
     EGAS6(i,:)=immse(WGAS6(:,i),E_3Hg);
     EGAS7(i,:)=immse(WGAS7(:,i),B_1Hg);
     EGAS8(i,:)=immse(WGAS8(:,i),B_3Hg);
     EGAS9(i,:)=immse(WGAS9(:,i),E_1Hg);
     EGAS10(i,:)=immse(WGAS10(:,i),E_2Hg);
     EGAS11(i,:)=immse(WGAS11(:,i),E_4AHg);
     EGAS12(i,:)=immse(WGAS12(:,i),D_3AHg);
     EGAS13(i,:)=immse(WGAS13(:,i),E_3AHg);
     EGAS14(i,:)=immse(WGAS14(:,i),B_4BHg);
     EGAS15(i,:)=immse(WGAS15(:,i),D_4AHg);
     EGAS16(i,:)=immse(WGAS16(:,i),D_1CHg);
     EGAS17(i,:)=immse(WGAS17(:,i),B_4DHg);
     EGAS18(i,:)=immse(WGAS18(:,i),E_3CHg);
     EGAS19(i,:)=immse(WGAS19(:,i),E_2AHg);
     EGAS20(i,:)=immse(WGAS20(:,i),D_3BHg);
     EGAS21(i,:)=immse(WGAS21(:,i),B_1BHg);
     EGAS22(i,:)=immse(WGAS22(:,i),K_3Hg);
   
end
TOTALERROR=ones(N,1);
TOTALERROR=(EOIL1./std(B_2H))+(EOIL2./std(D_1H))+(EOIL3./std(D_2H))+(EOIL4./std(B_4H))...
    +(EOIL5./std(D_4H))+(EOIL6./std(E_3H))+(EOIL7./std(B_1H))+(EOIL8./std(B_3H))...
	+(EOIL9./std(E_1H))+(EOIL10./std(E_2H))+(EOIL11./std(E_4AH))+(EOIL12./std(D_3AH))...
    +(EOIL13./std(E_3AH))+(EOIL14./std(B_4BH))+(EOIL15./std(D_4AH))+(EOIL16./std(D_1CH))...
	+(EOIL17./std(B_4DH))+(EOIL18./std(E_3CH))+(EOIL19./std(E_2AH))+(EOIL20./std(D_3BH))...
    +(EOIL21./std(B_1BH))+(EOIL22./std(K_3H))+(EWATER1./std(B_2Hw))+(EWATER2./std(D_1Hw))+(EWATER3./std(D_2Hw))+(EWATER4./std(B_4Hw))...
    +(EWATER5./std(D_4Hw))+(EWATER6./std(E_3Hw))+(EWATER7./std(B_1Hw))+(EWATER8./std(B_3Hw))...
	+(EWATER9./std(E_1Hw))+(EWATER10./std(E_2Hw))+(EWATER11./std(E_4AHw))+(EWATER12./std(D_3AHw))...
    +(EWATER13./std(E_3AHw))+(EWATER14./std(B_4BHw))+(EWATER15./std(D_4AHw))+(EWATER16./std(D_1CHw))...
	+(EWATER17./std(B_4DHw))+(EWATER18./std(E_3CHw))+(EWATER19./std(E_2AHw))+(EWATER20./std(D_3BHw))...
    +(EWATER21./std(B_1BHw))+(EWATER22./std(K_3Hw))+(EGAS1./std(B_2Hg))+(EGAS2./std(D_1Hg))+(EGAS3./std(D_2Hg))+(EGAS4./std(B_4Hg))...
    +(EGAS5./std(D_4Hg))+(EGAS6./std(E_3Hg))+(EGAS7./std(B_1Hg))+(EGAS8./std(B_3Hg))...
	+(EGAS9./std(E_1Hg))+(EGAS10./std(E_2Hg))+(EGAS11./std(E_4AHg))+(EGAS12./std(D_3AHg))...
    +(EGAS13./std(E_3AHg))+(EGAS14./std(B_4BHg))+(EGAS15./std(D_4AHg))+(EGAS16./std(D_1CHg))...
	+(EGAS17./std(B_4DHg))+(EGAS18./std(E_3CHg))+(EGAS19./std(E_2AHg))+(EGAS20./std(D_3BHg))...
    +(EGAS21./std(B_1BHg))+(EGAS22./std(K_3Hg));
TOTALERROR=TOTALERROR./numel(timestep);
jj=min(TOTALERROR);
index = TOTALERROR; 
bestnorm = find(index == min(index));
	%Pssim = Pnew(:,bestssim); %best due to ssim
fprintf('The best Norm Realization for production data match is number %i with value %4.6f \n',bestnorm,jj);
% JOYLINE=[1:100]';
% figure()
%bar(JOYLINE,TOTALERROR);

reali=[1:N]';

 figure()
 bar(reali,index,'cyan');
 xlabel('Realizations', 'FontName','Helvetica', 'Fontsize', 13);
 ylabel('RMSE value', 'FontName','Helvetica', 'Fontsize', 13);
 title('Production data Cost function for Realizations','FontName','Helvetica', 'Fontsize', 13)
 set(gcf,'color', 'white');
 hold on
 scatter(reali,index,'black','filled');
  xlim([1,N]);
 xlabel('Realizations', 'FontName','Helvetica', 'Fontsize', 13)
 ylabel('RMSE value', 'FontName','Helvetica', 'Fontsize', 13)
  saveas(gcf,sprintf('RMS_iter%d.fig',inelly))
close(figure)

 disp('  program almost executed  ');
end