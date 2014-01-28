function [cleanimg,boundarywidth] = findCenter(img,p_blackthreshold, p_densitythreshold)

width = size(img,2);
height = size(img,1);
colordepth = size(img,3);
centerwidth = floor(width/2);
centerheight = floor(height/2);
boundarywidth=0;

cleanimg= zeros(height,width,colordepth);

for windowwidth = 1:width-1
    density = perimeterDensity(img,p_blackthreshold,windowwidth+1);
    if density < p_densitythreshold
        top = max(centerheight - floor(windowwidth/2),1);
        bottom = min(centerheight + floor((windowwidth-1)/2),height);
        left = max(centerwidth - floor(windowwidth/2),1);
        right = min(centerwidth + floor((windowwidth-1)/2),width);

        cleanimg = img;
        cleanimg(1:top-1,1:width,:) = 0;
        cleanimg(bottom+1:height,1:width,:) = 0;
        cleanimg(1:bottom,1:left-1,:) = 0;
        cleanimg(1:bottom,right+1:width,:) = 0;
        boundarywidth = windowwidth;
        return
    endif
endfor










end