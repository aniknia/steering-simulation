% clears previous figures
% clear, clc, close all

% set linkage values for testing
a = 3;
b = a;
cx = 6;
cy = 0;
h = 4;
lengths = [a, b, cx, cy, h];

% set size of figure
x_lim = (cx/2) + a;
y_lim = (cx/2) + a;
set(gca, 'XLim', [-x_lim, x_lim], 'YLim', [-y_lim, y_lim]);

% set angle values for testing
z = 0;

% find angles of straight travel
theta_initial = acos((cx - h) / (2 * a));
phi_initial = compute_phi(theta_initial, lengths);

% find max and min angles
theta_max = acos((a^2 + cx^2 - (b + h)^2) / (2 * a * cx));
theta_min = asin( a / ((b + h) / sin(theta_max)));

% calculated linkage points on driver and passenger sides
driver_x = a*cos(theta_initial + z) - (cx/2);
driver_y = a*sin(theta_initial + z);
passenger_x = a*cos(phi_initial(2) + z) + (cx/2);
passenger_y = a*sin(phi_initial(2) + z);

% calculated of h_linkage from linkage_a and linkage_b (should equal length
% of h)
% FIX: issue with length increasing as linkage moves
d = sqrt((driver_x - passenger_x)^2 + (driver_y - passenger_y)^2);

% draw linkages when traveling straight
hold on;
plot([-cx/2, cx/2], [0, 0], 'r');
plot([-cx/2, driver_x], [0, -driver_y], 'g');
plot([cx/2, passenger_x], [0, -passenger_y], 'g');
plot([driver_x, passenger_x], [-driver_y, -passenger_y], 'b');

% % manually draws h_linkage
% plot([-h/2, h/2], [-sqrt(a^2 - ((cy - h)/2)^2), -sqrt(a^2 - ((cy - h)/2)^2)], 'b');
hold off;

% possible thetas
% FEAT: must take into account tire width and length
n = 100;
theta_lin = linspace(theta_min , theta_max, n);
rho = linspace(1, 5, n);

% set arrays for recording driver and passenger sed linkage angles
test_array_theta = ones(1, n);
test_array_phi = ones(1, n);
test_array_h = ones(1, n);
j = 0;

for i = theta_lin
    % reset figure
    cla reset;
    
    % set size of figure
    set(gca, 'XLim', [-x_lim, x_lim], 'YLim', [-y_lim, y_lim]);
    
    % records driver and passenger side linkage angles
    j = j + 1;
    phi = compute_phi(i, lengths);
    test_array_theta(j) = test_array_theta(j) * i;
    test_array_phi(j) = test_array_phi(j) * phi(2);
    test_array_h(j) = test_array_h(j) * sqrt(((a*cos(i + z) - (cx/2)) - (a*cos(phi(2) + z) + (cx/2)))^2 + ((a*sin(i + z)) - (a*sin(phi(2) + z)))^2);
    
    % draws linkages
    hold on;
    plot([-cx/2, cx/2], [0, 0], 'r');
    plot([-cx/2, a*cos(i + z) - (cx/2)], [0, -a*sin(i + z)], 'g');
    plot([cx/2, a*cos(phi(2) + z) + (cx/2)], [0, -a*sin(phi(2) + z)], 'g');
    plot([a*cos(i + z) - (cx/2), a*cos(phi(2) + z) + (cx/2)], [-a*sin(i + z), -a*sin(phi(2) + z)], 'b');
    disp(i);
    hold off;
    drawnow;
end