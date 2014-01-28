function [outimg] = trimColorImg(img, p_pct_imgtrim)
%assumes a square image.

    [m, n, z] = size(img);

    imagewidth = m;

    p_imgtrim = uint8(imagewidth*p_pct_imgtrim/2);

    imgleft = p_imgtrim+1;
    imgright = imagewidth-p_imgtrim;
    imgtop = p_imgtrim+1;
    imgbottom = imagewidth-p_imgtrim;

    outimg = img(imgtop:imgbottom,imgleft:imgright,:);

end