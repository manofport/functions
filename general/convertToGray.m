function [outimg] = convertToGray(img)



   %[x, map] = rgb2ind (img);
   % y = ind2gray (x, map);
   % outimg = uint8((255 * y) / max(max(y)));

    threshold = 0.04045;
    img = double(img);
    underThreshold = (img <= threshold);
    overThreshold = (img > threshold);

    underimg = (img/12.92).*underThreshold;
    overimg = ((img+.055)/1.055).^2.4;
    overimg = overimg .* overThreshold;

    %gammaprocessed = underimg + overimg;
    gammaprocessed = img;

    outimg = gammaprocessed(:,:,1)*(0.2126) +  gammaprocessed(:,:,2)*(0.7152) +  gammaprocessed(:,:,3)*(0.0722);

    outimg = uint8(outimg);

    
end