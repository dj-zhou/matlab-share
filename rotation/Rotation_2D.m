%**************************************************************************
%   File Name     : rot2D.m
%   Author        : Dingjiang Zhou
%   Purpose       : basic rotation matrix.
%**************************************************************************
function  R = Rotation_2D(angle)

cosAngle = cos(angle);
sinAngle = sin(angle);
R = [cosAngle  -sinAngle;
     sinAngle   cosAngle];
