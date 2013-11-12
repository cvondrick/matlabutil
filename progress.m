function progress(fid, msg, i, n, delayed),

if isstr(fid),
  if exist('n', 'var'),
    delayed = n;
  end
  n = i;
  i = msg;
  msg = fid;
  fid = 1;
end

if ~exist('delayed', 'var'),
  delayed = 0;
end

persistent t;
persistent tlast;
persistent tcount;
persistent tlasti;

if isempty(t) || i <= 1 || i < tlasti,
  uprintf(fid);
  t = tic();
  tcount = 0;
  tlasti = 0;
end

if i < 0,
  return;
end

if ~isempty(tlast) && toc(tlast) < 0.1 && i ~= n,
  return;
end

if delayed > 0 && toc(t) < delayed,
  return;
end

rate = i/toc(t);

[left, leftunits] = sec2human((n-i)/rate);
[total, totalunits] = sec2human(toc(t));

switch mod(tcount,4),
  case 0, m = '|';
  case 1, m = '/';
  case 2, m = '-';
  case 3, m = '\\';
end
if i == n,
  m = '';
end

blen = 25;
b = ['|' repmat('=', 1, floor(i/n * blen)) m repmat(' ', 1, blen-floor(i/n*blen)-1) '|'];

tlast = tic();
tcount = tcount + 1;

parinfo = '';
numpars = getCurrentJob();
if ~isempty(numpars),
  numpars = length(numpars.Tasks);
  if numpars > 1,
    parinfo = sprintf('%i labs, ', numpars);
  end
end

uprintf(fid, '%s: %s  %0.1f%%%%  (%i of %i, %0.2f per sec, %s%0.2f %s taken, %0.2f %s left)', msg, b, i/n*100, i, n, rate, parinfo, total, totalunits, left, leftunits);
if i==n,
  uprintf(fid);
end
