% mkdirifnot(filepath)
%
% Makes the directory if it does not already exist. Otherwise, does nothing.
function mkdirifnot(x),

if ~exist(x, 'dir'),
  mkdir(x);
end
