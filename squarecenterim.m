function im = squarecenterim(im),

s = max(size(im,1), size(im,2));

if size(im,1) < s,
  a = floor((s-size(im,1))/2);
  b = ceil((s-size(im,1))/2);
  im = padarray(im, [a 0 0], 1, 'pre');
  im = padarray(im, [b 0 0], 1, 'post');
elseif size(im,2) < s
  a = floor((s-size(im,2))/2);
  b = ceil((s-size(im,2))/2);
  im = padarray(im, [0 a 0], 1, 'pre');
  im = padarray(im, [0 b 0], 1, 'post');
end
