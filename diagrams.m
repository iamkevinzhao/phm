function diagrams()
global t_seq sim_xt sim_Zt model_xt cpf_d chi_6 cyc_total;

figure(1)
clf
subplot(2, 1, 1);
hold on
plot(t_seq, sim_xt(1, :));
plot(t_seq, sim_Zt(1, :));
plot(t_seq, model_xt(1, :));
legend('ground-truth', 'measurement', 'cpf');

subplot(2, 1, 2);
hold on
plot(t_seq, cpf_d);
chi = repmat(chi_6, 1, cyc_total);
plot(t_seq, chi);

end