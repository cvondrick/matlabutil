function im = imreadx(filepath),

im = imread(filepath);
if size(im,3) == 1,
  im = repmat(im, [1 1 3]);
end
