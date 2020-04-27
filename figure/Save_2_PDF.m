%**************************************************************************
%   File Name     : Save_2_PDF.m
%   Author        : Dingjiang Zhou
%                   Boston University, Boston, 02215
%   Create Time   : Tue, Aug. 11th, 2015. 04:26:01 PM
%   Last Modified : Fri, Mar. 11th, 2016. 09:11:21 PM
%   Purpose       : save figures into pdf file
%**************************************************************************
function Save_2_PDF(fig_no, folder, pdfname, size, fig)
Disp_Section
if folder == '0'
    disp(['Saving figure ',num2str(fig_no),' to default folder.']);
    disp('~/');
else
    disp(['Saving figure ',num2str(fig_no),' to folder: ',folder]);
end
disp(['as a pdf file: ',pdfname,'.pdf.']);
disp('Thanks for your patience ....');

if folder == '0' % use default
    FOLDER = '~/';
else
    FOLDER = folder;
end

figure(fig_no);
% for all subplots ------------------------------------------------------------------------
axesHandles = findall(0,'type','axes');
set(axesHandles,'fontSize',fig.stick_size);   % axes stickers
labelHandles = findall(findobj(gcf),'Type','text'); % xlabel, ylabel, title
set(labelHandles,'fontSize',fig.font_size);

% save to a pdf file ---------------------------------------------------------------------
set(gcf, 'PaperPosition', [0 0 size(1) size(2)]);
set(gcf, 'PaperSize', [size(1) size(2)]);
saveas(gcf, [FOLDER,pdfname], 'pdf');

% -----------------------------------------------------------------------------------------
disp(['figure ',num2str(fig_no),' is saved.']);

Disp_Section



