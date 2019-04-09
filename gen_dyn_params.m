function gen_dyn_params()

global t_seq cyc_total g_Rs g_L1 g_lambda dyn_step_ratio;

global dyn_param_type;
dyn_param_type = 2;

%% nominal
dyn_Rs_nominal = repmat(g_Rs, 1, cyc_total);
dyn_L1_nominal = repmat(g_L1, 1, cyc_total);
dyn_lambda_nominal = repmat(g_lambda, 1, cyc_total);

%% step
global g_Rs_step;
g_Rs_step = g_Rs * dyn_step_ratio;

global g_L1_step;
g_L1_step = g_L1 * dyn_step_ratio;

global g_lambda_step;
g_lambda_step = g_lambda * dyn_step_ratio;

t_trigger = 0.5;

dyn_Rs_step = t_seq;
for cyc = 1 : cyc_total
    if t_seq(cyc) > t_trigger;
        dyn_Rs_step(cyc) = g_Rs_step;
    else
        dyn_Rs_step(cyc) = g_Rs;
    end
end

dyn_L1_step = t_seq;
for cyc = 1 : cyc_total
    if t_seq(cyc) > t_trigger
        dyn_L1_step(cyc) = g_L1_step;
    else
        dyn_L1_step(cyc) = g_L1;
    end
end

dyn_lambda_step = t_seq;
for cyc = 1 : cyc_total
    if t_seq(cyc) > t_trigger
        dyn_lambda_step(cyc) = g_lambda_step;
    else
        dyn_lambda_step(cyc) = g_lambda;
    end
end

%% slope
global dyn_Rs_slope;
dyn_Rs_slope = 50;

dyn_Rs_linear = t_seq;
for cyc = 1 : cyc_total
    if t_seq(cyc) > t_trigger
        dyn_Rs_linear(cyc) = g_Rs + dyn_Rs_slope * (t_seq(cyc) - t_trigger);
    else
        dyn_Rs_linear(cyc) = g_Rs;
    end
end

global dyn_L1_slope;
dyn_L1_slope = 0.0;

dyn_L1_linear = t_seq;
for cyc = 1 : cyc_total
    if t_seq(cyc) > t_trigger
        dyn_L1_linear(cyc) = g_L1 + dyn_L1_slope * (t_seq(cyc) - t_trigger);
    else
        dyn_L1_linear(cyc) = g_L1;
    end
end

%%
global dyn_Rs dyn_L1 dyn_lambda;
if dyn_param_type == 1
    dyn_Rs = dyn_Rs_linear;
    dyn_L1 = dyn_L1_linear;
    % dyn_lambda = dyn_lambda_linear;
elseif dyn_param_type == 2
    dyn_Rs = dyn_Rs_step;
    dyn_L1 = dyn_L1_step;
    dyn_lambda = dyn_lambda_step;
else
    dyn_Rs = dyn_Rs_nominal;
    dyn_L1 = dyn_L1_nominal;
    dyn_lambda = dyn_lambda_nominal;
end
end

