% *****************************************************************************************
% File Name     : Plot_Dot_2_Dot_2D.m
% Author        : Dingjiang Zhou
% Purpose       : to plot a line from dot1 to dot2, in 2D plane.
% *****************************************************************************************
function handle = Plot_Dot_2_Dot_2D(dot1, dot2, clr, lw)

if ischar(clr) || length(clr) == 3
    color_to_fill = clr;
else
    colors = Init_Color(clr);
    if clr > 20
        colors(clr,:) = rand(1,3);
    end
    color_to_fill = colors(clr,:);
end

handle = plot([dot1(1),dot2(1)],[dot1(2),dot2(2)],'color',color_to_fill,'linewidth',lw);