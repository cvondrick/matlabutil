% Tries to execute 'func' and only stops once it succeeds. This is useful
% for disk operations when the disk may fail and come back online later.
%
% Usage:
% >> tryfover(@() save('data.mat', 'foo', 'bar'));
function tryforever(func),

delay = 1;
while true,
  try,
    func();
    break;
  catch e,
    fprintf('error: %s (will try again in %is)\n', e.message, delay);
    pause(delay);
    delay = delay * 2;
  end
end
