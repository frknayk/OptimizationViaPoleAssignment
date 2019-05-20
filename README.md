# OptimizationViaPoleAssignment
************Defining a custom cost function with a control point of view************

In this work, I wanted to design an optimal PI controller for given criterias below,

Settling Time = 0.01 seconds,
Overshoot : 0.05 %

In classical control it is easy to design a closed loop transfer function with settling time
and overshoot criterias via 'pole assignment' method. And call this system 'reference system'.

In 'main.m' you can find design procedure for pole assignment.

After the definition, now we can optimize P and I parameters as follows,
  > Init randomly P and I parameters.
  > Caluclate error between reference signal and reference system.
  > Calculate error between reference signal and actual system.
  > Try to minimize sum of squares of errors ( ISE : Integral Squared Error )

For optimizaiton part, I used Hooke and Jeeves since we have only two parameters.
But for PID you can use genetic algorithm or other optimization method. H&J is generally faster
although it is not the best method always.
 
