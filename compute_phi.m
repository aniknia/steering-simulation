function phi = compute_phi(theta, lengths)
% Outputs (phi) angle of the right wheel based on (theta) angle of the left
% wheel as well as given constants (lengths = [a, b, cx, cy, h])
% REDERIVE: the commented phi was an incorrect derivation
% redo the work and find out what went wrong
% phi = [asin(C/sqrt(B^2 + A^2)) - atan(A/B), asin(C/sqrt(B^2 + A^2)) + atan(A/B)];

        % Changing values back for clarity
        a = lengths(1);
        b = lengths(2);
        cx = lengths(3);
        cy = lengths(4);
        h = lengths(5);
        
        A = ( ( 2 * a * b * cos(theta)) - (2 * b * cx ));
        B = ( ( 2 * a * b * sin(theta)) - (2 * b * cy));
        C = ( a^2 + b^2 + cx^2 + cy^2 - h^2 - ( 2 * a * cx * cos(theta)) - ( 2 * a * cy * sin(theta)));
        phi = [atan(B/A) + acos(C / sqrt(A^2 + B^2)) + pi, atan(B/A) - acos(C / sqrt(A^2 + B^2)) + pi];
end
