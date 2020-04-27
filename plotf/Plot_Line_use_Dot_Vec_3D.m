% plot a line that across the whole plotting range

% this function is used revised (copied from the 2D version)
function handle = Plot_Line_use_Dot_Vec_3D(dot, vec, axis_range, clr, lw)

% if parallel to x-axis
if vec(2) == 0
    dot1 = [axis_range(1);dot(2)];
    dot2 = [axis_range(2);dot(2)];
    handle = Plot_Dot_2_Dot_2D(dot1,dot2,clr,lw);
    return
end
% if parallel to y-axis
if vec(1) == 0
    dot1 = [dot(1);axis_range(3)];
    dot2 = [dot(1);axis_range(4)];
    handle = Plot_Dot_2_Dot_2D(dot1,dot2,clr,lw);
    return
end

% not parallel, hence have four intersections with the figure boards
% convert dot, vec to a*x + b*y + c = 0;
%     x - dot(1)       vec(1)
%   --------------  =  -------
%     y - dot(2)       vec(2)
a =  vec(2);
b = -vec(1);
c = -vec(2)*dot(1) + vec(1)*dot(2);
dot1 = [axis_range(1);(- a*axis_range(1) - c)/b];
dot2 = [axis_range(2);(- a*axis_range(2) - c)/b];
dot3 = [(-b*axis_range(3) - c)/a;axis_range(3)];
dot4 = [(-b*axis_range(4) - c)/a;axis_range(4)];
handle = Plot_Dot_2_Dot_2D(dot1,dot2,clr,lw);
Plot_Dot_2_Dot_2D(dot3,dot4,clr,lw);