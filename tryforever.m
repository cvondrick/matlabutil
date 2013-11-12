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
