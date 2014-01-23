function immovie(data, rate, loop),

if ~exist('rate', 'var'),
  rate = 0.1;
end
if ~exist('loop', 'var'),
  loop = false;
end

rgb = length(size(data)) == 4;

if rgb,
  n = size(data, 4);
else,
  n = size(data, 3);
end

while true,
  for i=1:n,
    if rgb,
      imagesc(data(:, :, :, i));
    else,
      imagesc(data(:, :, i));
    end 

    axis image;
    pause(rate);
  end
  if ~loop,
    break;
  end
end
