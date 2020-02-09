%**************************************************************************
%   File Name     : Normalize.m
%   Author        : Dingjiang Zhou
%                   Boston University, Boston, 02215
%   Create Time   :  
%   Last Modified :  
%   Purpose       : to normalize a vector
%**************************************************************************
function vec_out = Normalize(vec_in)
% must be a column or row vector, any length is OK
norm_v = 0;
for i = 1 : length(vec_in)
    norm_v = norm_v + (vec_in(i)^2);
end
vec_out = vec_in/sqrt(norm_v);

% end of file -------------------------------------------------------------
