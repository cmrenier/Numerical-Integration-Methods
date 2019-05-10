Simpson's Method

This algorithm was designed to integrate given experimental data using Simpson's 1/3 rule. It also checks for an odd number of intervals, and if this is the case, will automatically use the trapezoidal rule on the last interval.

The user will input a vector containing all values of y with respect to x.

The function will give an output of the calculated integral of the vector.

This algorithm requires a square vector with more than one value inside. There must also be equal spacing between all values in the vector x. If the trapezoidal rule must be used, the algorithm will automatically use it and warn the user that it was required.
