function phi = compute_phi(theta, lengths)
% Outputs (phi) angle of the right wheel based on (theta) angle of the left
% wheel as well as given constants (lengths = [a, b, cx, cy, h])
% REDERIVE: the commented phi was an incorrect derivation
% redo the work and find out what went wrong
% phi = [asin(C/sqrt(B^2 + A^2)) - atan(A/B), asin(C/sqrt(B^2 + A^2)) + atan(A/B)];
        B = ( 2 * lengths(2) * lengths(4) ) - ( 2 * lengths(1) * lengths(2) * sin(theta));
        A = ( 2 * lengths(2) * lengths(3) ) - ( 2 * lengths(1) * lengths(2) * cos(theta));
        C = -( lengths(1)^2 + lengths(2)^2 + lengths(3)^2 + lengths(4)^2 - lengths(5)^2 - ( 2 * lengths(1) * lengths(3) * cos(theta)) - ( 2 * lengths(1) * lengths(4) * sin(theta)));
        phi = [atan(B/A) + acos(C / sqrt(A^2 + B^2)), atan(B/A) - acos(C / sqrt(A^2 + B^2))];
end
