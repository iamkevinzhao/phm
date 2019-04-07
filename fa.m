function value = fa(theta)

theta = wrapTo2Pi(theta);

global g_E;

if 0 <= theta && theta < (pi/6)
    value = g_E;
    return;
end

if (pi/6) <= theta && theta < (pi/2)
    value = -(6*g_E/pi)*theta + 2*g_E;
    return;
end

if (pi/2) <= theta && theta < (7*pi/6)
    value = -g_E;
    return;
end

if (7*pi/6) <= theta && theta < (9*pi/6)
    value = (6*g_E/pi)*theta - 8*g_E;
    return;
end

if (9*pi/6) <= theta && theta <= (2*pi)
    value = g_E;
    return;
end

end

