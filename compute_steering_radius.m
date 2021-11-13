function steering_radius = compute_steering_radius(lengths, angles)
    steering_radius = (lengths(6) * tan((pi/2) - angles(1))) + (lengths(3)/2);
end