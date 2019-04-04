clc;
clear;
close all;
load faultensemble.dat;
N=100;
fault=reshape(faultensemble,53,N);
for j=1:N
f = 'Realization_';
 folder = strcat(f, sprintf('%d',j));
mkdir(folder);
end

for j=1:N
 f = 'Realization_';
 folder = strcat(f, sprintf('%d',j));
copyfile('multflt.dat',folder)
end
writebackfaults(faultensemble,N);