FitnessFunc.m represents the optimization function that I have developed which is solved using the AI based algorithms like PSO (Particle Swarm Optimization) and GA (Genetic Algorithms).

FitnessFunc_ITAE.m & FitnessFunc_ISE.m contains the ITAE (Integral Time-weighted Absolute Error) and ISE (Integral Square Error) objective functions.

PSO_Code.m contains the main Particle Swarm Optimization algorithm code.

PSO_Parameters_Main.m is the main file that should be run for obtaining the results. The objective functions can be changed here and the parameters/ hyperparameters for PSO can be changed here.  

s_as_lqr.mdl and q_as_lqr.mdl are the simulink files which represent the active suspension system for quarter car model. To run the simulation, input the values of Q and R matrices obtained from optimizations or any values of your choice in the setup_as.m file and run the simulation. 
The system can be switched between passive and active suspension system using the switch to activate closed loop feedback in the simulink model files.
