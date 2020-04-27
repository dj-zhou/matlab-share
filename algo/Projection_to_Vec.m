% project the point onto the vec, vec can be 2D or 3D, or maybe other
% dimension, as long as the vec is a vectorr, instead of matrix
% 
% new function to do: Projection_to_Matrix? Basis?

% arguments:
% vec: must be a column vector
% point: must be a column vectors
function p_projected = Projection_to_Vec(vec, point)

if length(vec(1,:)) ~= 1
    disp('vec sould be a column vector');
end

if length(point(1,:)) ~= 1
    disp('point sould be a column vector');
end
p_projected = vec*vec.'/norm(vec)^2*point;