function plot_four_bar_linkage(linkage_points, varargin)
% Outputs nothing. Draws linkages from points
        if nargin == 2
            app = varargin{1};
            hold(app, 'on');
            plot(app, [linkage_points(1), linkage_points(2)], [linkage_points(3), linkage_points(4)], 'r');
            plot(app, [linkage_points(5), linkage_points(6)], [linkage_points(7), linkage_points(8)], 'g');
            plot(app, [linkage_points(9), linkage_points(10)], [linkage_points(11), linkage_points(12)], 'g');
            plot(app, [linkage_points(13), linkage_points(14)], [linkage_points(15), linkage_points(16)], 'b');
            hold(app, 'off');
            drawnow;
        else
            hold on;
            plot([linkage_points(1), linkage_points(2)], [linkage_points(3), linkage_points(4)], 'r');
            plot([linkage_points(5), linkage_points(6)], [linkage_points(7), linkage_points(8)], 'g');
            plot([linkage_points(9), linkage_points(10)], [linkage_points(11), linkage_points(12)], 'g');
            plot([linkage_points(13), linkage_points(14)], [linkage_points(15), linkage_points(16)], 'b');
            hold off;
            drawnow;
        end