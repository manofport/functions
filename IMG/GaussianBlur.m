function [outimg] = GaussianBlur(p_img,p_kernel_radius,p_kernel_weight,p_smooth_iterations)

kernel_weight = p_kernel_weight;
[width,height,depth] = size(p_img);
%step = p_kernel_radius*2 + 1;
step = 2;

kernel = constructGaussian(p_kernel_radius,kernel_weight);

use_kernel_radius = p_kernel_radius;
use_kernel = repmat(kernel,[1,1,3]);

double_p_img = double(p_img);

for iter = 1:p_smooth_iterations


    double_p_img(:,:,1) = conv2(double_p_img(:,:,1),kernel,"same");
    double_p_img(:,:,2) = conv2(double_p_img(:,:,2),kernel,"same");
    double_p_img(:,:,3) = conv2(double_p_img(:,:,3),kernel,"same");

    [tempheight,tempwidth,tempdepth] = size(double_p_img);

    t_p_img = double_p_img(1:2:tempheight,1:2:tempwidth,:);


    double_p_img = t_p_img;

endfor



outimg = uint8(double_p_img);

end