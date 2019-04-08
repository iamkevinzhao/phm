function [matA, matB] = sys_mats(theta, cyc)

global g_Rs g_L1 g_lambda g_J g_B g_P dyn_Rs dyn_L1 dyn_lambda;
Rs = g_Rs;
L1 = g_L1;
lambda_p = g_lambda;
J = g_J;
B = g_B;
P = g_P;

Rs = dyn_Rs(cyc);
L1 = dyn_L1(cyc);
lambda_p = dyn_lambda(cyc);

matA = ...
    [       -Rs/L1                          0                         0                 (lambda_p*fa(theta))/J    0;
               0                         -g_Rs/g_L1                       0                 (g_lambda*fb(theta))/J    0;
               0                            0                      -g_Rs/g_L1               (g_lambda*fc(theta))/J    0;
     (lambda_p*fa(theta))/J     (g_lambda*fb(theta))/J      (g_lambda*fc(theta))/J                -B/J            0;
               0                            0                         0                            P/2            0];

matB = ...
    [1/L1     0       0        0;
      0      1/g_L1     0        0;
      0       0      1/g_L1      0;
      0       0       0      -1/J;
      0       0       0        0];
end

