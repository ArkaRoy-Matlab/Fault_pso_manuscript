% ***************************************************************
% *** Matlab code for error energy plot   
% *** Source Code is mainly written for research purposes. The codes are
% *** having copyrights and required proper citations whenever it is used.
% *** Developed by:
% ***       Mr. Arka Roy (email: arka.phy@gmail.com)
% ***       Mr. Thatikonda Suresh Kumar (email: sureshkumarncess@gmail.com)
% ***       Crustal Processes Group, National Centre for Earth Science Studies,
% ***       Ministry of Earth Sciences, Government of India
% ***       Thiruvanthapuram, Kerala, India
% ****************************************************************

%Error Energy plot 
%%Matlab code for Error energy plot
clear all
close all

%importing all data for error energy plot
%noise free data
y1=importdata('error_energy1_fxd_wo.dat');
y2=importdata('error_energy1_vary_wo.dat');
y3=importdata('error_energy2_fxd_wo.dat');
y4=importdata('error_energy2_vary_wo.dat');

%noisy data
z1=importdata('error_energy1_fxd_w.dat');
z2=importdata('error_energy1_vary_w.dat');
z3=importdata('error_energy2_fxd_w.dat');
z4=importdata('error_energy2_vary_w.dat');

%plotting the error energies for noise free data
figure(1)
semilogy(y1,'linewidth',2)
hold on
semilogy(y2,'linewidth',2)
semilogy(y3,'linewidth',2)
semilogy(y4,'linewidth',2)
ylabel('Error Energy in mGal^2')
xlabel('Generation')
title('Error energy plot for noise free case')
legend('Model1 fixed density','Model1 varying density','Model2 fixed density','Model2 varying density')
%plotting the error energies for noisy data

figure(2)
semilogy(z1,'linewidth',2)
hold on
semilogy(z2,'linewidth',2)
semilogy(z3,'linewidth',2)
semilogy(z4,'linewidth',2)
ylabel('Error Energy in mGal^2')
xlabel('Generation')
title('Error energy plot for noisy case')
legend('Model1 fixed density','Model1 varying density','Model2 fixed density','Model2 varying density')