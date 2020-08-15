% ***************************************************************
% *** Matlab code for synthetic model (Model 2) of gravity inversion 
% *** Source Code is mainly written for research purposes. The codes are
% *** having copyrights and required proper citations whenever it is used.
% *** Developed by:
% ***       Mr. Arka Roy (email: arka.phy@gmail.com)
% ***       Mr. Thatikonda Suresh Kumar (email: sureshkumarncess@gmail.com)
% ***       Crustal Processes Group, National Centre for Earth Science Studies,
% ***       Ministry of Earth Sciences, Government of India
% ***       Thiruvanthapuram, Kerala, India
% ****************************************************************
%%Matlab code for synthetic model (Model 2) of gravity inversion 
clear all
close all

%% Synthetic model for vertical fault 
%upper and lower vertex points of fault plane
x_l_syn=8000; z_l_syn= 300;
x_h_syn=6000; z_h_syn=3000;

%gravity anomaly for given fault 
%Right side oriented fault
x=[x_l_syn x_h_syn inf inf];
y=[z_l_syn z_h_syn z_h_syn z_l_syn]; 
%density contrast of the fault in kg/m^3

%for fixed density 
%    density=@(z) -600;
%for varying density    
   density=@(z)(-0.38-0.42*exp(-0.5*z*10^-3))*1000; 
    
%observation points
x_obs=linspace(0,15000,50);
z_obs=0;
%gravity anomaly of the synthetic fault 
[t,c]=lgwt(10,0,1);
grv_obs=poly_gravityrho(x_obs,z_obs,x,y,density,t,c);
data=grv_obs;

%adding noise to anomaly having 0 mean and sqrt(0.75) standard deviation 
grv_obs = grv_obs+sqrt(0.75).*randn(size(grv_obs))+0;
%contaminated data with noise

%% inversion for synthetic model
fprintf('Model 2 having varying density and with noise\n ')
%Run Model for 10 times and taking best model out of this 10 independent runs
    for i=1:10
        %running independent model
        [x_l,z_l,x_h,z_h,best_cost,error_energy]=Fault_Invert(grv_obs',x_obs',z_obs,density);
        %Saving data for all independent run
        xx_l(i)=x_l; xx_h(i)=x_h; zz_l(i)=z_l; zz_h(i)=z_h; bb_cost(i)=best_cost; err(i,:)=error_energy;
        fprintf('\t%d independent run finished.\n',i);
     end
    %finding minimum of cost function
    [mm,id]=min(bb_cost);
    %outputs for best Model
    x_l=xx_l(id);x_h=xx_h(id); %vertex location horizontal
    z_l=zz_l(id);z_h=zz_h(id); %vertex location vertical
    bst_err=(sqrt(squeeze(err(id,:))))'; %error energy for best model
    %inverted gravity anomaly
    grv_cal=plot_fault(x_l,z_l,x_h,z_h,x_obs,grv_obs,density);
    %saving error energy data
    save error_energy2_vary_w.dat bst_err -Ascii
 %% Uncertainty Estimation 
  %RMSE for gravity  
     N_g=length(grv_obs);  %Number of Observation points 
     %RMSE of given model 
     RMSE_g=sqrt((sum((grv_obs-grv_cal).^2))/N_g)/(max(grv_obs(:))-min(grv_obs(:)));
     %RMSE of True model 
     RMSE_true=sqrt((sum((grv_obs-data).^2))/N_g)/(max(grv_obs(:))-min(grv_obs(:)));
     %Printing the RMSE error gravity profile and the information of inverted Fault plane 
     fprintf('RMSE in gravity field=%e\n',RMSE_g)
     fprintf('True RMSE in gravity field=%e\n',RMSE_true)    
     fprintf('Actual    location of fault plane x_l=%2.2f x_h=%2.2f and z_l=%2.2f z_h=%2.2f\n',...
         x_l_syn,x_h_syn,z_l_syn,z_h_syn)
     fprintf('Optimized location of fault plane x_l=%2.2f x_h=%2.2f and z_l=%2.2f z_h=%2.2f\n',...
         x_l,x_h,z_l,z_h)
     
     