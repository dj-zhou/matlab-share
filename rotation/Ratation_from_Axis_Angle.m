%**************************************************************************
%   File Name     : Ratation_from_Axis_Angle.m
%   Author        : Dingjiang Zhou
%   Create Time   : 
%   Last Modified : 
%   Purpose       : rotation matrix about an arbitray unit vector.
%
% INPUTS: 
%       hatN : \hat n, must be unit vector
%      angle : rotation angle, in rad.
% OUTPUT:
%          R : rotation matrix
%**************************************************************************

function R = Ratation_from_Axis_Angle(hatt_n_axis, angle)


% check if hatN is a unit vector
% do not check for syms calculation
% normHatn = 0;
% normHatn = hatN(1)^2 + hatN(2)^2 + hatN(3)^2;
% if abs(normHatn-1)>=1e-4
%     R = eye(3);
%     disp('rotAxis: not a unit rotation axis');
%     return
% end

N(1,1) = hatt_n_axis(1);
N(2,1) = hatt_n_axis(2);
N(3,1) = hatt_n_axis(3);

cosa = cos(angle);
sina = sin(angle);

% rotation axis-angle representation, method 1, K.S. Fu p21
R = [N(1)^2*(1-cosa)+cosa        , N(1)*N(2)*(1-cosa)-N(3)*sina,  N(1)*N(3)*(1-cosa)+N(2)*sina;
     N(1)*N(2)*(1-cosa)+N(3)*sina, N(2)^2*(1-cosa)+cosa        ,  N(2)*N(3)*(1-cosa)-N(1)*sina;
     N(1)*N(3)*(1-cosa)-N(2)*sina, N(2)*N(3)*(1-cosa)+N(1)*sina,  N(3)^2*(1-cosa)+cosa       ];

% to quaternion
% q = [cos(1/2*alpha);
%      sin(1/2*alpha)*n(1);
%      sin(1/2*alpha)*n(2);
%      sin(1/2*alpha)*n(3)];


% R(1,1)+R(2,2)+R(3,3) = (1-cos(alpha)) + 3*cos(alpha) = 1 + 2*cos(alpha);
% ---> alpha = acos((R(1,1)+R(2,2)+R(3,3)-1)/2)
% R(2,1) - R(1,2) = 2*N(3)*sin(alpha); ---> N(3)
% R(1,3) - R(3,1) = 2*N(2)*sin(alpha); ---> N(2)
% R(3,2) - R(2,3) = 2*N(1)*sin(alpha); ---> N(1)
% but if alpha = 0 (since R = eye(3), then alpha = acos(1)), then 
% q = [1;0;0;0]


% end of file -------------------------------------------------------------


