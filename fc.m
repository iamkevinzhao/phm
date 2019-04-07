function value = fc(theta)

theta = wrapTo2Pi(theta);

global g_E;

if 0 <= theta && theta < (pi/6)
    value = (6*g_E/pi)*theta;
    return;
end

if (pi/6) <= theta && theta < (5*pi/6)
    value = g_E;
    return;
end

if (5*pi/6) <= theta && theta < (7*pi/6)
    value = -(6*g_E/pi)*theta + 6*g_E;
    return;
end

if (7*pi/6) <= theta && theta < (11*pi/6)
    value = -g_E;
    return;
end

if (11*pi/6) <= theta && theta <= 2*pi
    value = (6*g_E/pi)*theta - 12*g_E;
    return;
end
end

