% *****************************************************************************************
% File Name     : Plot_Curve_2D.m
% Author        : Dingjiang Zhou
% Email         : zdj@bu.edu zhoudingjiang@gmail.com
% Purpose       : to plot 2D lines
% -----------------------------------------------------------------------------------------
% INPUTS
%
% OUTPUTS
%        handle : plot handle for legend
% *****************************************************************************************
function handle = Plot_Curve_2D(line_2d, clr, lw, line_style)
% correction ----------
size1 = size(line_2d);
size2 = size(size1);
if size2(2) == 3
    line_2d_plot = zeros(size1(1),size1(3));
    for k = 1 : size1(3)
        line_2d_plot(:,k) = line_2d(:,1,k);
    end
else
    line_2d_plot = line_2d;
end

if nargin == 3
    handle = plot_Line_2D_sub1(line_2d_plot, clr, lw);
elseif nargin == 4
    handle = plot_Line_2D_sub2(line_2d_plot, clr, lw, line_style);
else
    error('plot_Line_2D: nargin > 4 is not implemented.');
end

% -----------------------------------------------------------------------------------------
% -----------------------------------------------------------------------------------------
function handle = plot_Line_2D_sub1(line_2d_plot, clr, lw)


% plotting ------------
if ischar(clr) || length(clr) == 3
    handle = plot(line_2d_plot(1,:),line_2d_plot(2,:),'Color',clr,'linewidth',lw);
else
    colors = initialColorFnc(clr);
    if clr > 110
        colors(clr,:) = rand(1,3);
    end
    handle = plot(line_2d_plot(1,:),line_2d_plot(2,:),'Color',colors(clr,:),'linewidth',lw);
end

% -----------------------------------------------------------------------------------------
% -----------------------------------------------------------------------------------------
function handle = plot_Line_2D_sub2(line_2d_plot, clr, lw, line_style)
if ischar(clr)  || length(clr) == 3
    handle = plot(line_2d_plot(1,:),line_2d_plot(2,:),line_style,'Color',clr,'linewidth',lw);
else
    colors = initialColorFnc(clr);
    if clr > 110
        colors(clr,:) = rand(1,3);
    end
    handle = plot(line_2d_plot(1,:),line_2d_plot(2,:),line_style,'Color',colors(clr,:),'linewidth',lw);
end

