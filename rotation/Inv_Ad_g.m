%**************************************************************************
%   File Name     : Inv_Ad_g.m
%   Author        : Dingjiang Zhou
%
%  the adjoint transformation associated with rigid motion g = (R, p)
%**************************************************************************
function  inv_Ad_g_matrix = Inv_Ad_g(R, p)

% R must be a 3 x 3 matrix
% p must be a 3 x 1 vector


inv_Ad_g_matrix = [ R.'          , - Skew_3D(R.'*p)*R.';
                   diag([0,0,0]) ,   R.'              ];
