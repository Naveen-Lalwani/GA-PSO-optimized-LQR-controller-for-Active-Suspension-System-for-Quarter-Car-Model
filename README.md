# GA-PSO-optimized-LQR-controller-for-Active-Suspension-System-for-Quarter-Car-Model
In this project, I had designed and implemented a novel eigenstructure assignment
(EA) based technique to optimize the weighting matrices of LQR controller using Particle Swarm Optimization (PSO) and Genetic Algorithms (GA) applied to
vibration suppression of active suspension system. 
The motivation for the project was to formulate a single objective function which can optimize the gains of state feedback controller for MIMO systems irrespective of the metaheuristic algorithms used. The objective function widens the angle between the left and right eigenvectors of a closed loop system, which pushes the closed loop poles away from the imaginary axis towards left and enhances the speed and shape of the response of the system. The statistical analysis of the LQR optimization using PSO confirms the precision and repeatability of the algorithm.
The results of the project are compared with standard fitness functions like ISE and ITAE and show improvement of over 130% in all performance parameters (rise time, settling time and overshoot) for unsprung mass (tire) and an improvement for more than 5% for sprung mass (body). 
The performance of the proposed technique is assessed on a quarter car model with active suspension system through hardware in loop testing. The hardware setup is designed by Quanser Inc. and the results of the hardware simulations are in good agreement with software simulations and help in verifying our claim that the performance obtained by optimizing the LQR controller using the proposed EA function is better than the optimizations performed using the ITAE and ISE functions. 

The video demonstration of the project can be found at: https://youtu.be/swBcl6slOss
