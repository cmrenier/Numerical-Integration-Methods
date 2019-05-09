%% Homework 19
% Coco Renier
% Mech 105

% This algorithm was designed to integrate given data using Simpson's 1/3
% rule and the trapezoidal rule when necessary.

function I = Simpson(x,y)
% inputs:
%   x,y = vectors with values of y with respect to x
% outputs:
%   I = the calculated integral of the vector 

% Make sure the size of x is equal to the size of y
if length(x) ~= length(y)
    error('The inputs must be the same length')
end
% Make sure that there is more than one value in each vector
if length(x) < 2
    error('There must be at least two elements in each vector')
end
% Make sure there is equal spacing between each value in the vector x
spacing = diff(x);
err = max(spacing) - min(spacing);
if err > 0
    error('X must be equally spaced')
end

% Use the trapezoidal rule if there are only 2 inputs
h = spacing(1);
if length(spacing) == 1
    warning('The trapezoidal rule must be used for the interval')
    I = h*((y(1)+y(2))/2);
    
% If the number of elements in the vectors is even, proceed with Simpson's 1/3 rule    
elseif rem(length(spacing),2) == 0
    
    y_even = sum(y(2:2:end-1)); % calls every even numbered element of vector y
    y_odd = sum(y(3:2:end-2)); % calls the odd numbered elements of vector 
    h = spacing(1);
    y_beg = y(1); % calls the first value in vector y
    y_end = y(end); % calls the last value of vector y

    I = (h/3)*(y_beg+4*y_even+2*y_odd+y_end); % Simpson's 1/3 equation

% If the number of elements in the vectors is odd, proceed with Simpson's 1/3 rule, continued with the trapezoidal rule for the last interval    
else
    warning('The trapezoidal rule must be used for the last interval')
    % continue with the same procedure for the first part of vector y
    y_even = sum(y(2:2:end-2));
    y_odd = sum(y(3:2:end-3));
    h = spacing(1);
    y_beg = y(1);
    y_end = y(end-1);

    i = (h/3)*(y_beg+4*y_even+2*y_odd+y_end); % Simpson's 1/3 equation
    I = i + h*((y(end-1)+y(end))/2); % Trapezoidal rule equation for the last interval

end
end