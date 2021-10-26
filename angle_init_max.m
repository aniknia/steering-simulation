function angle_init_max_arr = angle_init_max(lengths)
    % find angles of straight travel
    theta_initial = acos((lengths(3) - lengths(5)) / (2 * lengths(1)));
    phi_initial = compute_phi(theta_initial, lengths);

    % find max and min angles
    theta_max = acos((lengths(1)^2 + lengths(3)^2 - (lengths(2) + lengths(5))^2) / (2 * lengths(1) * lengths(3)));
    theta_min = asin( lengths(1) / ((lengths(2) + lengths(5)) / sin(theta_max)));
    
    angle_init_max_arr = [theta_initial, phi_initial, theta_max, theta_min];
end