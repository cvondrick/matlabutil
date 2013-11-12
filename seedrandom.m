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

rng(seed);

fprintf('random seed set to %i = %i * %i * %i\n', seed, hostname, randnum, pid);
