function [newimg] = focusOnCenterFromCenter(img,stepit)

width = size(img,2);
height = size(img,1);
colordepth = size(img,3);

centerwidth = floor(width/2);
centerheight = floor(height/2);
maxdistance = ((width/2)^2+(height/2)^2)^.5;

newimg = zeros(width,height,colordepth);
newimg = img;

window_r = 0;
window_g = 0;
window_b = 0;

p_blackthreshold = 0;



for i = 1:stepit:centerwidth
       % fprintf("here");

        windowright = centerwidth + i;
        windowleft = centerwidth - i;
        windowtop = centerheight - i;
        windowbottom = centerheight + i;
        windowwidth=i*2+1;


        top= sum(sum(sum((img(windowtop,windowleft:windowright,:) >p_blackthreshold),3)))/((windowwidth)*3);
        bottom= sum(sum(sum((img(windowbottom,windowleft:windowright,:) >p_blackthreshold),3)))/((windowwidth)*3);
        left= sum(sum(sum((img(windowtop:windowbottom,windowleft,:) >p_blackthreshold),3)))/((windowwidth)*3);
        right= sum(sum(sum((img(windowtop:windowbottom,windowright,:) >p_blackthreshold),3)))/((windowwidth)*3);




        if top > .2 || bottom > .2 || left > .2 || right > .2
        %    fprintf("nothing");
        else
         %   fprintf("bob");

          %  top
          %  bottom
          %  left
          %  right

            tempimg = focusOnCenterWeighted(img(windowtop:windowbottom-1,windowleft:windowright-1,:),.7,2,2);
            %imshow(tempimg);
            %pause(10);

            newimg(1:windowtop-1,:,:) = 0;
            newimg(:,1:windowleft-1,:) = 0;
            newimg(windowbottom+1:height,:) = 0;
            newimg(:,windowright+1:width,:) = 0;


            %size(tempimg)
            newimg(windowtop:windowbottom-1,windowleft:windowright-1,:) = tempimg(:,:,:);
            %imshow(newimg);
            %pause(10);


            return;
        endif

endfor



    
end