function plothistorymatching(timestep,N,inelly);
% oldfolder=cd;
% cd(oldfolder) % setting original directory
%% This function is to plot the resullt of all the ensemble members
indices=timestep;
% N=ensemble size
%%
disp(' Get the Well Oil Production Rate')
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
 %Import true data
 
 linecolor1 = colordg(4);
 
 %% Plot for Well oil production rates
%% 
figure()
plot((WOIL1(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-2H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_2H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilB-2H%d.fig',inelly))
close(figure)

figure()
plot((WOIL2(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_1H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilD-1H%d.fig',inelly))
close(figure)

figure()
plot((WOIL3(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-2H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_2H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilD-2H%d.fig',inelly))
close(figure)

figure()
plot((WOIL4(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_4H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilB-4H%d.fig',inelly))
close(figure)


figure()
plot((WOIL5(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-4H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_4H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilD-4H%d.fig',inelly))
close(figure)

figure()
plot((WOIL6(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-3H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_3H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilE-3H%d.fig',inelly))
close(figure)

figure()
plot((WOIL7(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_1H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilB-1H%d.fig',inelly))
close(figure)

figure()
plot((WOIL8(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-3H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_3H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilB-3H%d.fig',inelly))
close(figure)

figure()
plot((WOIL9(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_1H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilE-1H%d.fig',inelly))
close(figure)

figure()
plot((WOIL10(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-2H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_2H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilE-2H%d.fig',inelly))
close(figure)

figure()
plot((WOIL11(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-4AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_4AH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilE-4AH%d.fig',inelly))
close(figure)


figure()
plot((WOIL12(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-3AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_3AH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilD-3AH%d.fig',inelly))
close(figure)

figure()
plot((WOIL13(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-3AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_3AH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilE-3AH%d.fig',inelly))
close(figure)

figure()
plot((WOIL14(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-4BH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_4BH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilD-1H%d.fig',inelly))
close(figure)

figure()
plot((WOIL15(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-4AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_4AH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilD-4AH%d.fig',inelly))
close(figure)

figure()
plot((WOIL16(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-1CH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_1CH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilD-1CH%d.fig',inelly))
close(figure)

figure()
plot((WOIL17(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-4DH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_4DH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilB-4DH%d.fig',inelly))
close(figure)

figure()
plot((WOIL18(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-3CH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_3CH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilE-3CH%d.fig',inelly))
close(figure)

figure()
plot((WOIL19(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-2AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_2AH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilE-2AH%d.fig',inelly))
close(figure)

figure()
plot((WOIL20(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-3BH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_3BH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilD-3BH%d.fig',inelly))
close(figure)

figure()
plot((WOIL21(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-1BH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_1BH),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilB-1BH%d.fig',inelly))
close(figure)

figure()
plot((WOIL22(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_o(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well K-3H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((K_3H),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('oilK-3H%d.fig',inelly))
close(figure)

%% Plot for Well water injection rates
figure()
plot((WWATER1(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-2H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_2Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterB-2H%d.fig',inelly))
close(figure)


figure()
plot((WWATER2(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_1Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterD-1H%d.fig',inelly))
close(figure)

figure()
plot((WWATER3(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-2H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_2Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterD-2H%d.fig',inelly))
close(figure)

figure()
plot((WWATER4(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-4H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_4Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterB-4H%d.fig',inelly))
close(figure)

figure()
plot((WWATER5(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-4H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_4Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterD-2H%d.fig',inelly))
close(figure)

figure()
plot((WWATER6(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-3H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_3Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterE-3H%d.fig',inelly))
close(figure)

figure()
plot((WWATER7(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_1Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterB-1H%d.fig',inelly))
close(figure)

figure()
plot((WWATER8(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-3H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_3Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterB-3H%d.fig',inelly))
close(figure)

figure()
plot((WWATER9(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_1Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterE-1H%d.fig',inelly))
close(figure)

figure()
plot((WWATER10(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-2H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_2Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterE-2H%d.fig',inelly))
close(figure)

figure()
plot((WWATER11(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-4AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_4AHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterE-4AH%d.fig',inelly))
close(figure)


figure()
plot((WWATER12(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-3AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_3AHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterD-3AH%d.fig',inelly))
close(figure)

figure()
plot((WWATER13(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-3AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_3AHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterE-3AH%d.fig',inelly))
close(figure)

figure()
plot((WWATER14(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_4BHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterB-4BH%d.fig',inelly))
close(figure)

figure()
plot((WWATER15(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-4AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_4AHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterD-4AH%d.fig',inelly))
close(figure)

figure()
plot((WWATER16(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-1CH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_1CHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterD-1CH%d.fig',inelly))
close(figure)

figure()
plot((WWATER17(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-4DH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_4DHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterB-4DH%d.fig',inelly))
close(figure)

figure()
plot((WWATER18(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-3CH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_3CHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterE-3CH%d.fig',inelly))
close(figure)

figure()
plot((WWATER19(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-2AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_2AHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterE-2AH%d.fig',inelly))
close(figure)

figure()
plot((WWATER20(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-3BH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_3BHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterD-3BH%d.fig',inelly))
close(figure)

figure()
plot((WWATER21(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-1BH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_1BHw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterB-1BH%d.fig',inelly))
close(figure)

figure()
plot((WWATER22(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_w(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well K-3H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((K_3Hw),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('waterK-3H%d.fig',inelly))
close(figure)

%% Plot for Well Gas production Rate
figure()
plot((WGAS1(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-2H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_2Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasB-2H%d.fig',inelly))
close(figure)

figure()
plot((WGAS2(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_1Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasD-1H%d.fig',inelly))
close(figure)


figure()
plot((WGAS3(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-2H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_2Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasD-2H%d.fig',inelly))
close(figure)


figure()
plot((WGAS4(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-4H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_4Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasB-4H%d.fig',inelly))
close(figure)

figure()
plot((WGAS5(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-4H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_4Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasD-4H%d.fig',inelly))
close(figure)

figure()
plot((WGAS6(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-3H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_3Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasE-3H%d.fig',inelly))
close(figure)


figure()
plot((WGAS7(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_1Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasB-1H%d.fig',inelly))
close(figure)

figure()
plot((WGAS8(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-3H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_3Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasB-3H%d.fig',inelly))
close(figure)


figure()
plot((WGAS9(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-1H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_1Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasE-1H%d.fig',inelly))
close(figure)


figure()
plot((WGAS10(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-2H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_2Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasE-2H%d.fig',inelly))
close(figure)


figure()
plot((WGAS11(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-4AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_4AHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasE-4AH%d.fig',inelly))
close(figure)


figure()
plot((WGAS12(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-3AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_3AHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasD-3AH%d.fig',inelly))
close(figure)


figure()
plot((WGAS13(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-3AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_3AHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasE-3AH%d.fig',inelly))
close(figure)

figure()
plot((WGAS14(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-4BH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_4BHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasB-4BH%d.fig',inelly))
close(figure)


figure()
plot((WGAS15(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-4AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_4AHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasD-4AH%d.fig',inelly))
close(figure)

figure()
plot((WGAS16(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-1CH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_1CHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasD-1CH%d.fig',inelly))
close(figure)


figure()
plot((WGAS17(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-4DH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_4DHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasB-4DH%d.fig',inelly))
close(figure)


figure()
plot((WGAS18(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-3CH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_3CHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasE-3CH%d.fig',inelly))
close(figure)


figure()
plot((WGAS19(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well E-2AH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((E_2AHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasE-2AH%d.fig',inelly))
close(figure)


figure()
plot((WGAS20(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well D-3BH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((D_3BHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasD-3BH%d.fig',inelly))
close(figure)

figure()
plot((WGAS21(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well B-1BH','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((B_1BHg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasB-1BH%d.fig',inelly))
close(figure)


figure()
plot((WGAS22(:,1:N)),'Color',linecolor1,'LineWidth',2)
set(gca,'xtick',1:30:248);
set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
ylabel('Q_g(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
xtickangle(45)
title('Well K-3H','FontName','Helvetica', 'Fontsize', 13)
a = get(gca,'Children');
hold on
plot((K_3Hg),'r','LineWidth',2)
b = get(gca,'Children');
set(gcf,'color','white')
h = [b;a];
legend(h,'True model','Realisations','location','northeast');
hold off
saveas(gcf,sprintf('gasK-3H%d.fig',inelly))
close(figure)


%% Plot for Well Injection Rate
% figure()
% plot((WWATERINJ1(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Water Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well C-1H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((C_1Hwin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injwaterC-1H%d.fig',inelly))
% close(figure)
% 
% 
% figure()
% plot((WWATERINJ2(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Water Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well C-2H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((C_2Hwin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injwaterC-2H%d.fig',inelly))
% close(figure)
% 
% figure()
% plot((WWATERINJ3(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Water Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well C-3H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((C_3Hwin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injwaterC-3H%d.fig',inelly))
% close(figure)
% 
% figure()
% plot((WWATERINJ4(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Water Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well C-4H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((C_4Hwin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injwaterC-4H%d.fig',inelly))
% close(figure)
% 
% figure()
% plot((WWATERINJ5(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Water Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well C-4AH','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((C_4AHwin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injwaterC-4AH%d.fig',inelly))
% close(figure)
% 
% figure()
% plot((WWATERINJ6(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Water Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well F-1H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((F_1Hwin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injwaterF-1H%d.fig',inelly))
% close(figure)
% 
% figure()
% plot((WWATERINJ7(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Water Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well F-2H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((F_2Hwin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injwaterF-2H%d.fig',inelly))
% close(figure)
% 
% figure()
% plot((WWATERINJ8(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Water Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well F-3H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((F_3Hwin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injwaterF-3H%d.fig',inelly))
% close(figure)
% 
% figure()
% plot((WWATERINJ9(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Water Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well F-4H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((F_4Hwin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injwaterF-4H%d.fig',inelly))
% close(figure)
% 
% %% Plot for Gas Well Injection Rate
% figure()
% plot((WGASINJ1(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Gas Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well C-1H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((C_1Hgin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injgasC-1H%d.fig',inelly))
% close(figure)
% 
% figure()
% plot((WGASINJ2(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Gas Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well C-3H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((C_3Hgin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injgasC-3H%d.fig',inelly))
% close(figure)
% 
% figure()
% plot((WGASINJ3(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Gas Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well C-4H','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((C_4Hgin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injgasC-4H%d.fig',inelly))
% close(figure)
% 
% figure()
% plot((WGASINJ4(:,1:N)),'Color',linecolor1,'LineWidth',2)
% set(gca,'xtick',1:30:248);
% set(gca,'XTickLabel',dd(1:30:248).','FontName','Helvetica', 'Fontsize', 8)
% xlabel('Time (Dates)','FontName','Helvetica', 'Fontsize', 13);
% ylabel('Gas Injection Rate(Sm^{3}/day)','FontName','Helvetica', 'Fontsize', 13);
% xtickangle(45)
% title('Well C-4AH','FontName','Helvetica', 'Fontsize', 13)
% a = get(gca,'Children');
% hold on
% plot((C_4AHgin),'r','LineWidth',2)
% b = get(gca,'Children');
% set(gcf,'color','white')
% h = [b;a];
% legend(h,'True model','Realisations','location','northeast');
% hold off
% saveas(gcf,sprintf('injgasC-4AH%d.fig',inelly))
% close(figure)

end
