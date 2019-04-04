function clement2poro = mainDCTporo(sgporo, N);
%% DCT domain reduction for porosity field
disp('  DCT domain reduction for permeability  ');
disp(' Author: Clement Etienam-PhD Visiting researcher,University of Manchester,July,2018')
disp('Supervisor: Profesor Colin Macbeth')
sgsim=(sgporo);
LF=reshape(sgsim,113344,N);
disp('  carry out DCT domain reduction  ');
for ii=1:N
    lf=reshape(LF(:,ii),46,112,22);
     for jj=1:22
         value=lf(:,:,jj);
         usdf=mirt_dctn(value);
         usdf=reshape(usdf,5152,1);
         young(:,jj)=usdf;
     end
      sdfbig=reshape(young,113344,1);
  clement(:,ii)=sdfbig;
end
disp('  extract the significant DCT coefficients  ');
clement=reshape(clement,113344,N);
for iii=1:N
    lf2=reshape(clement(:,iii),46,112,22);
for jjj=1:22
    val1=lf2(1:25,1:50,jjj);
    val1=reshape(val1,1250,1);
   val2(:,jjj)=val1;
end
  sdfbig2=reshape(val2,27500,1);
  clement2poro(:,iii)=sdfbig2;
end

end