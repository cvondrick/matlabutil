function out = impyramid(im, scales, pad, smalltobig),

if ~exist('scales', 'var'),
  scales = [0.5 1 1.5];
end
if ~exist('pad', 'var'),
  pad = 50;
end
if ~exist('smalltobig', 'var'),
  smalltobig = false;
end

rgb = size(im, 3);

scales = sort(scales, 'descend');

out = ones(ceil(size(im,1)*max(scales)), pad*(length(scales)-1)+ceil(sum(size(im,2)*scales)), rgb);

im = im2double(im);

if smalltobig,
  im = fliplr(im);
end
for i=1:length(scales),
  imr = imresize(im, scales(i));
  imr(imr > 1) = 1;
  imr(imr < 0) = 0;

  xoffset = floor(pad*(i-1)+sum(size(im,2)*scales(1:(i-1)))+1);
  yoffset = floor(size(out,1)/2 - size(imr,1)/2);

  out(yoffset+1:yoffset+size(imr,1), xoffset:xoffset+size(imr,2)-1, :) = imr;
end
if smalltobig,
  out = fliplr(out);
end
