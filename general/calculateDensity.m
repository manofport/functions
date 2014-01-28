function [density] = calculateDensity(img,p_blackthreshold,windowwidth)

width = size(img,2);
height = size(img,1);
colordepth = size(img,3);


%countabovethreshold = sum(sum(sum(img>p_blackthreshold)));
%density = countabovethreshold/(width*height*colordepth);


matrixofpixelsaboveblack = sum(img>p_blackthreshold,3) > 0;
%density = matrixofpixelsaboveblack;return;
a = matrixofpixelsaboveblack;
a1 = a;

for i = 1:windowwidth-1
    a1 = a1 + shift(a,-i,2);
endfor

a3 = a1;
for i = 1:windowwidth-1
    a3 = a3 + shift(a1,-i,1);
endfor

density = a3/(windowwidth^2);


end