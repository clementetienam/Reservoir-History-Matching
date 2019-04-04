function observation=gethistorydata(timestep,measurements,history);
%% This function is to get the historical production data
indices=timestep;
% measurements=79;
% history=timestep;
disp(' Get the historical data  ');
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
 
 %% Get the historcial data into an Ascii file
 disp(' make the true observation')
 % 79 measurments with 248 historical data timestep
 %history=248;
 for ihistory=1:history
 obs=zeros(measurements,1);
 obs(1,:)=B_2H(ihistory,:);
 obs(2,:)=D_1H(ihistory,:);
 obs(3,:)=D_2H(ihistory,:);
 obs(4,:)=B_4H(ihistory,:);
 obs(5,:)=D_4H(ihistory,:);
 obs(6,:)=E_3H(ihistory,:);
 obs(7,:)=B_1H(ihistory,:);
 obs(8,:)=B_3H(ihistory,:);
 obs(9,:)=E_1H(ihistory,:);
 obs(10,:)=E_2H(ihistory,:);
 obs(11,:)=E_4AH(ihistory,:);
 obs(12,:)=D_3AH(ihistory,:);
 obs(13,:)=E_3AH(ihistory,:);
 obs(14,:)=B_4BH(ihistory,:);
 obs(15,:)=D_4AH(ihistory,:);
 obs(16,:)=D_1CH(ihistory,:);
 obs(17,:)=B_4DH(ihistory,:);
 obs(18,:)=E_3CH(ihistory,:);
 obs(19,:)=E_2AH(ihistory,:);
 obs(20,:)=D_3BH(ihistory,:);
 obs(21,:)=B_1BH(ihistory,:);
 obs(22,:)=K_3H(ihistory,:);
 obs(23,:)=B_2Hw(ihistory,:);
 obs(24,:)=D_1Hw(ihistory,:);
 obs(25,:)=D_2Hw(ihistory,:);
 obs(26,:)=B_4Hw(ihistory,:);
 obs(27,:)=D_4Hw(ihistory,:);
 obs(28,:)=E_3Hw(ihistory,:);
 obs(29,:)=B_1Hw(ihistory,:);
 obs(30,:)=B_3Hw(ihistory,:);
 obs(31,:)=E_1Hw(ihistory,:);
 obs(32,:)=E_2Hw(ihistory,:);
 obs(33,:)=E_4AHw(ihistory,:);
 obs(34,:)=D_3AHw(ihistory,:);
 obs(35,:)=E_3AHw(ihistory,:);
 obs(36,:)=B_4BHw(ihistory,:);
 obs(37,:)=D_4AHw(ihistory,:);
 obs(38,:)=D_1CHw(ihistory,:);
 obs(39,:)=B_4DHw(ihistory,:);
 obs(40,:)=E_3CHw(ihistory,:);
 obs(41,:)=E_2AHw(ihistory,:);
 obs(42,:)=D_3BHw(ihistory,:);
 obs(43,:)=B_1BHw(ihistory,:);
 obs(44,:)=K_3Hw(ihistory,:);
 obs(45,:)=B_2Hg(ihistory,:);
 obs(46,:)=D_1Hg(ihistory,:);
 obs(47,:)=D_2Hg(ihistory,:);
 obs(48,:)=B_4Hg(ihistory,:);
 obs(49,:)=D_4Hg(ihistory,:);
 obs(50,:)=E_3Hg(ihistory,:);
 obs(51,:)=B_1Hg(ihistory,:);
 obs(52,:)=B_3Hg(ihistory,:);
 obs(53,:)=E_1Hg(ihistory,:);
 obs(54,:)=E_2Hg(ihistory,:);
 obs(55,:)=E_4AHg(ihistory,:);
 obs(56,:)=D_3AHg(ihistory,:);
 obs(57,:)=E_3AHg(ihistory,:);
 obs(58,:)=B_4BHg(ihistory,:);
 obs(59,:)=D_4AHg(ihistory,:);
 obs(60,:)=D_1CHg(ihistory,:);
 obs(61,:)=B_4DHg(ihistory,:);
 obs(62,:)=E_3CHg(ihistory,:);
 obs(63,:)=E_2AHg(ihistory,:);
 obs(64,:)=D_3BHg(ihistory,:);
 obs(65,:)=B_1BHg(ihistory,:);
 obs(66,:)=K_3Hg(ihistory,:);
 obs(67,:)=C_1Hwin(ihistory,:);
 obs(68,:)=C_2Hwin(ihistory,:);
 obs(69,:)=C_3Hwin(ihistory,:);
 obs(70,:)=C_4Hwin(ihistory,:);
 obs(71,:)=C_4AHwin(ihistory,:);
 obs(72,:)=F_1Hwin(ihistory,:);
 obs(73,:)=F_2Hwin(ihistory,:);
 obs(74,:)=F_3Hwin(ihistory,:);
 obs(75,:)=F_4Hwin(ihistory,:);
 obs(76,:)=C_1Hgin(ihistory,:);
 obs(77,:)=C_3Hgin(ihistory,:);
 obs(78,:)=C_4Hgin(ihistory,:);
 obs(79,:)=C_4AHgin(ihistory,:);
 observation(:,ihistory)=obs;
 end
 
end