function [outimg] = shrinkColorImg(img, step,rowarray,colarray)

    [m, n, z] = size(img);

    outimg = img(1:step:m,1:step:n,:);







    %outimg = img(:,colarray,:);



    %outimg = outimg(rowarray,:,:);

 





end