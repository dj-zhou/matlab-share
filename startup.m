% this file only support Linux system
% this file may uncompatible to other environment setting

delete ~/matlab_crash*
if ismac
    % do nothing
elseif isunix % Linux computer
    addpath ~/matlab/share/
    addpath ~/matlab/share/figure
    addpath ~/matlab/share/math
    addpath ~/matlab/share/rotation
    addpath ~/matlab/share/time
elseif ispc
    % for windows computer
else
    disp('Platform not supported')
end
%addpath ~/Dropbox/work/matlab/comm/drawing/
%addpath ~/Dropbox/work/matlab/comm/plotf/

cd ~/Dropbox/work/matlab/

ccc
