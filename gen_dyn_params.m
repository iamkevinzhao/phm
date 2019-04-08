function gen_dyn_params()

global t_seq cyc_total sim_ts g_Rs;

dyn_Rs_step = t_seq;
for cyc = 1 : cyc_total
    if t_seq(cyc) > 0.5
        dyn_Rs_step(cyc) = g_Rs * 5;
    else
        dyn_Rs_step(cyc) = g_Rs;
    end
end

dyn_Rs_linear = t_seq;
for cyc = 1 : cyc_total
    if t_seq(cyc) > 0.5
        dyn_Rs_linear(cyc) = g_Rs + 1.0 * (t_seq(cyc) - 0.5);
    else
        dyn_Rs_linear(cyc) = g_Rs;
    end
end

global dyn_Rs;
dyn_Rs = dyn_Rs_step;

end

