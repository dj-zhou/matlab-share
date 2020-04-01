
% arguments:
%     axis = [a;b;c], a, b, and c could be zero

function handle = Plot_Circle_3D(center,  axis, radius, clr, lw,  fill_style, body_transparent)

[handle,points] = plot_Circle_3D_Sub1(center,  axis, radius, clr, lw);

if nargin == 5
    % do nothing
elseif nargin == 7
    % argument check -------------------------
    if (body_transparent > 1.0)
        body_transparent = 1.0;
    end
    if (body_transparent < 0)
        body_transparent = 0;
    end
    plot_Circle_3D_Sub2(points,clr,fill_style,body_transparent);
end

% ---------------------------------------------------------------------------------
function [handle, points] = plot_Circle_3D_Sub1(center,  axis, radius, clr, lw)
if axis(1) ~= 0
    y = 10;
    z = 10;
    x = (-axis(2)*y-axis(3)*z)/axis(1);
elseif axis(2) ~= 0
    x = 10;
    z = 10;
    y = (-axis(1)*x-axis(3)*z)/axis(2);
elseif axis(3) ~= 0
    x = 10;
    y = 10;
    z = (-axis(1)*x-axis(2)*y)/axis(3);
end
first_point = Normalize([x;y;z])*radius;
hat_n = Normalize([axis(1);axis(2);axis(3)]);
t = 0 : 0.01 : 2*pi;
points = zeros(3,length(t));
for i = 1 : length(t)
    points(:,i) = [center(1);center(2);center(3)]+rotAxis(hat_n,t(i))*first_point;
end

if ischar(clr)
    handle = plot3(points(1,:),points(2,:),points(3,:),clr,'linewidth',lw);
elseif length(clr) == 3
    handle = plot3(points(1,:),points(2,:),points(3,:),'color',clr,'linewidth',lw);
else
    clrs = initialColorFnc(20);
    if clr > 20
        clrs(clr,:) = rand(1,3);
    end
    handle = plot3(points(1,:),points(2,:),points(3,:),...
        'color',clrs(clr,:),'linewidth',lw);
end

% ---------------------------------------------------------------------------------
function plot_Circle_3D_Sub2(points, clr, fill_style, body_transparent)
if ischar(clr)
    if fill_style == 'F' || fill_style == 'f'
        fill3(points(1,:),points(2,:),points(3,:),...
            clr,'FaceAlpha',body_transparent,'edgecolor',clr);
    end
elseif length(clr) == 3
    if fill_style == 'F' || fill_style == 'f'
        fill3(points(1,:),points(2,:),points(3,:),...
            clr,'FaceAlpha',body_transparent,'edgecolor',clr);
    end
else
    clrs = initialColorFnc(20);
    if clr > 20
        clrs(clr,:) = rand(1,3);
    end
    if fill_style == 'F' || fill_style == 'f'
        fill3(points(1,:),points(2,:),points(3,:),...
            clrs(clr,:),'FaceAlpha',body_transparent,'edgecolor',clrs(clr,:));
    end
end



% ---------------------------------------------------------------------------------




