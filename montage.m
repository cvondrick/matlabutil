% M = montage(images[, cy, cx[, pad]])
%
% Takes the cell array 'images' and displays the first
% cy*cx images of them on a grid, with 'pad' pixels in between.
function M = montage(images, cy, cx, pad),

if isnumeric(images),
  rgb = length(size(images)) == 4 && size(images,3) == 3;

  if rgb,
    imagescell = cell(size(images, 4), 1);
    for i=1:size(images,4),
      imagescell{i} = images(:, :, :, i);
    end
  else,
    imagescell = cell(size(images, 3), 1);
    for i=1:size(images,3),
      imagescell{i} = images(:, :, i);
    end
  end
  images = imagescell;
end

if ~exist('cy', 'var'),
  cy = floor(sqrt(length(images)));
end
if ~exist('cx', 'var'),
  cx = ceil(sqrt(length(images)));
end
if ~exist('pad', 'var'),
  pad = 5;
end

if cy < 0 && cx > 0,
  cy = ceil(length(images) / cx);
end
if cx < 0 && cy > 0,
  cx = ceil(length(images) / cy);
end

if length(images) == 0,
  M = [];
  return;
end

ny = size(images{1}, 1)+pad*2;
nx = size(images{1}, 2)+pad*2;
nf = size(images{1}, 3);

M = ones(ny*cy, nx*cx, nf);
c = 1;
for j=1:cy,
  for i=1:cx,
    im = padarray(im2double(images{c}), [pad pad 0], 1);
    im = imresize(im, [ny nx]);
    im(im > 1) = 1;
    im(im < 0) = 0;
    M((j-1)*ny+1:j*ny, (i-1)*nx+1:i*nx, :) = im;
    c = c + 1;
    if c > length(images),
      return;
    end
  end
end
