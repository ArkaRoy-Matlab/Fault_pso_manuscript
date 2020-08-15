% ***************************************************************
% *** Help file for running all codes used in manuscript
% *** Source Code is mainly written for research purposes. The codes are
% *** having copyrights and required proper citations whenever it is used.
% *** Originated by:
% ***       Mr. Arka Roy (email: arka.phy@gmail.com)
% ***       Mr. Thatikonda Suresh Kumar (email: sureshkumarncess@gmail.com)
% ***       Crustal Processes Group, National Centre for Earth Science Studies,
% ***       Ministry of Earth Sciences, Government of India
% ***       Thiruvanthapuram, Kerala, India
% ****************************************************************
This is a help file for a description of all Data, Source Code, and Subroutine used for the implementation of our present paper 
'Gravity inversion of basement relief using Particle Swarm Optimization by automated parameter selection of Fourier coefficients.'  

(Copy all set of files including data in one folder and run)

	1. Data Files
		a. obs_Aswaraopet
		b. grv_Aswaraopet
		c. density_Aswaraopet
		d. error_energy1_fxd_w
		e. error_energy1_fxd_wo
		f. error_energy1_vary_w
		g. error_energy1_vary_wo
		h. error_energy2_fxd_w
		i. error_energy2_fxd_wo
		j. error_energy2_vary_w
		k. error_energy2_vary_wo
		
	File (a) is the observation points for Aswaraopet boundary fault which is used as real profile in manuscript.
	File (b) is the observed gravity anomaly for Aswaraopet boundary fault which is used as real profile in manuscript.
	file (c) infirmation of depth varying density function for Aswaraopet boundary fault. 
	files(d), (e), (f), (g), (h), (i), (j), (k) are the data file for error energy plot model1 and model2 for noise-free and noisy data case.

	2. Subroutines
		a. lgwt.m
		b. Fault_Invert
		c. poly_gravityrho.m
		d. WIPSO.m
		e. plot_fault

	a. lgwt.m - This script is for computing definite integrals using Legendre-Gauss 
 Quadrature. Computes the Legendre-Gauss nodes and weights  on an interval [a,b] with truncation order N. Suppose you have a continuous function f(x) which is defined on [a,b]
which you can evaluate at any x in [a,b]. Simply evaluate it at all of the values contained in the x vector to obtain a vector f. Then compute the definite integral using sum(f.*w);

	This code is written by Greg von Winckel - 02/25/2004. Here we have used it for our calculation and cited in main manuscript. 
	
	b. Fault_Invert.m - Main Matlab Function for Fault inversion having given Density distribution, observation points and corresponding gravity anomaly.
	
	c. poly_gravityrho.m - poly_gravityrho function calculates z component of gravity field for any polygon shape 2d body having depth varying density contrast. This program based on line integral in anticlockwise direction using Gauss Legendre quadrature
%integral formula. For more detail go through Zhou 2008. It is same as poly_gravity function but for depth varying density contrast. 

	d. WIPSO.m - WIPSO calculates the optimized parameters (best_var) for a given objective function (CostFunction) using Particle Swarm Optimization.
	
	e. plot_fault - Matlab function for plotting any fault for giving Fault plane locations in 3D as well as 2D view. 
	
	3. Source Codes
		a. model1_synthetic.m
		b. model1_synthetic.m
		c. real_model.m
		d. error_energy_plot.m
		e. parameter_tuning_c1_c2.m
		f. parameter_tuning_nPoP.m
	
	a. model1_synthetic.m- It calculates the inversion of gravity anomaly for a synthetic left-side downward dip-slipped fault having fixed and varying density contrast with and without noise case (Model1) shown in figure 4 and 5. 

	b. model2_synthetic.m- It calculates the inversion of gravity anomaly for a synthetic right-side downward dip-slipped fault having fixed and varying density contrast with and without noise case (Model2) shown in figure 6 and 7. 

	c. real_model.m- It calculates the fault structure of Aswaraopet boundary fault using inversion of gravity anomaly. Output is shown in figure 9.

	d. error_energy_plot.m- This code plots error energy as shown in figure 8. in the manuscript.  

	e. parameter_tuning_c1_c2.m - This code for Parameter tuning of PSO for cognitive (c1) and social (c2) components. Output of the code is shown in Table 2. 
	
	f. parameter_tuning_nPoP.m - This code for Parameter tuning of particle population. Output of the code is shown in Table 3. 
