function uprintf(fid, varargin)

if exist('fid'),
  if isstr(fid),
    fmt = fid;
    args = varargin;
    fid = 1;
  else,
    if length(varargin) >= 1,
      fmt = varargin{1};
    end
    if length(varargin) >= 2,
      args = varargin(2:end);
    else,
      args = cell(0,0);
    end
  end
else,
  fid = 1;
end

persistent th;

if isempty(th),
  th = 0;
end

if ~exist('fmt', 'var'),
  if th ~= 0,
    th = 0;
    fprintf(fid, '\n');
  end
  return;
end

if th > 0,
  fprintf(fid, repmat('\b', 1, th));
end

msg = sprintf(fmt, args{:});
len = length(sprintf(msg));
th = max(len, th);

fprintf(fid, msg);
fprintf(fid, repmat(' ', 1, th-len));
fprintf(fid, repmat('\b', 1, th-len));
