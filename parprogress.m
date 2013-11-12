function ret = parprogress(msg, x),

persistent lastid;

if exist('x', 'var'),
  if isstr(x),
    if strcmp(x, 'done'),
      delete(msg.filename); 
      fprintf('\n');
    else,
      error(sprintf('unknown command: %s', x));
    end
  else,
    filename = tempname();
    f = fopen(filename, 'w');
    fclose(f);

    ret.msg = msg;
    ret.filename = filename;
    ret.n = x;

    progress(ret.msg, -1, ret.n);
  end
else,
  f = fopen(msg.filename, 'a');
  fprintf(f, '1\n');
  fclose(f);

  if isempty(lastid) || ~strcmp(lastid, msg.filename),
    lastid = msg.filename;
    f = fopen('/dev/tty', 'w');
    progress(f, msg.msg, -1, msg.n);
    fclose(f);
  end

  t = getCurrentTask();
  if isempty(t) || t.ID == 1,
    f = fopen(msg.filename, 'r');
    i = sum(fscanf(f, '%i'));
    fclose(f);


    f = fopen('/dev/tty', 'w');
    progress(f, msg.msg, i, msg.n);
    fclose(f);
  end
end
