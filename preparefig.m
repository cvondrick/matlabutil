function preparefig(h),

if ~exist('h', 'var'),
  h = gcf;
end

%ti = get(gca,'TightInset');
%set(gca,'Position',[ti(1) ti(2) 1-ti(3)-ti(1) 1-ti(4)-ti(2)]);
%
%set(gca,'units','centimeters');
%pos = get(gca,'Position');
%ti = get(gca,'TightInset');
%
%set(gcf, 'PaperUnits','centimeters');
%set(gcf, 'PaperSize', [pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);
%set(gcf, 'PaperPositionMode', 'manual');
%set(gcf, 'PaperPosition',[0 0 pos(3)+ti(1)+ti(3) pos(4)+ti(2)+ti(4)]);

set(h, 'PaperUnits','centimeters');
set(h, 'Units','centimeters');
pos=get(h,'Position');
set(h, 'PaperSize', [pos(3) pos(4)]);
set(h, 'PaperPositionMode', 'manual');
set(h, 'PaperPosition',[0 0 pos(3) pos(4)]);
