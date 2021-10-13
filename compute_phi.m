function phi = compute_phi(theta, lengths)
% Outputs (phi) angle of the right wheel based on (theta) angle of the left
% wheel as well as given constants
% lengths = [a, b, cx, cy, h];
        f = ( 2 * lengths(2) * lengths(4) ) - ( 2 * lengths(1) * lengths(2) * sin(theta));
        g = ( 2 * lengths(2) * lengths(3) ) - ( 2 * lengths(1) * lengths(2) * cos(theta));
        j = -( lengths(1)^2 + lengths(2)^2 + lengths(3)^2 + lengths(4)^2 - lengths(5)^2 - ( 2 * lengths(1) * lengths(3) * cos(theta)) - ( 2 * lengths(1) * lengths(4) * sin(theta)));
        phi = asin(j/sqrt(f^2 + g^2)) - atan(g/f);
end
