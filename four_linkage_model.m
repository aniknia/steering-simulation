function four_linkage_model(a, b, cx, cy, h, varargin)
    if nargin == 0
        [a, b, cx, cy, h] = deal(1.5, 1.5, 3, 0, 1);
    end
    % set linkage values for testing
    lengths = [a, b, cx, cy, h];

    % find angles of straight travel and max and min
    % theta_initial, phi_initial, theta_max, theta_min
    angle_init_max_arr = angle_init_max(lengths);

    % draw linkages when traveling straight
    %set_plot_const(lengths)
    %plot_four_bar_linkage(compute_linkage_points(angle_init_max_arr(1), angle_init_max_arr(2:3), lengths));

    % possible thetas
    % FEAT: must take into account tire width and length
    n = 100;
    theta_lin = linspace(angle_init_max_arr(5) , angle_init_max_arr(4), n);

    % set arrays for recording driver and passenger sed linkage angles
    [test_array_theta, test_array_phi] = deal(ones(1, n));
    j = 0;

    for i = theta_lin
        % draws linkages
        % set_plot_const(lengths)
        phi = compute_phi(i, lengths);
        if nargin == 6
            app = varargin{1};
            plot_four_bar_linkage(compute_linkage_points(i, phi, lengths), app);
        else
            plot_four_bar_linkage(compute_linkage_points(i, phi, lengths));
        end

        % records driver and passenger side linkage angles
        j = j + 1;
        [test_array_theta(j), test_array_phi(j)] = deal(test_array_theta(j) * i, test_array_phi(j) * phi(2));
    end
end