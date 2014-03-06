function im = removecolorborder(im, color, thresh),

im = im2double(im);

if ~exist('thresh', 'var'),
  thresh = 0.1;
end

if length(size(im)) == 2,
  im = repmat(im, [1 1 3]);
end

im = scan(im, color, thresh);
im = scan(rot(im), color, thresh);
im = scan(rot(im), color, thresh);
im = scan(rot(im), color, thresh);
im = rot(im);


function im = scan(im, color, thresh),
c = repmat(color', [1 size(im,2)])';
for i=1:size(im,1),
  a = squeeze(im(i, :, :));
  d = abs(a - c);
  if any(d(:) >= thresh),
    break;
  end
end

im = im(i:end, :, :);


function out = rot(im),

out = zeros(size(im,2), size(im,1), 3);

for i=1:3,
  out(:, :, i) = rot90(im(:, :, i));
end
