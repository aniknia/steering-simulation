% clears previous figures
% clear, clc, close all

% set linkage values for testing
[a, b, cx, cy, h] = deal(1.5, 1.5, 3, 0, 1);
lengths = [a, b, cx, cy, h];

% find angles of straight travel
theta_initial = acos((cx - h) / (2 * a));
phi_initial = compute_phi(theta_initial, lengths);

% find max and min angles
theta_max = acos((a^2 + cx^2 - (b + h)^2) / (2 * a * cx));
theta_min = asin( a / ((b + h) / sin(theta_max)));

% draw linkages when traveling straight
set_plot_const(lengths)
plot_four_bar_linkage(compute_linkage_points(theta_initial, phi_initial, lengths));

% possible thetas
% FEAT: must take into account tire width and length
n = 100;
theta_lin = linspace(theta_min , theta_max, n);

% set arrays for recording driver and passenger sed linkage angles
[test_array_theta, test_array_phi] = deal(ones(1, n));
j = 0;

for i = theta_lin
    
    % records driver and passenger side linkage angles
    j = j + 1;
    phi = compute_phi(i, lengths);
    [test_array_theta(j), test_array_phi(j)] = deal(test_array_theta(j) * i, test_array_phi(j) * phi(2));
    
    % draws linkages
    set_plot_const(lengths)
    plot_four_bar_linkage(compute_linkage_points(i, phi, lengths));
end