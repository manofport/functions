function [newimg] = focusOnCenterRemove(img,window,slide)

width = size(img,2);
height = size(img,1);
colordepth = size(img,3);
windowsize = window*window;
centerwidth = width/2;
centerheight = height/2;
maxdistance = ((width/2)^2+(height/2)^2)^.5;

newimg = img;
window_r = 0;
window_g = 0;
window_b = 0;

p_blackthreshold = 10;
p_brightnessthreshold = 800;

perimeter_threshold = 30;



for i = 1:slide:height
    for j = 1:slide:width
        windowright = min(j+window-1,width);
        windowleft = j;
        windowtop = i;
        windowbottom = min(i+window-1,height);
        top= sum(sum(sum((newimg(windowtop,windowleft:windowright,:) >p_blackthreshold),3)));
        bottom= sum(sum(sum((newimg(windowbottom,windowleft:windowright,:) >p_blackthreshold),3)));
        left= sum(sum(sum((newimg(windowtop:windowbottom,windowleft,:) >p_blackthreshold),3)));
        right= sum(sum(sum((newimg(windowtop:windowbottom,windowright,:) >p_blackthreshold),3)));




        perimeter = top+bottom+left+right;

        if perimeter > 0
%            fprintf("nonzero");
 %                   fprintf("TBLR: %f, %f, %f, %f, %f\n",top,bottom,left,right,perimeter_threshold);

  %                         fprintf("Pos: %f, %f\n",i,j);

        endif



        if top <= perimeter_threshold && bottom <= perimeter_threshold && left <= perimeter_threshold && right <= perimeter_threshold
            newimg(windowtop:windowbottom,windowleft:windowright,:) = 0;
           % fprintf("Remove: %f,%f,%f,%f\n",windowtop,windowbottom,windowleft,windowright);
        endif



    endfor
endfor




    
end