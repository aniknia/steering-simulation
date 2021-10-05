% clears previous figures
% clear, clc, close all

% values for testing
a = 3;
b = a;
cx = 0;
cy = 6;
h = 4;

% find angle of straight travel
theta_initial = (pi/2) - acos((cy - h) / (2 * a));
phi_initial = compute_phi(theta_initial, a, b, cx, cy, h);

% calculated values
driver_x = 0;
driver_y = 0;
passenger_x = 0;
passenger_y = 0;

z = pi/8;
d = sqrt(((a*cos(theta_initial - (pi/2) + z) - (cy/2))-(a*cos(phi_initial - (pi/2) + z) + (cy/2)))^2 + ((a*sin(theta_initial - (pi/2) + z))-(a*sin(phi_initial - (pi/2) + z)))^2);
disp(d);

% draw suspension when traveling straight
hold on;
plot([-cy/2, cy/2], [0, 0], 'r');
plot([-cy/2, a*cos(theta_initial - (pi/2) + z) - (cy/2)], [0, a*sin(theta_initial - (pi/2) + z)], 'g');
plot([cy/2, a*cos(phi_initial - (pi/2) + z) + (cy/2)], [0, a*sin(phi_initial - (pi/2) + z)], 'g');
plot([a*cos(theta_initial - (pi/2) + z) - (cy/2), a*cos(phi_initial - (pi/2) + z) + (cy/2)], [a*sin(theta_initial - (pi/2) + z), a*sin(phi_initial - (pi/2) + z)], 'b');

% % this drew the h linkage, the line above tends to stretch, fix this later
% plot([-h/2, h/2], [-sqrt(a^2 - ((cy - h)/2)^2), -sqrt(a^2 - ((cy - h)/2)^2)], 'b');

set(gca, 'XLim', [(-cy/2) - a - 1, (cy/2) + a + 1], 'YLim', [(-cy/2) - a - 1, (cy/2) + a + 1]);
hold off;

% possible thetas (change this to take into account tire width and length, fix later)
theta_lin = linspace(-pi/4 , pi/4, 100);
test_array_theta = ones(1, 100);
test_array_phi = ones(1, 100);
j = 0;

for i = theta_lin
    cla reset;
    hold on;
    set(gca, 'XLim', [(-cy/2) - a - 1, (cy/2) + a + 1], 'YLim', [(-cy/2) - a - 1, (cy/2) + a + 1]);
    
    j = j + 1;
    phi = compute_phi(i, a, b, cx, cy, h);
    test_array_theta(j) = test_array_theta(j) * rad2deg(i);
    test_array_phi(j) = test_array_phi(j) * rad2deg(phi);
    
    plot([-cy/2, cy/2], [0, 0], 'r');
    plot([-cy/2, a*cos(i - (pi/2) + z) - (cy/2)], [0, a*sin(i - (pi/2) + z)], 'g');
    plot([cy/2, a*cos(phi - (pi/2) + z) + (cy/2)], [0, a*sin(phi - (pi/2) + z)], 'g');
    plot([a*cos(i - (pi/2) + z) - (cy/2), a*cos(phi - (pi/2) + z) + (cy/2)], [a*sin(i - (pi/2) + z), a*sin(phi - (pi/2) + z)], 'b');
    
    hold off;
    drawnow;
end