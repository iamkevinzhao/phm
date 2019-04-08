function diagrams()
global t_seq sim_xt sim_Zt model_xt cpf_d chi_6 cyc_total dyn_Rs;

figure(1)
clf
subplot(3, 1, 1);
hold on
plot(t_seq, sim_xt(1, :));
plot(t_seq, sim_Zt(1, :));
plot(t_seq, model_xt(1, :));
legend('ground-truth', 'measurement', 'cpf', 'Location', 'northwest');

subplot(3, 1, 2);
hold on
plot(t_seq, cpf_d);
chi = repmat(chi_6, 1, cyc_total);
plot(t_seq, chi);

subplot(3, 1, 3);
plot(t_seq, dyn_Rs);
end