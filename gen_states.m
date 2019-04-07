global cyc_total;
global g_Rs g_lambda g_L1 g_J g_B g_P;
Rs = g_Rs;
lambda_p = g_lambda;
L1 = g_L1;
J = g_J;
B = g_B;
P = g_P;

global sys_ut sim_ts;

model_xt = zeros(5, cyc_total);
sim_xt = zeros(5, cyc_total);

for cyc = 2 : cyc_total;
    theta = model_xt(5, cyc - 1);

    A = ...
        [       -Rs/L1                          0                         0                 (lambda_p*fa(theta))/J    0;
                   0                         -Rs/L1                       0                 (lambda_p*fb(theta))/J    0;
                   0                            0                      -Rs/L1               (lambda_p*fc(theta))/J    0;
         (lambda_p*fa(theta))/J     (lambda_p*fb(theta))/J      (lambda_p*fc(theta))/J                -B/J            0;
                   0                            0                         0                            P/2            0];
          
    B_mat = ...
        [1/L1     0       0        0;
          0      1/L1     0        0;
          0       0      1/L1      0;
          0       0       0      -1/J;
          0       0       0        0];
    xt = model_xt(:, cyc - 1);
    x_dot = A * xt + B_mat * sys_ut(:, cyc);
    model_xt(:, cyc) = xt + x_dot .* sim_ts;
end

clf
global t_seq;
plot(t_seq, model_xt(1, :));
hold on