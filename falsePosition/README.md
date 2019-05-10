# False Position Algorithm

This algorithm was designed to estimate the root of a given function using the false position method. 

The user will input func (the function being evaluated), xl (the lower bound), xu (the upper bound), es (the desired relative error (otherwise defaulted to 0.0001%)), maxiter (the number of iterations desired (otherwise defaulted to 200)).
  
The resultant output will include root (the estimated root location), fx (the function evaluated at the root location), ea (the approximate relative error), iter (how many iterations were performed)
  
This method requires two bounds to successfully find the root of the function. The function inputted must include at least one sign change over the bounds.
