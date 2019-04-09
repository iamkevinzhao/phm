function cpf()

global sys_A sys_B cyc_total sys_ut sdv_state sdv_msu sim_Zt sim_ts;

global model_xt;
model_xt = zeros(5, cyc_total);

Rk = diag(sdv_state);
Rk = Rk * Rk;

Qk = diag(sdv_msu);
Qk = Qk * Qk;

Pk = Rk;

M = [eye(3); eye(3)];

global cpf_d;
cpf_d = zeros(1, cyc_total);

for cyc = 2 : cyc_total
    xk = model_xt(:, cyc - 1);
    A = sys_A(xk(5));
    B = sys_B;
    xk_dot = A * xk + B * sys_ut(:, cyc - 1);
    xk = xk_dot .* sim_ts;
    model_xt(:, cyc) = xk;
    % Pk = (A .* sim_ts) * Pk * (A .* sim_ts)' + Rk;
    Pk = Rk;
    P = [Pk(1:3, 1:3) zeros(3, 3); zeros(3, 3) Qk];
    P
    x_hat = [xk(1:3); sim_Zt(1:3, cyc)];
    x_hat
    P_tilde = M * inv(M' * inv(P) * M) * M';
    x_tilde = P_tilde * inv(P) * x_hat;
    model_xt(1:3, cyc) = x_tilde(1:3);
    Pk(1:3, 1:3) = P_tilde(1:3, 1:3);
    cpf_d(cyc) = (x_hat - x_tilde)' * inv(P) * (x_hat - x_tilde);
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% global sdv_state sdv_msu sim_Zt sim_ts sys_A sys_B sys_ut cyc_total chi_6;
% 
% ns_state = sdv_state;
% ns_state = ns_state * 1.0;
% 
% Pk = ...
%     [ns_state(1)^2         0                0;
%            0          ns_state(2)^2         0;
%            0               0          ns_state(3)^2];
%        
% W = [Pk(1, 1) 0        0        0 0
%         0     Pk(2, 2) 0        0 0
%         0     0        Pk(3, 3) 0 0
%         0     0        0        0 0
%         0     0        0        0 0];
% 
% R = ...
%     [sdv_msu(1)^2         0              0;
%            0        sdv_msu(2)^2         0;
%            0              0        sdv_msu(3)^2;];
%        
% M = [eye(3);
%      eye(3)];
%  
% P = ...
%     [    Pk        zeros(3, 3);
%      zeros(3, 3)      R];
%  
% global model_xt;
% model_xt = zeros(5, cyc_total);
% 
% global cpf_d;
% cpf_d = zeros(1, cyc_total);
% 
% for cyc = 2 : cyc_total
%     xt = model_xt(:, cyc - 1);
%     theta = xt(5);
%     A = sys_A(theta);
%     B = sys_B;
%     x_dot = A * xt + B * sys_ut(:, cyc - 1);
%     model_xt(:, cyc) = xt + x_dot .* sim_ts;
%     Pk = A * Pk * A' + W;
%     
%     P = [Pk zeros(3, 3); zeros(3, 3) R];
%     x_hat = [model_xt(1:3, cyc); sim_Zt(:, cyc)];
%     P_tilde = M * inv(M' * inv(P) * M) * M';
%     x_tilde = P_tilde * inv(P)* x_hat;
%     d = (x_hat - x_tilde)' * inv(P) * (x_hat - x_tilde);
%     cpf_d(cyc) = d;
%     x_tilde = x_tilde(1:3);
%     if d > chi_6
%         % x_tilde = model_xt(1:3, cyc);
%     end
%     model_xt(1:3, cyc) = x_tilde;
%     Pk = P_tilde(1:3, 1:3);
% end
% 
end