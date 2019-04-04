function overallsim=getsimulated(timestep,N,history);
%% This function is to get al the simulated data for the ensemble members for all the timesteps at once
disp(' Author: Clement Etienam-PhD Visiting researcher,University of Manchester,July,2018')
disp('Supervisor: Profesor Colin Macbeth')
%% Extract the simulated data
 oldfolder=cd;
cd(oldfolder) % setting original directory
overallsim=zeros(79,history,N);
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
    WOIL1=B_2Hoilsim;
    WOIL2=D_1Hoilsim;
    WOIL3=D_2Hoilsim;
    WOIL4=B_4Hoilsim;
    WOIL5=D_4Hoilsim;
    WOIL6=E_3Hoilsim;
    WOIL7=B_1Hoilsim;
    WOIL8=B_3Hoilsim;
    WOIL9=E_1Hoilsim;
    WOIL10=E_2Hoilsim;
    WOIL11=E_4AHoilsim;
    WOIL12=D_3AHoilsim;
    WOIL13=E_3AHoilsim;
    WOIL14=B_4BHoilsim;
    WOIL15=D_4AHoilsim;
    WOIL16=D_1CHoilsim;
    WOIL17=B_4DHoilsim;
    WOIL18=E_3CHoilsim;
    WOIL19=E_2AHoilsim;
    WOIL20=D_3BHoilsim;
    WOIL21=B_1BHoilsim;
    WOIL22=K_3Hoilsim;
    
   %WATER PRODUCTION RATE 
    WWATER1=B_2Hwatersim;
    WWATER2=D_1Hwatersim;
    WWATER3=D_2Hwatersim;
    WWATER4=B_4Hwatersim;
    WWATER5=D_4Hwatersim;
    WWATER6=E_3Hwatersim;
    WWATER7=B_1Hwatersim;
    WWATER8=B_3Hwatersim;
    WWATER9=E_1Hwatersim;
    WWATER10=E_2Hwatersim;
    WWATER11=E_4AHwatersim;
    WWATER12=D_3AHwatersim;
    WWATER13=E_3AHwatersim;
    WWATER14=B_4BHwatersim;
    WWATER15=D_4AHwatersim;
    WWATER16=D_1CHwatersim;
    WWATER17=B_4DHwatersim;
    WWATER18=E_3CHwatersim;
    WWATER19=E_2AHwatersim;
    WWATER20=D_3BHwatersim;
    WWATER21=B_1BHwatersim;
    WWATER22=K_3Hwatersim;
    
    %GAS PRODUCTION RATE 
    WGAS1=B_2Hgassim;
    WGAS2=D_1Hgassim;
    WGAS3=D_2Hgassim;
    WGAS4=B_4Hgassim;
    WGAS5=D_4Hgassim;
    WGAS6=E_3Hgassim;
    WGAS7=B_1Hgassim;
    WGAS8=B_3Hgassim;
    WGAS9=E_1Hgassim;
    WGAS10=E_2Hgassim;
    WGAS11=E_4AHgassim;
    WGAS12=D_3AHgassim;
    WGAS13=E_3AHgassim;
    WGAS14=B_4BHgassim;
    WGAS15=D_4AHgassim;
    WGAS16=D_1CHgassim;
    WGAS17=B_4DHgassim;
    WGAS18=E_3CHgassim;
    WGAS19=E_2AHgassim;
    WGAS20=D_3BHgassim;
    WGAS21=B_1BHgassim;
    WGAS22=K_3Hgassim;
    
    
    % WATER INJECTOR RATE
    WWATERINJ1=C_1Hwaterinjsim;
    WWATERINJ2=C_2Hwaterinjsim;
    WWATERINJ3=C_3Hwaterinjsim;
    WWATERINJ4=C_4Hwaterinjsim;
    WWATERINJ5=C_4AHwaterinjsim;
    WWATERINJ6=F_1Hwaterinjsim;
    WWATERINJ7=F_2Hwaterinjsim;
    WWATERINJ8=F_3Hwaterinjsim;
    WWATERINJ9=F_4Hwaterinjsim;
   
      % GAS INJECTOR RATE
    WGASINJ1=C_1Hgasinjsim;
    WGASINJ2=C_3Hgasinjsim;
    WGASINJ3=C_4Hgasinjsim;
    WGASINJ4=C_4AHgasinjsim;
   
 for ii=1:history
 obs=zeros(79,1);
 obs(1,:)=WOIL1(ii,:);
 obs(2,:)=WOIL2(ii,:);
 obs(3,:)=WOIL3(ii,:);
 obs(4,:)=WOIL4(ii,:);
 obs(5,:)=WOIL5(ii,:);
 obs(6,:)=WOIL6(ii,:);
 obs(7,:)=WOIL7(ii,:);
 obs(8,:)=WOIL8(ii,:);
 obs(9,:)=WOIL9(ii,:);
 obs(10,:)=WOIL10(ii,:);
 obs(11,:)=WOIL11(ii,:);
 obs(12,:)=WOIL12(ii,:);
 obs(13,:)=WOIL13(ii,:);
 obs(14,:)=WOIL14(ii,:);
 obs(15,:)=WOIL15(ii,:);
 obs(16,:)=WOIL16(ii,:);
 obs(17,:)=WOIL17(ii,:);
 obs(18,:)=WOIL18(ii,:);
 obs(19,:)=WOIL19(ii,:);
 obs(20,:)=WOIL20(ii,:);
 obs(21,:)=WOIL21(ii,:);
 obs(22,:)=WOIL22(ii,:);
 obs(23,:)=WWATER1(ii,:);
 obs(24,:)=WWATER2(ii,:);
 obs(25,:)=WWATER3(ii,:);
 obs(26,:)=WWATER4(ii,:);
 obs(27,:)=WWATER5(ii,:);
 obs(28,:)=WWATER6(ii,:);
 obs(29,:)=WWATER7(ii,:);
 obs(30,:)=WWATER8(ii,:);
 obs(31,:)=WWATER9(ii,:);
 obs(32,:)=WWATER10(ii,:);
 obs(33,:)=WWATER11(ii,:);
 obs(34,:)=WWATER12(ii,:);
 obs(35,:)=WWATER13(ii,:);
 obs(36,:)=WWATER14(ii,:);
 obs(37,:)=WWATER15(ii,:);
 obs(38,:)=WWATER16(ii,:);
 obs(39,:)=WWATER17(ii,:);
 obs(40,:)=WWATER18(ii,:);
 obs(41,:)=WWATER19(ii,:);
 obs(42,:)=WWATER20(ii,:);
 obs(43,:)=WWATER21(ii,:);
 obs(44,:)=WWATER22(ii,:);
 obs(45,:)=WGAS1(ii,:);
 obs(46,:)=WGAS2(ii,:);
 obs(47,:)=WGAS3(ii,:);
 obs(48,:)=WGAS4(ii,:);
 obs(49,:)=WGAS5(ii,:);
 obs(50,:)=WGAS6(ii,:);
 obs(51,:)=WGAS7(ii,:);
 obs(52,:)=WGAS8(ii,:);
 obs(53,:)=WGAS9(ii,:);
 obs(54,:)=WGAS10(ii,:);
 obs(55,:)=WGAS11(ii,:);
 obs(56,:)=WGAS12(ii,:);
 obs(57,:)=WGAS13(ii,:);
 obs(58,:)=WGAS14(ii,:);
 obs(59,:)=WGAS15(ii,:);
 obs(60,:)=WGAS16(ii,:);
 obs(61,:)=WGAS17(ii,:);
 obs(62,:)=WGAS18(ii,:);
 obs(63,:)=WGAS19(ii,:);
 obs(64,:)=WGAS20(ii,:);
 obs(65,:)=WGAS21(ii,:);
 obs(66,:)=WGAS22(ii,:);
 obs(67,:)=WWATERINJ1(ii,:);
 obs(68,:)=WWATERINJ2(ii,:);
 obs(69,:)=WWATERINJ3(ii,:);
 obs(70,:)=WWATERINJ4(ii,:);
 obs(71,:)=WWATERINJ5(ii,:);
 obs(72,:)=WWATERINJ6(ii,:);
 obs(73,:)=WWATERINJ7(ii,:);
 obs(74,:)=WWATERINJ8(ii,:);
 obs(75,:)=WWATERINJ9(ii,:);
 obs(76,:)=WGASINJ1(ii,:);
 obs(77,:)=WGASINJ2(ii,:);
 obs(78,:)=WGASINJ3(ii,:);
 obs(79,:)=WGASINJ4(ii,:);
 observationsim(:,ii)=obs;
 end
        
   overallsim(:,:,i)=observationsim;      
    cd(oldfolder);
    end
   cd(oldfolder) % returning to original directory
end