function out = imsize(impath),

try,
  warning off; iminfo = imfinfo(data{i}.impath); warning on;
  out = [iminfo.Height iminfo.Width];
catch,
  out = size(imread(impath));
  out = out(1:2);
end
