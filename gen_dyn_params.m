function gen_dyn_params()

global t_seq cyc_total g_Rs;

global dyn_param_type;
dyn_param_type = 1;

dyn_Rs_nominal = repmat(g_Rs, 1, cyc_total);

global g_Rs_step;
g_Rs_step = g_Rs * 6;

dyn_Rs_step = t_seq;
for cyc = 1 : cyc_total
    if t_seq(cyc) > 0.5
        dyn_Rs_step(cyc) = g_Rs_step;
    else
        dyn_Rs_step(cyc) = g_Rs;
    end
end

global dyn_Rs_slope;
dyn_Rs_slope = 50;

dyn_Rs_linear = t_seq;
for cyc = 1 : cyc_total
    if t_seq(cyc) > 0.5
        dyn_Rs_linear(cyc) = g_Rs + dyn_Rs_slope * (t_seq(cyc) - 0.5);
    else
        dyn_Rs_linear(cyc) = g_Rs;
    end
end

global dyn_Rs;
if dyn_param_type == 1
    dyn_Rs = dyn_Rs_linear;
elseif dyn_param_type == 2
    dyn_Rs = dyn_Rs_step;
else
    dyn_Rs = dyn_Rs_nominal;
end
end

