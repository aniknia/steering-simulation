% clears previous figures
% clear, clc, close all

% set linkage values for testing
a = 3;
b = a;
cx = 0;
cy = 6;
h = 4;

% set size of figure
x_lim = (cy/2) + a + 1;
y_lim = (cy/2) + a + 1;
set(gca, 'XLim', [-x_lim, x_lim], 'YLim', [-y_lim, y_lim]);

% set angle values for testing
z = 0;

% find angles of straight travel
theta_initial = (pi/2) - acos((cy - h) / (2 * a));
phi_initial = compute_phi(theta_initial, a, b, cx, cy, h);

% calculated linkage points on driver and passenger sides
driver_x = a*cos(theta_initial - (pi/2) + z) - (cy/2);
driver_y = a*sin(theta_initial - (pi/2) + z);
passenger_x = a*cos(phi_initial - (pi/2) + z) + (cy/2);
passenger_y = a*sin(phi_initial - (pi/2) + z);

% calculated of h_linkage from linkage_a and linkage_b (should equal length
% of h)
% FIX: issue with length increasing as linkage moves
d = sqrt((driver_x - passenger_x)^2 + (driver_y - passenger_y)^2);

% draw linkages when traveling straight
hold on;
plot([-cy/2, cy/2], [0, 0], 'r');
plot([-cy/2, driver_x], [0, driver_y], 'g');
plot([cy/2, passenger_x], [0, passenger_y], 'g');
plot([driver_x, passenger_x], [driver_y, passenger_y], 'b');

% % manually draws h_linkage
% plot([-h/2, h/2], [-sqrt(a^2 - ((cy - h)/2)^2), -sqrt(a^2 - ((cy - h)/2)^2)], 'b');
hold off;

% possible thetas
% FEAT: must take into account tire width and length
theta_lin = linspace(-pi/4 , pi/4, 100);

% set arrays for recording driver and passenger sed linkage angles
test_array_theta = ones(1, 100);
test_array_phi = ones(1, 100);
j = 0;

for i = theta_lin
    % reset figure
    cla reset;
    
    % set size of figure
    set(gca, 'XLim', [-x_lim, x_lim], 'YLim', [-y_lim, y_lim]);
    
    % records driver and passenger side linkage angles
    j = j + 1;
    phi = compute_phi(i, a, b, cx, cy, h);
    test_array_theta(j) = test_array_theta(j) * rad2deg(i);
    test_array_phi(j) = test_array_phi(j) * rad2deg(phi);
    
    % draws linkages
    hold on;
    plot([-cy/2, cy/2], [0, 0], 'r');
    plot([-cy/2, a*cos(i - (pi/2) + z) - (cy/2)], [0, a*sin(i - (pi/2) + z)], 'g');
    plot([cy/2, a*cos(phi - (pi/2) + z) + (cy/2)], [0, a*sin(phi - (pi/2) + z)], 'g');
    plot([a*cos(i - (pi/2) + z) - (cy/2), a*cos(phi - (pi/2) + z) + (cy/2)], [a*sin(i - (pi/2) + z), a*sin(phi - (pi/2) + z)], 'b');
    hold off;
    drawnow;
end