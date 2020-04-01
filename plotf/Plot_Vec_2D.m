% *************************************************************************
%    File Name     : Plot_Vec_2D.m
%    Author        : Dingjiang Zhou
%    Purpose       : the parameters used to relates all the coordinate
%                    systems used in the control. refer to readme.m for the
%                    detail of the systems.
% 
% INPUTS:
%        strtP : start point in 2D plane, 2 x 1 vector
%         endP : end point in the 2D plane, 2 x 1 vector
%   arrowScale : the scale of the arrow
%          clr : color to plot
%           lw : linewidth
% *************************************************************************
function plotHandle = Plot_Vec_2D(start_point, end_point, arrow_scale, clr, lw)

if norm(end_point - start_point) < 0.01
    return;
end
if ischar(clr)
    plotHandle = plot([start_point(1),end_point(1)],[start_point(2),end_point(2)],clr,'linewidth',lw);
elseif length(clr) == 3
    plotHandle = plot([start_point(1),end_point(1)],[start_point(2),end_point(2)],'color',clr,'linewidth',lw);
elseif length(clr) == 1
    colors = initialColorFnc(clr);
    if clr > 20
        colors(clr,:) = rand(1,3);
    end
     plotHandle = plot([start_point(1),end_point(1)],[start_point(2),end_point(2)],'color',colors(clr,:),'linewidth',lw);
end

baseAngle = atan2(end_point(2)-start_point(2),end_point(1)-start_point(1));
ang1 = pi + baseAngle + pi/8;
ang2 = pi + baseAngle - pi/8;

arrow1 = [end_point(1);end_point(2)] + [arrow_scale*cos(ang1);arrow_scale*sin(ang1)];
arrow2 = [end_point(1);end_point(2)] + [arrow_scale*cos(ang2);arrow_scale*sin(ang2)];
if ischar(clr)
    plot([end_point(1),arrow1(1)],[end_point(2),arrow1(2)],clr,'linewidth',lw);
    plot([end_point(1),arrow2(1)],[end_point(2),arrow2(2)],clr,'linewidth',lw);
elseif length(clr) == 3
    plot([end_point(1),arrow1(1)],[end_point(2),arrow1(2)],'color',clr,'linewidth',lw);
    plot([end_point(1),arrow2(1)],[end_point(2),arrow2(2)],'color',clr,'linewidth',lw);
elseif length(clr) == 1
    colors = initialColorFnc(clr);
    if clr > 20
        colors(clr,:) = rand(1,3);
    end
    plot([end_point(1),arrow1(1)],[end_point(2),arrow1(2)],'color',colors(clr,:),'linewidth',lw);
    plot([end_point(1),arrow2(1)],[end_point(2),arrow2(2)],'color',colors(clr,:),'linewidth',lw);
end

% end of file -------------------------------------------------------------

