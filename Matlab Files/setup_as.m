% SETUP_AS
%
% Active Suspension Control Lab: 
% Design of a LQR active damping controller
% 
% SETUP_AS sets the model parameters and set the controller
% parameters for the Quanser Active Suspension experiment.
%
% Copyright (C) 2013 Quanser Consulting Inc.
% Quanser Consulting Inc.
%

clear all

% ############### USER-DEFINED ACTIVE SUSPENSION CONFIGURATION ###############
%CONTROL TYPE CAN BE SET TO 'AUTO' OR 'MANUAL'. 
CONTROL_TYPE = 'AUTO';

% ###############MODEL PARAMETERS###############

ks = 900;% or 1040 Suspension Stiffness (N/m) 
kt = 2500;% or 2300
kus = kt;% Tire stiffness (N/m)
ms = 2.45;% or 2.5 Sprung Mass (kg) 
mu = 1;% or 1.150
mus = mu;% Unsprung Mass (kg)
bs = 7.5;% Suspension Inherent Damping coefficient (sec/m)
bus = 5;% Tire Inhenrent Damping coefficient (sec/m)

%Set the model parameters of the Active Suspension.
%This section sets the A,B,C and D matrices for the Active Suspension model.

A = [ 0 1 0 -1 ;
    -ks/ms -bs/ms 0 bs/ms;
    0 0 0 1;
    ks/mu bs/mu -kt/mu -(bs+bus)/mu];
B = [0  0 ; 0 1/ms ; -1  0 ; bus/mu -1/mu ];
C = [ 1 0 0 0 ; -ks/ms -bs/ms 0 bs/ms ];
D = zeros(6,2); D(6,2)=1/ms;
    
if strcmp(CONTROL_TYPE, 'AUTO')
    Q = diag([450, 30, 5, 0.01]);
    R = 0.01;
    K = lqr( A, B(:,2), Q, R )
elseif strcmp(CONTROL_TYPE, 'MANUAL')
    disp( [ 'K = [' 0 ' N/m  '  0 ' N/m  ' 0 ' N.s/m  '  0 ' N.s/m'] )
    disp( ' ' )
    disp( 'STATUS: manual mode' ) 
    disp( 'The model parameters of your Active Suspension system have been set.' )
    disp( 'You can now design your state-feedback position controller.' )
    disp( ' ' )
else
    error( 'Error: Please set the type of controller that you wish to implement.' )
end

