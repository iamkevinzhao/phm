function value = fb(theta)

theta = wrapTo2Pi(theta);

global g_E;

if 0 <= theta && theta < (pi/2)
    value = g_E;
    return;
end

if (pi/2) <= theta && theta < (5*pi/6)
    value = (6*g_E/pi)*theta - 4*g_E;
    return;
end

if (5*pi/6) <= theta && theta < (9*pi/6)
    value = g_E;
    return;
end

if (9*pi/6) <= theta && theta < (11*pi/6)
    value = -(6*g_E/pi)*theta + 10*g_E;
    return;
end

if (11*pi/6) <= theta && theta <= (2*pi)
    value = g_E;
    return;
end

end

