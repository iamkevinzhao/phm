function gen_states()

global cyc_total;
global g_Rs g_lambda g_L1 g_J g_B g_P;
Rs = g_Rs;
lambda_p = g_lambda;
L1 = g_L1;
J = g_J;
B = g_B;
P = g_P;

global sys_ut sim_ts noise_state noise_msu;

global sim_xt sim_Zt;
sim_xt = zeros(5, cyc_total);
sim_Zt = zeros(3, cyc_total);

global sys_A sys_B;
sys_A = @(theta) ...
    [       -Rs/L1                          0                         0                 (lambda_p*fa(theta))/J    0;
               0                         -Rs/L1                       0                 (lambda_p*fb(theta))/J    0;
               0                            0                      -Rs/L1               (lambda_p*fc(theta))/J    0;
     (lambda_p*fa(theta))/J     (lambda_p*fb(theta))/J      (lambda_p*fc(theta))/J                -B/J            0;
               0                            0                         0                            P/2            0];    
           
sys_B = ...
    [1/L1     0       0        0;
      0      1/L1     0        0;
      0       0      1/L1      0;
      0       0       0      -1/J;
      0       0       0        0];    

H = ...
    [1 0 0 0 0;
     0 1 0 0 0;
     0 0 1 0 0];
 
for cyc = 2 : cyc_total;    
    xt = sim_xt(:, cyc - 1);
    theta = xt(5);
    x_dot = sys_A(theta) * xt + sys_B * sys_ut(:, cyc);
    sim_xt(:, cyc) = xt + x_dot .* sim_ts + noise_state(:, cyc);
    
    sim_Zt(:, cyc) = H * sim_xt(:, cyc) + noise_msu(:, cyc);
end

end