%**************************************************************************
%   File Name     : newfigure.m
%   Author        : Dingjiang Zhou
%                   Boston University, Boston, 02215
%   Create Time   : Mon, Aug. 24th, 2015. 03:49:45 PM
%   Last Modified :
%   Purpose       : a function to have a new figure, no need to inducate
%                   the figure number.
% INPUTS:
%           param : 'h', 'hg', 'gha', 'ghaa', etc.
%           scale : plot the axis if not 0 or empty.
%         VERSION : matalb version, refer to code for detail
% OUTPUT:
%       fig_handle : the number of the figure.
%**************************************************************************
function fig_handle = New_Figure(param, fig)

hands    = get(0,'Children');     % locate fall open figure handles
hands    = sort(hands);           % sort figure handles
num_figs = size(hands,1);         % number of open figures

% if (exist('fig') == 0)
%     disp('fig does not exist!');
%     fig.version    = 2016;
%     fig.stick_size = 15;
%     fig.font_size  = 18;
% end

if ( (fig.version == 2015) || (fig.version == 2016) )
    a = figure(num_figs + 1); 
    fig_handle = a.Number;
else
    error('New_Figure() : refer to figure() and find out the output');
end

if param == ' '
    ;
elseif strcmp(param, 'h') == 1
    hold on;
elseif strcmp(param, 'ha') == 1 || strcmp(param,'ah') == 1
    hold on;
    axis equal;
elseif strcmp(param, 'hb') == 1 || strcmp(param,'bh') == 1
    hold on;
    box on;
elseif strcmp(param, 'bha') == 1 || strcmp(param, 'hab') == 1 || ...
       strcmp(param,'ahb') == 1 || strcmp(param,'hba') == 1
    hold on;
    axis equal;
    box on;
elseif strcmp(param, 'hg') == 1 || strcmp(param, 'gh') == 1
    hold on;
    grid on;
elseif strcmp(param, 'hga') == 1 || strcmp(param, 'gha') == 1
    grid on;
    hold on;
    axis equal;
elseif strcmp(param, 'hgb') == 1 || strcmp(param, 'ghb') == 1
    grid on;
    hold on;
    box on;
elseif strcmp(param, 'hgab') == 1 || strcmp(param, 'ghab') == 1
    grid on;
    hold on;
    axis equal;
    box on;
elseif strcmp(param, 'ghaa') == 1
    grid on;
    hold on;
    axis equal;
    % plot the xyz axis
    plot3([0,fig.scale],[0,0],[0,0],'r','linewidth',2');
    plot3([0,0],[0,fig.scale],[0,0],'g','linewidth',2');
    plot3([0,0],[0,0],[0,fig.scale],'b','linewidth',2');
else
    disp('New_Figure.m: illegal parameters.');
end

axes_handles = findall(0,'type','axes');
set(axes_handles,'fontSize',fig.stick_size);   % axes stickers
label_handles = findall(findobj(gcf),'Type','text'); % xlabel, ylabel, title
set(label_handles,'fontSize',fig.font_size);
