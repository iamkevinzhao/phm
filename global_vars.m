clear all;

params

global sim_ts; % simulation time step
sim_ts = 0.0001; 

global sim_total; % total simulation time
sim_total = 1.0;

global sim_t; % simulation time
sim_t = 0;

global sim_cyc; % simulation cycle
sim_cyc = 0;

global cyc_total; % number of total simulation cycles
cyc_total = sim_total / sim_ts;

global io_dir;
io_dir = '../phm_io';

global t_seq;
t_seq = zeros(1, cyc_total);
for cyc = 1 : cyc_total;
    t_seq(cyc) = sim_ts * cyc;
end