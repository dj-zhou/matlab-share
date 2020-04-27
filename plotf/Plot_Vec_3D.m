%******************************************************************************************
%   File Name     : Plot_Vec_3D.m
%   Author        : Dingjiang Zhou
%   Purpose       : draw a vector in 3D plot
%
% INPUTS:
%        strtP : start point in 3D plane
%         endP : end point in the 3D plane
%   arrowScale : the scale of the arrow
%          clr : plot color
%           lw : linewith of the vector and also its arrow
%******************************************************************************************
function handle = Plot_Vec_3D(start_point, end_point, arrow_scale, clr, lw)

if ischar(clr)
    handle = plot3([start_point(1),end_point(1)],...
        [start_point(2),end_point(2)],...
        [start_point(3),end_point(3)],clr,...
        'linewidth',lw);
elseif  length(clr) == 3
    handle = plot3([start_point(1),end_point(1)],...
        [start_point(2),end_point(2)],...
        [start_point(3),end_point(3)],...
        'color',clr,'linewidth',lw);
elseif length(clr) == 1
    colors = Init_Color();
    if clr > 20
        colors(clr,:) = rand(1,3);
    end
    handle = plot3([start_point(1),end_point(1)],...
        [start_point(2),end_point(2)],...
        [start_point(3),end_point(3)],'color',...
        colors(clr,:),'linewidth',lw);
end


% the obtained y is parallel to the original y
if (end_point(1) - start_point(1)) == 0 && (end_point(3)-start_point(3)) == 0
    R0 = eye(3);
else
    R0 = Ratation_from_Axis_Angle(normalize(cross([0;1;0],...
        normalize(end_point - start_point))),...
        acos([0;1;0]' * normalize(end_point - start_point)));
end
yAxis = normalize(end_point-start_point);
xAxis = R0*[1;0;0];
zAxis = cross(xAxis,yAxis);
R1 = [xAxis,yAxis,zAxis]; % the rotation matrix from reference to ...

% to plot the arrow head ------------------------------------------------------------------
if arrow_scale > 0 && norm(start_point-end_point)>1e-4
    arwCntr = end_point - arrow_scale*normalize(end_point-start_point);
    arrowPoints = 8;
    for i = 1 : arrowPoints
        R2 = Rotation('y',(i-1)*2*pi/arrowPoints);
        arrow = arwCntr + R1*R2*[0;0;arrow_scale*sin(pi/8)];
        if ischar(clr) || length(clr) == 3
            plot3([end_point(1),arrow(1)],...
                [end_point(2),arrow(2)],...
                [end_point(3),arrow(3)],...
                clr,'linewidth',lw);
        else
            if length(clr) == 1
                colors = initialColorFnc();
                if clr > 20
                    colors(clr,:) = rand(1,3);
                end
                plot3([end_point(1),arrow(1)],...
                    [end_point(2),arrow(2)],...
                    [end_point(3),arrow(3)],...
                    'color',colors(clr,:),'linewidth',lw);
            else
                error('plotVec3D: wrong argument: clr');
            end
        end
    end
    
    % plot a circle
    i = 1;
    for t = 0:10/180*pi:2*pi
        R2 = Rotation('y',t);
        arrow(:,i) = arwCntr + R1*R2*[0;0;arrow_scale*sin(pi/8)];
        i = i + 1;
    end
    if ischar(clr) || length(clr) == 3
        plot3(arrow(1,:),arrow(2,:),arrow(3,:),clr,'linewidth',lw);
    else
        if length(clr) == 1
            colors = initialColorFnc();
            if clr > 20
                colors(clr,:) = rand(1,3);
            end
            plot3(arrow(1,:),arrow(2,:),arrow(3,:),...
                'color',colors(clr,:),'linewidth',lw);
        else
            error('plotVec3D: wrong argument: clr');
        end
    end
end
% if arrowScale > 0 && norm(strtP-endP)>1e-4
% end
% end of file -------------------------------------------------------------
