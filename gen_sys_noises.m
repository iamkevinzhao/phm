function gen_sys_noises()

global cyc_total io_dir sim_ts sdv_msu_common sdv_xdot_common;

gen_new = 1; % generate new noises vs. use noises from data file

global noise_level;
noise_level = 1;

global sdv_xdot;
global state_noise_level;
if sdv_xdot_common == 40
    state_noise_level = 1;
elseif sdv_xdot_common == 200
    state_noise_level = 5;
elseif sdv_xdot_common == 400
    state_noise_level = 10;
end
sdv_xdot = [sdv_xdot_common * noise_level, sdv_xdot_common * noise_level, sdv_xdot_common * noise_level, 0, 0]';
global sdv_state;
sdv_state = sdv_xdot .* sim_ts; % important!
global noise_xdot;
if gen_new == 1
    noise_xdot = ...
        normrnd(zeros(5, cyc_total), repmat(sdv_xdot, 1, cyc_total));
    save([io_dir '/noise_xdot.mat'], 'noise_xdot');
else
    noise_xdot = load([io_dir '/noise_xdot.mat']);
    noise_xdot = noise_xdot.noise_xdot;
end

global sdv_msu; % standard deviation of measurement noises
global msu_noise_level;
if sdv_msu_common == 0.1
    msu_noise_level = 1;
elseif sdv_msu_common == 0.5
    msu_noise_level = 5;
end
sdv_msu = repmat(sdv_msu_common, 3, 1);
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