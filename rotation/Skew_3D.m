% generate a skew symmetric matrix from a 1x3 or 3x1 vector
function [tilde_matrix] = Skew_3D(x)
tilde_matrix = [   0    -x(3)   x(2) ;
                 x(3)      0   -x(1) ;
                -x(2)    x(1)     0 ];
