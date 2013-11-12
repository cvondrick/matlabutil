function [s, units] = sec2human(s),
units = 'sec';

if s > 60,
  s = s / 60;
  units = 'min';

  if s > 60,
    s = s / 60;
    units = 'hr';

    if s > 24,
      s = s / 24;
      units = 'days';
    end
  end
end
