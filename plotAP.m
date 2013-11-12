function ap = plotAP(corr, numtrue, varargin),

rec = cumsum(corr) / numtrue;
pre = cumsum(corr) ./ (1:length(corr))';

%pre = zeros(length(corr), 1);
%rec = zeros(length(corr), 1);
%for i=1:length(corr),
%  rec(i) = sum(corr(1:i)) / numtrue;
%  pre(i) = sum(corr(1:i)) / i;
%
%  progress('compute AP', i, length(corr), 10);
%end

plot(rec, pre, varargin{:});
xlim([0,1]);
ylim([0,1]);

ap = calculateAP(rec, pre);


function ap = calculateAP(rec, prec);

mrec=[0 ; rec ; 1];
mpre=[0 ; prec ; 0];
for i=numel(mpre)-1:-1:1
    mpre(i)=max(mpre(i),mpre(i+1));
end
i=find(mrec(2:end)~=mrec(1:end-1))+1;
ap=sum((mrec(i)-mrec(i-1)).*mpre(i));

