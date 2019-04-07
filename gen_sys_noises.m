function gen_sys_noises()

global cyc_total io_dir;

gen_new = 0; % generate new noises vs. use noises from data file

global noise_level;
noise_level = 1;

global sdv_state; % standard deviation of state noises
% sdv_state = repmat(0.1, 5, 1);
sdv_state = [0.1 * noise_level, 0.1 * noise_level, 0.1 * noise_level, 0, 0]';
global noise_state; % noises over time on system states
if gen_new == 0
    noise_state = ...
        normrnd(zeros(5, cyc_total), repmat(sdv_state, 1, cyc_total));
    save([io_dir '/noise_state.mat'], 'noise_state');
else
    noise_state = load([io_dir '/noise_state.mat']);
    noise_state = noise_state.noise_state;
end

global sdv_msu; % standard deviation of measurement noises
sdv_msu = repmat(0.1 * noise_level, 3, 1);
global noise_msu; % noises over time on measurements
if gen_new == 1
    noise_msu = ...
        normrnd(zeros(3, cyc_total), repmat(sdv_msu, 1, cyc_total));
    save([io_dir '/noise_msu.mat'], 'noise_msu');
else
    noise_msu = load([io_dir '/noise_msu.mat']);
    noise_msu = noise_msu.noise_msu;
end

end