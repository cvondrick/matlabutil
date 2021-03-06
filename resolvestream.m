% resolvestream(stream)
%
% If stream is a directory, convert to list of paths. Otherwise,
% do nothing.
function stream = resolvestream(stream),

if isstr(stream),
  directory = stream;
  files = dir(stream);
  clear stream;
  c = 1;
  iii = randperm(length(files));
  for i=1:length(files);
    if ~files(iii(i)).isdir,
      stream{c} = [directory '/' files(iii(i)).name];
      c = c + 1;
    end
  end
end
