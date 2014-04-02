% Generates a random seed for MATLAB that is robust against many problems that
% crop up when laucning jobs on the cluster. It is better than just seeding
% with the clock since cluster jobs may start at the *exact* same time.
function seed = seedrandom(),

[~, hostname] = system('hostname');
hostname = strtrim(hostname);
hostname = double(hostname);
hostname = sum(hostname);

[~, randnum] = system('echo $RANDOM');
randnum = strtrim(randnum);
randnum = str2num(randnum);

pid = feature('getpid');

seed = hostname * randnum * pid;
seed = mod(seed, 2^31);

fprintf('random seed set to %i\n', seed);
rng(seed);
