
function handle =  Plot_Circle_2D(center, radius, delta_angle_c, clr, lw, fill_style, body_transparent)


[handle,points] = Plot_Circle_2D_Sub1(center,radius,delta_angle_c,clr,lw);
% -----------------------------------------------------------------------------------------
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
    Plot_Circle_2D_Sub2(points,clr,fill_style,body_transparent);
end

% -----------------------------------------------------------------------------------------
function [handle,points] = Plot_Circle_2D_Sub1(center, radius, delta_angle_c, clr, lw) 
t = 0 : delta_angle_c/180*pi : 2*pi;
x = radius*cos(t) + center(1);
y = radius*sin(t) + center(2);
points = [x;y]; % output

if ischar(clr)
    handle = plot(x,y,clr,'linewidth',lw); 
elseif length(clr) == 3
    handle = plot(x,y,'color',clr,'linewidth',lw);
else
    colors = Init_Color(clr);
    if clr > 110
        colors(clr,:) = rand(1,3);
    end
    handle = plot(x,y,'color',colors(clr,:),'linewidth',lw); 
end

% -----------------------------------------------------------------------------------------
function Plot_Circle_2D_Sub2(points, clr, fill_style, body_transparent)

if ischar(clr)
    if fill_style == 'F' || fill_style == 'f'
        fill(points(1,:),points(2,:),clr,'FaceAlpha',body_transparent,'edgecolor',clr);
    end
elseif  length(clr) == 3
    if fill_style == 'F' || fill_style == 'f'
        fill(points(1,:),points(2,:),'color',clr,'FaceAlpha',body_transparent,'edgecolor',clr);
    end
else
    colors = initialColorFnc(clr);
    if clr > 110
        colors(clr,:) = rand(1,3);
    end 
    if fill_style == 'F' || fill_style == 'f'
        fill(points(1,:),points(2,:),colors(clr,:),'FaceAlpha',body_transparent,'edgecolor',colors(clr,:));
    end
end





