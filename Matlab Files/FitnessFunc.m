%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Naveen Lalwani					      %
% 		                                                      %
% This project was done as a final year project at Vellore Institute  %
% of Technology for the fulfilment of requirement of Bachelor of      %
% Technology degree. 						      %
%								      % 
% This file presents the objective function which is used to 	      %
% optimize the LQR controller by optimizing the Q matrix (state       %
% weighing matrix) and R matrix (control weighting matrix). The       %
% selection of the penalty matrices decides the performance of the    %
% controller. 	 						      %
% The state spece equations for the quarter car model have been       %
% derived and the model parameters have been taken as per the 	      %
% hardware model provided by Quanser Inc.			      %
%								      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function J = FitnessFunc(q)

	% The fitness function for the evaluation of chromosomes or particles
	% Q is 4x4 matrix and R is 1X1 matrix.
	% Q and R are taken as diagonal matrices.
	% Variables are q1, q2, q3, q4, q5 
	% R = q5 
	 
	% ############### MODEL PARAMETERS############### 
	ks = 900;		% Suspension Stiffness (N/m) 
	kt = 2500;		% Tire stiffness (N/m)
	ms = 2.45;		% Sprung Mass (kg) 
	mu = 1;			% Unsprung Mass (kg)
	bs = 7.5;		% Suspension Inherent Damping coefficient (sec/m)
	bus = 5;		% Tire Inhenrent Damping coefficient (sec/m)
	 

	% ############### State Space Model ##############
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

	% Declaration of Q and R matrices variables 
	temp = [q(1);
			q(2);
			q(3);
			q(4)];
	Q = diag(temp);
	R = q(5);
	 
	% Calculating Gain
	k = lqr(A, B(:, 2), Q, R);

	% Calculating eigen vector and eigen values

	% V is the right eigenvector and W is the left eigenvector 
	% D is the diagonal matrix of the eigenvalues
	% Finding eigenvalues of the system with closed loop feedback.
	[V, D, W] = eig(A - B(:, 2) * k);

	S = dot(transpose(W), V)/(norm(V, 2)*norm(W, 2));
	J = abs(sum(S));

end
