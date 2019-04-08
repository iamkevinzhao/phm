function [matA, matB] = sys_mats(theta, cyc)

global g_Rs g_L1 g_lambda g_J g_B g_P dyn_Rs;
Rs = g_Rs;
L1 = g_L1;
lambda_p = g_lambda;
J = g_J;
B = g_B;
P = g_P;

Rs = dyn_Rs(cyc);

matA = ...
    [       -Rs/L1                          0                         0                 (lambda_p*fa(theta))/J    0;
               0                         -Rs/L1                       0                 (lambda_p*fb(theta))/J    0;
               0                            0                      -Rs/L1               (lambda_p*fc(theta))/J    0;
     (lambda_p*fa(theta))/J     (lambda_p*fb(theta))/J      (lambda_p*fc(theta))/J                -B/J            0;
               0                            0                         0                            P/2            0];

matB = ...
    [1/L1     0       0        0;
      0      1/L1     0        0;
      0       0      1/L1      0;
      0       0       0      -1/J;
      0       0       0        0];
end

