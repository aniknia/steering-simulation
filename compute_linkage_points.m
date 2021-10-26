function points = compute_linkage_points(theta, phi, lengths)
% Outputs (points) as an array of [x, x], [y, y] for each linkage
% FIX: I want a 2d array not a 1d
        % Changing values back for clarity
        a = lengths(1);
        b = lengths(2);
        cx = lengths(3);
        cy = lengths(4);
        h = lengths(5);

        driver_x = a*cos(theta) - (cx/2);
        driver_y = a*sin(theta);
        passenger_x = a*cos(phi(2)) + (cx/2);
        passenger_y = a*sin(phi(2));
        points = [[[-cx/2, cx/2], [0, 0]], ...
            [[-cx/2, driver_x], [0, -driver_y]], ...
            [[cx/2, passenger_x], [0, -passenger_y]], ...
            [[driver_x, passenger_x], [-driver_y, -passenger_y]]];
end