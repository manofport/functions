function [newimg] = focusOnCenter(img,threshold_density,window)

width = size(img,2);
height = size(img,1);
colordepth = size(img,3);
windowsize = window*window;

newimg = img;
window_r = 0;
window_g = 0;
window_b = 0;

blackthreshold = 10;





for i = 1:window:height
    for j = 1:window:width
        %fprintf("i:%d, j:%d\n",i,j);
        tracker = zeros(window,window);
        %if colordepth == 3
            tracker_r = (newimg(i:min(i+window,height),j:min(j+window,width),1) > blackthreshold);
            tracker_g = (newimg(i:min(i+window,height),j:min(j+window,width),2) > blackthreshold);
            tracker_b = (newimg(i:min(i+window,height),j:min(j+window,width),3) > blackthreshold);



            tracker = tracker_r+tracker_g+tracker_b;

            tracker = tracker > 0;

        %else
        %    tracker = newimg(i:window,j:window) > blackthreshold;
        %endif

        windowdensity = sum(sum(tracker))/windowsize;


        if windowdensity < threshold_density
         %   if colordepth == 3
                newimg(i:i+window,j:j+window,:) = 0;
         %   else
         %       newimg(i:window,j:window) = 0;
         %   endif
        endif
    endfor
endfor




    
end