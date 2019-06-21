%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Author: Naveen Lalwani											  %
% 																	  %
% This project was done as a final year project at Vellore Institute  %
% of Technology for the fulfilment of requirement of Bachelor of 	  %
% Technology degree. 												  %
%																	  % 
% This file presents the ISE (Integral Square Error) fitness 		  %
% function.															  %
%																	  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function J = FitnessFunc_ISE(q)

	% The fitness function for the evaluation of chromosomes or particles
	% Q is 4x4 matrix and R is 1X1 matrix.
	% Q and R are taken as diagonal matrices.
	% Variables are q1, q2, q3, q4, q5 
	% R = q5 
	 
	%% ############### MODEL PARAMETERS############### 
	ks = 900;		% Suspension Stiffness (N/m) 
	kt = 2500;		% Tire stiffness (N/m)
	ms = 2.45;		% Sprung Mass (kg) 
	mu = 1;			% Unsprung Mass (kg)
	bs = 7.5;		% Suspension Inherent Damping coefficient (sec/m)
	bus = 5;		% Tire Inhenrent Damping coefficient (sec/m)
	 

	%% ############### State Space Model ##############
	A = [ 0 1 0 -1;
	    -ks/ms -bs/ms 0 bs/ms;
	    0 0 0 1;
	    ks/mu bs/mu -kt/mu -(bs+bus)/mu];

	B = [0  0; 
		0 1/ms;
		-1  0;
		bus/mu -1/mu];

	C = [ 1 0 0 0;
	-ks/ms -bs/ms 0 bs/ms];

	D = [0 0;
		0 1/ms];

	%% Declaration of Q and R matrices variables 
	temp = [q(1);
			q(2);
			q(3);
			q(4)];
	Q = diag(temp);
	R = q(5);
	 
	%% Calculating Gain
	k = lqr(A, B(:, 2), Q, R);
	sys2 = ss(A - B(:, 2) * k, B, C, D);

	t = 0:0.01:3;
	dt = 0.01;

	% 0.02 m is the maximum height of the step input that can 
	% be given to the hardware setup. Hence, the step input is 
	% of height 0.02 so that hardware is not damaged.
	[O2,l] = step(0.02 * sys2, t);
	e = 0.02 - O2(:,:,1);

	J = J = sum((e(:,2).^2)*dt);
	J = abs(sum(S));

end
