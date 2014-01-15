function out = recursivedir(dirpath),

out = cell(0);
c = 1;
names = dir(dirpath);
for i=1:length(names),
  if ~names(i).isdir,
    out{c} = [dirpath '/' names(i).name];
    c = c + 1;
  elseif names(i).name(1) ~= '.',
    sub = recursivedir([dirpath '/' names(i).name]);
    for j=1:length(sub),
      out{c} = sub{j};
      c = c + 1;
    end
  end
end
