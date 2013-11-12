% mkdirifnot(filepath)
%
% Makes the directory if it does not already exist. Otherwise, does nothing.
function mkdirifnot(x),

warning off;
mkdir(x);
warning on;
