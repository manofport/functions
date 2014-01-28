function [sum] = perimeterSum(img, p_blackthreshold, windowwidth)

width = size(img,2);
height = size(img,1);
colordepth = size(img,3);

centerwidth = floor(width/2);
centerheight = floor(height/2);
maxdistance = ((width/2)^2+(height/2)^2)^.5;

newimg = zeros(width,height,colordepth);
newimg = img;

matrixofpixelaboveblack = sum(img>p_blackthreshold,3)>0;
size(matrixofpixelaboveblack)

top = max(centerheight - floor(windowwidth/2),1);
bottom = min(centerheight + floor(windowwidth-1/2),height);
left = max(centerwidth - floor(windowwidth/2),1);
right = min(centerwidth + floor(windowwidth-1/2),width);

sum = sum(sum(matrixofpixelaboveblack(top:bottom,left:right))) - sum(sum(matrixofpixelaboveblack(top+1:bottom-1,left+1:right-1)));


end