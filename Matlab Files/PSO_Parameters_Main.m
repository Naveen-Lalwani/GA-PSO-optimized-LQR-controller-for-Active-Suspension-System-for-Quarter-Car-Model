%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Naveen Lalwani											  %
% 																	  %
% This project was done as a final year project at Vellore Institute  %
% of Technology for the fulfilment of requirement of Bachelor of 	  %
% Technology degree. 												  %
%																      %
% This file presents the parameters chosen for running the Particle   %
% Swarm Optimization. The parameters were chosen by fine tuning the   %
% search algorithm and the search bounds were decided by Bryson's     % 
% method.								                              %
%																	  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

%% Problem Definiton

problem.CostFunction = @(q) FitnessFunc(q);  % Cost Function
problem.nVar = 5;       					 % Number of Unknown (Decision) Variables
problem.VarMin =  [100 0 0 0 0.004]          % Lower Bound of Decision Variables
problem.VarMax =  [500 100 100 100 0.01];    % Upper Bound of Decision Variables %w = [410.7474;141.5821;201.3918;96.3059];

%% Parameters of PSO

params.MaxIt = 100;            % Maximum Number of Iterations
params.nPop = 100;             % Population Size (Swarm Size)
params.w = 1;                  % Intertia Coefficient
params.wdamp = 0.92;           % Damping Ratio of Inertia Coefficient
params.c1 = 2.4;               % Personal Acceleration Coefficient
params.c2 = 2.22;              % Social Acceleration Coefficient
params.ShowIterInfo = true;    % Flag for Showing Iteration Informatin

%% Calling PSO.m file
out = PSO(problem, params);

BestSol = out.BestSol;
BestCosts = out.BestCosts;

%% Results

figure;
% plot(BestCosts, 'LineWidth', 2);
semilogy(BestCosts, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;