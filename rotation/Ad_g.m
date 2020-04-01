%**************************************************************************
%   File Name     : Ad_g.m
%   Author        : Dingjiang Zhou
%
%  the adjoint transformation associated with rigid motion g = (R, p)
%**************************************************************************
function  Ad_g_matrix = Ad_g(R, p)

% R must be a 3 x 3 matrix
% p must be a 3 x 1 vector


Ad_g_matrix = [ R             , Skew_3D(p)*R;
                diag([0,0,0]) , R          ];
