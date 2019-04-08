function diagrams()
global t_seq sim_xt sim_Zt model_xt cpf_d chi_6 cyc_total dyn_Rs;
global dyn_param_type dyn_Rs_slope g_Rs g_Rs_step noise_level dyn_L1;
global dyn_L1_slope g_L1 g_L1_step;

num_plot = 2;
if dyn_param_type ~= 0
    num_plot = 4;
end

figure(1);
clf;
plot_id = 1;
subplot(num_plot, 1, plot_id); plot_id = plot_id + 1;
hold on
plot(t_seq, sim_xt(1, :));
% plot(t_seq, sim_Zt(1, :));
% plot(t_seq, model_xt(1, :));
% legend('ground-truth', 'measurement', 'cpf', 'Location', 'northwest');
% noise_desc = {'low', 'medium', 'high'};
% title(sprintf('Ia over time (noise level: %s)', noise_desc{noise_level}));

subplot(num_plot, 1, plot_id); plot_id = plot_id + 1;
hold on
plot(t_seq, cpf_d);
chi = repmat(chi_6, 1, cyc_total);
plot(t_seq, chi);
title('Confidence over time');

if dyn_param_type ~= 0
    subplot(num_plot, 1, plot_id); plot_id = plot_id + 1;
    plot(t_seq, dyn_Rs);
    if dyn_param_type == 1
        title(sprintf('Rs over time (slope = %0.2f)', dyn_Rs_slope));
    elseif dyn_param_type == 2
        title(sprintf('Rs over time (Rs: %0.2f -> %0.2f)', g_Rs, g_Rs_step));
    end
    
    subplot(num_plot, 1, plot_id); plot_id = plot_id + 1;
    plot(t_seq, dyn_L1);
    if dyn_param_type == 1
        title(sprintf('L1 over time (slope = %0.2f)', dyn_L1_slope));
    elseif dyn_param_type == 2
        title(sprintf('L1 over time (Rs: %0.5f -> %0.5f)', g_L1, g_L1_step));
    end
end
end