function out = strsplit(str, delim),
if ~exist('delim', 'var'),
  delim = '\s+';
end
out = regexp(str, delim, 'split');
