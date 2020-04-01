% the inverse of Skew_3D()

function [vec] = Inv_Skew_3D(A)

% matrix A must be of 3 X 3 size
% some check to do

vec = [A(3,2);A(1,3);A(2,1)];