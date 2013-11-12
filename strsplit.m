% Splits the string 'str' by 'delim' and returns a cell array.
%
% If 'delim' is not given, it defaults to white space.
%
% Why is this function not built in...?
function out = strsplit(str, delim),
if ~exist('delim', 'var'),
  delim = '\s+';
end
out = regexp(str, delim, 'split');
