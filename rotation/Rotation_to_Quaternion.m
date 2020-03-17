%**************************************************************************
%   File Name     : Rotation_to_Quaternion.m
%   Author        : Dingjiang Zhou
%   Purpose       : convert rotation matrix R to quaterion q
%**************************************************************************
function q = Rotation_to_Quaternion(R)
% convert the rotation matrix to a quaternion
alpha = acos((R(1,1)+R(2,2)+R(3,3)-1)/2);

if alpha == 0 % or pi???
    q = [1;0;0;0]; 
elseif alpha == pi
    n12 = (1 + R(1,1))/2;
    n22 = (1 + R(2,2))/2;
    n32 = (1 + R(3,3))/2;
    n(1) = sqrt(n12); % always +
    n(2) = sign(R(1,2))*sqrt(n22);
    n(3) = sign(R(1,3))*sqrt(n32);
    q = [cos(1/2*alpha);
        sin(1/2*alpha)*n(1);
        sin(1/2*alpha)*n(2);
        sin(1/2*alpha)*n(3)];
else
    n(1) = (R(3,2)-R(2,3))/(2*sin(alpha));
    n(2) = (R(1,3)-R(3,1))/(2*sin(alpha));
    n(3) = (R(2,1)-R(1,2))/(2*sin(alpha));
    q = [cos(1/2*alpha);
     sin(1/2*alpha)*n(1);
     sin(1/2*alpha)*n(2);
     sin(1/2*alpha)*n(3)];
end

% rotation axis-angle representation, method 1, K.S. Fu p21 see
% rotAxis.m for more information.

% R = [N(1)^2*(1-cosa)+cosa        , N(1)*N(2)*(1-cosa)-N(3)*sina,  N(1)*N(3)*(1-cosa)+N(2)*sina;
%      N(1)*N(2)*(1-cosa)+N(3)*sina, N(2)^2*(1-cosa)+cosa        ,  N(2)*N(3)*(1-cosa)-N(1)*sina;
%      N(1)*N(3)*(1-cosa)-N(2)*sina, N(2)*N(3)*(1-cosa)+N(1)*sina,  N(3)^2*(1-cosa)+cosa       ];

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
% but if alpha == 0 (since R = eye(3), then alpha = acos(1)), then 
% q = [1;0;0;0]

% a new method added on Mar 3rd, 2014. 
% q = 1/4*[1 1 1 1;1 -1 -1 1;-1 1 -1 1;-1 -1 1 1]*[R(1,1);R(2,2);R(3,3);1];
% for i = 1 : 4
%     q(i) = sqrt(q(i));
% end
% % sign:
% q(2) = sign(R(3,2)-R(2,3))*q(2);
% q(3) = sign(R(1,3)-R(3,1))*q(3);
% q(4) = sign(R(2,1)-R(1,2))*q(4);
