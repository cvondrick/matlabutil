% fprintf() with update
%
% It prints to the screen, but deletes the previous line first. This is useful
% for long running jobs when you want to print a status, but not cause your
% terminal to scroll.
%
% Usage:
% >> uprintf('hello there');
% >> uprintf('hello %s!\n', 'carl');
% >> uprintf();
% >> uprintf('goodbye');
%
% The empty call to uprintf() tells it to stop deleting until the next command.
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
