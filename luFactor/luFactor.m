%% Homework 16
% Coco Renier
% Mech 105

% This algorithm was created to use partial pivoting to determine the LU
% factorization of a square matrix of any size.

function [L,U,P] = luFactor(A)
% inputs:
%   A = coefficient matrix
% outputs:
%   L = lower triangular matrix
%   U = upper triangular matrix
%   P = the pivot matrix

% Preventative error messages
% To ensure only one input argument was entered:
if nargin ~= 1
    error('The number of input arguments must be exactly 1')
end
% To ensure the input is a square matrix
[m,n] = size(A);
if m ~= n
    error('Values entered must be a square matrix')
end

% set initial parameters
P = eye(n);
L = P;
U = A;

% Determine the max value between two equations to see if pivoting is
% necessary
for row = 1:m-1
    MaxValue = max(abs(U(row:n,row)));
    
    for maxv = row:m
        if abs(U(maxv,row)) == MaxValue
            col = maxv;
        end
    end
    
% Pivot rows based on largest absolute value
    L([row,col],1:row-1) = L([col,row],1:row-1);
    U([row,col],row:n) = U([col,row],row:n);
    P([row,col],:) = P([col,row],:);

% Perform operations for LU decomposition
for maxv = row+1:n
    % Find elimination factor
    L(maxv,row) = U(maxv,row)/U(row,row);
    % Eliminate variable and replace in U
    U(maxv,row:n) = U(maxv,row:n)-L(maxv,row)*U(row,row:n);
end
end

