function tprintf(fmt, varargin)

persistent th;
persistent len;

if isempty(th),
  th = 0;
  len = 0;
end

targetcol = 50;

if ~exist('fmt', 'var'),
  printcol = targetcol - len;
  [s, units] = sec2human(toc(th));

  fprintf(repmat(' ', printcol, 1));
  fprintf(' (%0.2f %s)\n', s, units);

  len = 0;
  return;
end

th = tic();
msg = sprintf(fmt, varargin{:});
len = len + length(msg);

fprintf(msg);
