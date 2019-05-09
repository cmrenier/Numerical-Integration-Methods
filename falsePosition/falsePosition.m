% This function was created in order to find the roots of a function using
% the false position method.

function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
% input arguments:
%   func = the function being evaluated
%   xl = the lower guess
%   xu = the upper guess
%   es = the desired relative error 
%   maxiter = the number of iteration desired
% output arguments:
%   root = the estimated root location
%   fx = the function evaluated at the root location
%   ea = the approximate relative error (%)
%   iter = number of iterations performed

if nargin < 3 % if the amount of input arguments is less than 3
    error('Minimum of 3 input arguments are required') % this error message will be displayed, and the function will not run
end
if nargin < 4 || isempty(es) % if the amount of input arguments is less than 4 or the desired relative error is empty
    es = 0.0001; % this is the default relative error
    maxiter = 200; % this is the default number of max iterations
end
if nargin < 5 || isempty(maxiter) % if the amount of input arguments is less than 5 or the desired number of max iteration is empty
    maxiter = 200; % this is the default number of max iterations
end

sign_test = func(xl)*func(xu); % test to see if function crosses x-axis between lower and upper bounds
if sign_test > 0 % if greater than 0, both bounds have the same sign, and it does not cross the x-axis
    error('There was no sign change detected, the root is unobtainable')
end

iter = 0;
xr = xl;
ea = 100;
% These are the starting criteria for the loop
while (1)
    xr_start = xr; % set the first value of xr equal to xr
    xr = xu - ((func(xu)*(xl-xu))/(func(xl)-func(xu))); % plug in everything for the given false-position formula
    iter = iter + 1; % add another iteration
    if xr ~= 0 % if the xr value that is found does not equal zero
        ea = abs(((xr - xr_start)/xr) * 100); % find the approximate error value
    end
    sign_test = func(xl)*func(xr); %another sign test to check which value the new xr should become (either xl or xu)
    if sign_test < 0 % if the number comes out positive,
        xu = xr; % replace xr as the new xu
    elseif sign_test > 0 % if the number comes out negative,
        xl = xr; % replace xr as the new xl
    end
    if ea <= es || iter >= maxiter % if either the approximate error is less than or equal to the maximum error required, or the number of iterations exceeds the maximum iterations allowed,
        break % end the loop here
    end
end

root = xr; % let root equal the value of xr
fx = func(xr); %let fx equal the function of xr