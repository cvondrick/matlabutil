% Converts the time-in-seconds to a more human readable format, by
% automatically picking whether to use seconds, minutes, hours, or days.
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
