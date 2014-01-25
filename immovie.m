% Plays a sequence of images as a movie.
%
% 'data' should be a HxWxN or HxWx3wN tensor for N frames. The movie will
% pause for 'rate' seconds after each frame. 
%
% If 'loop' is positive, then loop that many times. If 'loop' is zero, then
% loop forever.
function immovie(data, rate, loop),

if ~exist('rate', 'var'),
  rate = 0.5;
end
if ~exist('loop', 'var'),
  loop = 0;
end

rgb = length(size(data)) == 4;

if rgb,
  n = size(data, 4);
else,
  n = size(data, 3);
end

iter = 0;
while true,
  for i=1:n,
    if rgb,
      imagesc(data(:, :, :, i));
    else,
      imagesc(data(:, :, i));
    end 

    title(sprintf('%i of %i', i, n));

    axis image;
    pause(rate);
  end
  iter = iter + 1;
  if loop ~= 0 && iter >= loop,
    break;
  end
end
