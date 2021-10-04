function phi = compute_phi(theta, a, b, cx, cy, h)
% Outputs (phi) angle of the right wheel based on (theta) angle of the left
% wheel as well as given constants
        f = (2*b*cx) - (2*a*b*cos(theta));
        g = (2*b*cy) - (2*a*b*sin(theta));
        j = -(a^2 + b^2 + cx^2 + cy^2 - h^2 - (2*a*cx*cos(theta)) - (2*a*cy*sin(theta)));
        phi = arcsin(j/sqrt(f^2 + g^2)) - arctan(g/f);
end
