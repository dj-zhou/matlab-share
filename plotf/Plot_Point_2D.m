% *****************************************************************************************
% File Name     : plot_Point_2D.m
% Author        : Dingjiang Zhou
% Purpose       : to mark a point with a circle and color, and also put a text there
% -----------------------------------------------------------------------------------------
% INPUTS
%     
% OUTPUTS
%        handle : plot handle for legend
% *****************************************************************************************
function handle = Plot_Point_2D(point, radius, clr, TEXT, offset, fig)


% -----------------------------------------------------------------------------------------
if nargin == 3
    handle = plot_Point_2D_sub1(point,radius,clr);
elseif nargin == 6
    handle = plot_Point_2D_sub1(point,radius,clr);
    plot_Point_2D_sub2(point,TEXT,offset,fig);

end

% -----------------------------------------------------------------------------------------
function handle = plot_Point_2D_sub1(point, radius, clr)
if ischar(clr) || length(clr) == 3 % this is correct
    handle = plot(point(1),point(2),'o','Color',clr,...
        'MarkerSize',radius,'MarkerEdgeColor',clr,'MarkerFaceColor',clr);
elseif length(clr) == 3
else
    colors = Init_Color(clr);
    if clr > 110
        colors(clr,:) = rand(1,3);
    end
    handle = plot(point(1),point(2),'o','Color',colors(clr,:),...
        'MarkerSize',radius,'MarkerEdgeColor',colors(clr,:),...
        'MarkerFaceColor',colors(clr,:));
end

% -----------------------------------------------------------------------------------------
function plot_Point_2D_sub2(point, TEXT, offset, fig)
textPos = point + offset;
text(textPos(1),textPos(2),TEXT,'fontsize',fig.fontSize);

