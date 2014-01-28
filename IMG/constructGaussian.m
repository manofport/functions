function [kernel] = constructGaussian(p_kernel_radius, p_weight)

    range = p_kernel_radius*2 + 1;
    startvalue = -p_kernel_radius;

    sigma = p_kernel_radius/2;
    mu = p_kernel_radius;
    base_coeff = (1.0)/((2*pi)^.5*p_kernel_radius);
    exp_coeff = (1.0)/(2*p_kernel_radius^2);


    initial_vector = p_weight * [-p_kernel_radius:1:p_kernel_radius].^2;

    h_vector = base_coeff*exp(-initial_vector*exp_coeff);
    v_vector = h_vector';

    initial_matrix = v_vector*h_vector;

    kernel_sum = sum(sum(initial_matrix));

    kernel = initial_matrix/kernel_sum;


end

