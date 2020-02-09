% -------------------------------------------------------------------------
% Author    : Dingjiang Zhou <zhoudingjiang@gmail.com>
%             Boston University, Boston, 02215
% Created   : Fri. Feb 22th, 2013, 09:02:11 PM

% Used in   : all available minitors by Dingjiang Zhou, also for the dual 
%             monitor combination with the big one on the right for display
%             the figures.

% Thanks to : Charles Plum  <cplum@nichols.com>
%             Nichols Research Corp.
%             70 Westview Street, Kilnbrook IV, Lexington, MA 02173
%             Tel: (781) 862-9400, Fax: (781) 862-9485
% -------------------------------------------------------------------------
function Tile_Figures()

maxfigs = 100;

maxpos  = get(0,'screensize');   % get the screen size information
hands   = get(0,'Children');     % locate fall open figure handles
hands   = sort(hands);           % sort figure handles
numfigs = size(hands,1);         % number of open figures
if (numfigs > maxfigs)           % figure limit check
    disp(['Cannot display more than' num2str(maxfigs) ' figures'])
    return
end

% -------------------------------------------------------------------------
% determining nrows, ncols, figure width, figure heigth, display start
% point (left, down) coordinates and also figure scales.
if nargin == 0
    if numfigs == 0
        disp('tilefigs.m: No figure, exit.');
        return
    elseif numfigs == 1
        nrows = 1;
        ncols = 1;
        xlen = fix(maxpos(3)/ncols);
        ylen = fix(maxpos(4)/nrows);
        if (maxpos(3) == 3840) && (maxpos(4) == 1080)
            x_scale = 0.6;
            y_scale = 0.7;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1620;
            Yorigin = 50;
        elseif (maxpos(3) == 3520) && (maxpos(4) == 1080)   % done 
%             x_scale = 0.4;
            x_scale = 0.6;
            y_scale = 0.7;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1620;
            Yorigin = 50;
        elseif (maxpos(3) == 3286) && (maxpos(4) == 1080)   % 1366 + 1920 
            x_scale = 0.6;
            y_scale = 0.7;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1420;
            Yorigin = 50;
        elseif (maxpos(3) == 3200) && (maxpos(4) == 1080)   % 1280 + 1920 
            x_scale = 0.4;
            y_scale = 0.7;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1420;
            Yorigin = 50;
        elseif (maxpos(3) == 1920) && (maxpos(4) == 1080)  % done 
            x_scale = 0.56;
            y_scale = 0.7;
            Xorigin = 30;
            Yorigin = 10;
        elseif (maxpos(3) == 1600) && (maxpos(4) == 900)  
            x_scale = 0.5;
            y_scale = 0.74;
            Xorigin = 10;
            Yorigin = -10;
        elseif (maxpos(3) == 1440) && (maxpos(4) == 900)  
            x_scale = 0.5;
            y_scale = 0.74;
            Xorigin = 10;
            Yorigin = -10;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 800) % screen for Mackbook retina
            x_scale = 0.54;
            y_scale = 0.78;
            Xorigin = 0;
            Yorigin = 0;
        elseif (maxpos(3) == 1366) && (maxpos(4) == 768)  % only for windows!
            x_scale = 0.64;
            y_scale = 0.70;
            Xorigin = 460;
            Yorigin = 5;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 1024)  % screen in the BU library
            x_scale = 0.93;
            y_scale = 0.75;
            Xorigin = 0-5;
            Yorigin = 38;
        elseif (maxpos(3) == 800) && (maxpos(4) == 600)  % lab presentation
            x_scale = 2;
            y_scale = 1.4;
            Xorigin = -20;
            Yorigin = 0;
        else
            errAndReturn
        end
    elseif numfigs == 2
        nrows = 1;
        ncols = 2;
        xlen = fix(maxpos(3)/ncols);
        ylen = fix(maxpos(4)/nrows);
        if (maxpos(3) == 3840) && (maxpos(4) == 1080)   
            x_scale = 0.95;
            y_scale = 0.75;
            xlen = fix(1920/ncols); % modify again
            ylen = fix(1080/nrows);
            Xorigin = 1600-2;
            Yorigin = 60;
        elseif (maxpos(3) == 3520) && (maxpos(4) == 1080)   
            x_scale = 0.95;
            y_scale = 0.75;
            xlen = fix(1920/ncols); % modify again
            ylen = fix(1080/nrows);
            Xorigin = 1600-2;
            Yorigin = 60;
        elseif (maxpos(3) == 3286) && (maxpos(4) == 1080)   % 1366 + 1920 
            x_scale = 0.9;
            y_scale = 0.7;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1420;
            Yorigin = 50;
        elseif (maxpos(3) == 3200) && (maxpos(4) == 1080)   % 1280 + 1920 
            x_scale = 0.85;
            y_scale = 0.7;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1320;
            Yorigin = 50;
        elseif (maxpos(3) == 1920) && (maxpos(4) == 1080)  
            x_scale = 0.93;
            y_scale = 0.68;
            Xorigin = 10;
            Yorigin = 20;
        elseif (maxpos(3) == 1600) && (maxpos(4) == 900)  
            x_scale = 0.93;
            y_scale = 0.76;
            Xorigin = 0-5;
            Yorigin = 10;
        elseif (maxpos(3) == 1440) && (maxpos(4) == 900)  
            x_scale = 0.93;
            y_scale = 0.76;
            Xorigin = 0-5;
            Yorigin = 10;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 800)  
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1366) && (maxpos(4) == 768)  % only for windows!
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0-5;
            Yorigin = 50;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 1024)  % screen in the BU library
            x_scale = 0.93;
            y_scale = 0.75;
            Xorigin = 0-5;
            Yorigin = 38;
        else
            errAndReturn
        end
    elseif numfigs <= 4
        nrows = 2;
        ncols = 2;
        xlen = fix(maxpos(3)/ncols);
        ylen = fix(maxpos(4)/nrows);
        if (maxpos(3) == 3840) && (maxpos(4) == 1080)   
            x_scale = 0.8;
            y_scale = 0.7;
            xlen = fix(1920/ncols); % modify again
            ylen = fix(1080/nrows);
            Xorigin = 1930;
            Yorigin = 0-10;
        elseif (maxpos(3) == 3520) && (maxpos(4) == 1080)   
            x_scale = 0.93;
            y_scale = 0.79;
            xlen = fix(1920/ncols); % modify again
            ylen = fix(1080/nrows);
            Xorigin = 1600-2;
            Yorigin = 0-10;
        elseif (maxpos(3) == 3286) && (maxpos(4) == 1080)   % 1366 + 1920 
            x_scale = 0.92;
            y_scale = 0.75;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1400-30;
            Yorigin = 40;
        elseif (maxpos(3) == 3200) && (maxpos(4) == 1080)   % 1366 + 1920 
            x_scale = 0.92;
            y_scale = 0.75;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1300;
            Yorigin = 10;
        elseif (maxpos(3) == 1920) && (maxpos(4) == 1080)  
            x_scale = 0.9;
            y_scale = 0.72;
            Xorigin = 50;
            Yorigin = 20;
        elseif (maxpos(3) == 1600) && (maxpos(4) == 900)  
            x_scale = 0.97;
            y_scale = 0.76;
            Xorigin = 0-5;
            Yorigin = 0-10;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 800)  
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1366) && (maxpos(4) == 768)  
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0-5;
            Yorigin = 20;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 1024)  % screen in the BU library
            x_scale = 0.93;
            y_scale = 0.75;
            Xorigin = 0-5;
            Yorigin = 38;
        elseif (maxpos(3) == 800) && (maxpos(4) == 600)  % lab presentation
            x_scale = 0.92;
            y_scale = .75;
            Xorigin = -5;
            Yorigin = 38;
        else
            errAndReturn
        end
    elseif numfigs <= 6
        nrows = 2;
        ncols = 3;
        xlen = fix(maxpos(3)/ncols);
        ylen = fix(maxpos(4)/nrows);
        if (maxpos(3) == 3840) && (maxpos(4) == 1080) 
            x_scale = 0.8;
            y_scale = 0.7;
            xlen = fix(1920/ncols); % modify again
            ylen = fix(1080/nrows);
            Xorigin = 1940;
            Yorigin = -10;
        elseif (maxpos(3) == 3520) && (maxpos(4) == 1080) 
            x_scale = 0.95;
            y_scale = 0.8;
            xlen = fix(1920/ncols); % modify again
            ylen = fix(1080/nrows);
            Xorigin = 1600;
            Yorigin = -10;
        elseif (maxpos(3) == 3200) && (maxpos(4) == 1080)   % 1366 + 1920 
            x_scale = 0.92;
            y_scale = 0.75;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1400-30;
            Yorigin = 40;
        elseif (maxpos(3) == 1920) && (maxpos(4) == 1080)  
            x_scale = 0.94;
            y_scale = 0.78;
            Xorigin = -5;
            Yorigin = 0;
        elseif (maxpos(3) == 1600) && (maxpos(4) == 900)  
            x_scale = 0.96;
            y_scale = 0.76;
            Xorigin = 0-5;
            Yorigin = 0-10;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 800)  
            x_scale = 0.92;
            y_scale = 0.72;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1366) && (maxpos(4) == 768)  % not tuned.
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0-5;
            Yorigin = 20;
        elseif (maxpos(3) == 1366) && (maxpos(4) == 768)  
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 1024)  % screen in the BU library
            x_scale = 0.94;
            y_scale = 0.75;
            Xorigin = 0;
            Yorigin = 35;
        elseif (maxpos(3) == 3286) && (maxpos(4) == 1080)  % T420 + 1080p screen
            x_scale = 0.92;
            y_scale = 0.75;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1400-30;
            Yorigin = 40;
        else
            errAndReturn
        end
    elseif numfigs <= 9
        nrows = 3;
        ncols = 3;
        xlen = fix(maxpos(3)/ncols);
        ylen = fix(maxpos(4)/nrows);
        if (maxpos(3) == 3520) && (maxpos(4) == 1080) 
            x_scale = 0.95;
            y_scale = 0.71;
            xlen = fix(1920/ncols); % modify again
            ylen = fix(1080/nrows);
            Xorigin = 1600-10;
            Yorigin = 0-10;
        elseif (maxpos(3) == 3200) && (maxpos(4) == 1080)   % 1280 + 1920 
            x_scale = 0.92;
            y_scale = 0.7;
            xlen = fix(1920/ncols);
            ylen = fix(1080/nrows);
            Xorigin = 1400-30;
            Yorigin = -10;
        elseif (maxpos(3) == 1920) && (maxpos(4) == 1080)  
            x_scale = 0.95;
            y_scale = 0.68;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1600) && (maxpos(4) == 900)  
            x_scale = 0.96;
            y_scale = 0.67;
            Xorigin = 0-5;
            Yorigin = 0-10;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 800)  
            x_scale = 0.93;
            y_scale = 0.59;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1366) && (maxpos(4) == 768)  
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 1024)  % screen in the BU library
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0;
            Yorigin = 20;
        else
            errAndReturn
        end
    elseif numfigs <= 12     
        nrows = 3;
        ncols = 4;
        xlen = fix(maxpos(3)/ncols);
        ylen = fix(maxpos(4)/nrows);
        if (maxpos(3) == 3520) && (maxpos(4) == 1080)    
            x_scale = 0.96;
            y_scale = 0.72;
            xlen = fix(1920/ncols); % modify again
            ylen = fix(1080/nrows);
            Xorigin = 1600-8;
            Yorigin = 0-10;
        elseif (maxpos(3) == 1920) && (maxpos(4) == 1080)  
            x_scale = 0.92;
            y_scale = 0.69;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1600) && (maxpos(4) == 900)  
            x_scale = 0.95;
            y_scale = 0.65;
            Xorigin = 0-5;
            Yorigin = 0-10;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 800)  
           x_scale = 0.92;
            y_scale = 0.60;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1366) && (maxpos(4) == 768)  
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 1024)  % screen in the BU library
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0;
            Yorigin = 20;
        else
            errAndReturn
        end
    elseif numfigs <= 16    
        nrows = 4;
        ncols = 4;
        xlen = fix(maxpos(3)/ncols);
        ylen = fix(maxpos(4)/nrows);
        if (maxpos(3) == 3520) && (maxpos(4) == 1080)  
            x_scale = 0.95;
            y_scale = 0.62;
            xlen = fix(1920/ncols); % modify again
            ylen = fix(1080/nrows);
            Xorigin = 1600-5;
            Yorigin = 0-10;
        elseif (maxpos(3) == 1920) && (maxpos(4) == 1080)  
            x_scale = 0.94;
            y_scale = 0.61;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1600) && (maxpos(4) == 900)  
            x_scale = 0.95;
            y_scale = 0.55;
            Xorigin = 0-5;
            Yorigin = 0-10;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 800)  
            x_scale = 0.92;
            y_scale = 0.5;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1366) && (maxpos(4) == 768)  
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0;
            Yorigin = 20;
        elseif (maxpos(3) == 1280) && (maxpos(4) == 1024)  % screen in the BU library
            x_scale = 0.94;
            y_scale = 0.70;
            Xorigin = 0;
            Yorigin = 20;
        else
           errAndReturn
        end
    else  % numfigs > 16            % NOT SURE OF WHAT IS THIS
        error('tilefigs: Too many figures, I cannot handle');
        maxfactor = sqrt(maxfigs);	% max number of figures per row or column
        sq = [2:maxfactor].^2;      % vector of integer squares
        sq = sq(find(sq>=numfigs)); % determine square grid size
        gridsize = sq(1);           % best grid size
        nrows = sqrt(gridsize);     % figure size screen scale factor
        ncols = nrows;   
    end
elseif nargin > 0                   % NO CHANCE TO FIGURE THIS OUT 
   	nrows = tile(1);
  	ncols = tile(2);
  	if numfigs > nrows*ncols
        disp([' requested tile size too small for ' ...
        num2str(numfigs) ' figures '])
     	return
 	end
end
% a little modification
if numfigs > 6 && numfigs <= 12 
    ylen = ylen - 10;
elseif numfigs <= 16;
    ylen = ylen - 12;
end

% -------------------------------------------------------------------------
% tile figures by position, Location (1,1) is at bottom left corner
pnum = 0;
for iy = 1:nrows
    ypos = Yorigin + 25 + (nrows-iy)*ylen;
    for ix = 1:ncols
        xpos = Xorigin +25 + (ix-1)*xlen;     
        pnum = pnum + 1;
        if pnum > numfigs
            break
        end
        % move figure
        figure(hands(pnum))
        set(hands(pnum),'Position',[xpos, ypos, xlen*x_scale, ylen*y_scale]); 
    end
end

return

% -------------------------------------------------------------------------
% sub function
function errAndReturn
    disp('tilefigs.m: Error screen size.');
    disp('Restart the Matlab may works if the computer has a resolution problem.');
return



% end of file -------------------------------------------------------------

