function gen_inputs()

global cyc_total g_E t_seq g_omega g_Tl;

global sys_ut;
sys_ut = zeros(4, cyc_total);

sys_ut(1, :) = 1.141 * g_E * sin(2*pi*t_seq*g_omega);
sys_ut(2, :) = 1.141 * g_E * sin(2*pi*t_seq*g_omega - deg2rad(120));
sys_ut(3, :) = 1.141 * g_E * sin(2*pi*t_seq*g_omega - deg2rad(240));
sys_ut(4, :) = g_Tl; 

end