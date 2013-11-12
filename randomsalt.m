% Generates a random salt for use in cluster jobs.
function s = randomsalt(),

s = dec2hex(randi(1000000000000));
