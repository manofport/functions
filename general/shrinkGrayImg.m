function [outimg] = shrinkGrayImg(img, step) %now means skip every nth column and row

    [m, n] = size(img);

    %outimg = img(1:step:m,1:step:n);

    rowarray = [];
    colarray = [];
    for i = 1:m
        if rem(i,step) > 0
            rowarray = [rowarray i];
        endif
    endfor


    for i = 1:n
        if rem(i,step) > 0
            colarray = [colarray i];
        endif
    endfor

    rowarray
    colarray

    outimg = img(:,colarray);

    outimg

    outimg = outimg(rowarray,:);
    outimg

end