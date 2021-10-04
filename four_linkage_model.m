% Values for testing
a = 3;
b = a;
cx = 0;
cy = 6;
h = 4;
d = sqrt(a^2 - ((cy - h)/2)^2);

% find angle of straight travel
theta_initial = -acos((cy - h) / (2 * a));

% draw suspension when traveling straight
hold on;
plot([-cy/2, cy/2], [0, 0], 'r');
plot([-cy/2, a*cos(theta_initial) - (cy/2)], [0, a*sin(theta_initial)], 'g');
plot([cy/2, a*cos(compute_phi(theta_initial, a, b, cx, cy, h) - pi) + (cy/2)], [0, a*sin(-compute_phi(theta_initial, a, b, cx, cy, h) - pi)], 'g');
plot([-h/2, h/2], [-d, -d], 'b');
set(gca, 'XLim', [(-cy/2) - a - 1, (cy/2) + a + 1], 'YLim', [(-cy/2) - a - 1, (cy/2) + a + 1]);
hold off;

% possible thetas (change this to take into account tire width and length)
theta_lin = linspace(theta_initial, -5*pi/6, 100);

% for i = theta_lin
%     cla reset;
%     hold on;
%     plot([-cy/2, cy/2], [0, 0], 'r');
%     plot([-cy/2, a*cos(i) - (cy/2)], [0, a*sin(i)], 'g');
%     plot([cy/2, a*cos(-compute_phi(i, a, b, cx, cy, h) - pi) + (cy/2)], [0, a*sin(-compute_phi(i, a, b, cx, cy, h) - pi)], 'g');
%     hold off;
%     set(gca, 'XLim', [(-cy/2) - a - 1, (cy/2) + a + 1], 'YLim', [(-cy/2) - a - 1, (cy/2) + a + 1]);
%     drawnow
% end