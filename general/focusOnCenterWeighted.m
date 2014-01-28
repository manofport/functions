function [newimg] = focusOnCenterWeighted(img,p_threshold_density,window,slide)

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

p_blackthreshold = 50;
p_brightnessthreshold = 300;


sizearray = [0 0 0];


for i = 1:slide:height
    for j = 1:slide:width
        %fprintf("i:%d, j:%d\n",i,j);
        tracker = zeros(window,window);
        distancefromcenter = (((centerheight-i))^2+((centerwidth-j))^2)^.5;

        invdistancefactor =(distancefromcenter/maxdistance)^2;
        distancefactor= (1-distancefromcenter/maxdistance);

        threshold_density = p_threshold_density;% * distancefactor;
        blackthreshold = p_blackthreshold * distancefactor;
        brightnessthreshold = p_brightnessthreshold * invdistancefactor;

 %       threshold_density = p_threshold_density;

        if colordepth == 3
            %fprintf("%f\n",brightnessthreshold);
            tracker_r = (newimg(i:min(i+window-1,height),j:min(j+window-1,width),1) > brightnessthreshold);
            tracker_g = (newimg(i:min(i+window-1,height),j:min(j+window-1,width),2) > brightnessthreshold);
            tracker_b = (newimg(i:min(i+window-1,height),j:min(j+window-1,width),3) > brightnessthreshold);



            tracker = tracker_r+tracker_g+tracker_b;

            tracker = tracker > 0;

        else
            tracker = newimg(i:window,j:window) > brightnessthreshold;
        endif

        windowdensity = sum(sum(tracker))/windowsize;

        %fprintf("thresh %f, window %f\n",threshold_density,windowdensity);

        if windowdensity < threshold_density
         %   if colordepth == 3
                %sizearray = [sizearray; size(newimg(i:min(i+window-1,height),j:min(j+window-1,width),:))];
                try
                    newimg(i:min(i+window-1,height),j:min(j+window-1,width),:) = 0;
                catch
                    i
                    window
                    height
                    width
                end
         %   else
         %       newimg(i:window,j:window) = 0;
         %   endif
        endif
    endfor
endfor




    
end