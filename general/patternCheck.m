function [stddev] = patternCheck(img,radius, topn)

[height,width,colordepth] = size(img);





radiusmultiplier = 5;


for searchradiusindex = 1:1:round(width/(2*radiusmultiplier))

    intensitysearch(searchradiusindex,1) = 0;
    searchradius = searchradiusindex * radiusmultiplier;


    for theta = 1:360
        x = round(searchradius*cos(theta));
        y = round(searchradius*sin(theta));
        
        
        xposition = x + round(width/2);
        yposition = y + round(height/2);

        intensitysearch(searchradiusindex,1) = intensitysearch(searchradiusindex,1) + sum(img(yposition,xposition,:));

    endfor
endfor
intensitysearch = intensitysearch/360;




fullsum = sum(intensitysearch);
csum = cumsum(intensitysearch);
boundaryi = 0;
for i = 1:size(csum,1)

    if i > 2
        recent3diff = csum(i) - csum(i-2);
    else
        recent3diff = 1000;
    endif

    if recent3diff < 100
       % fprintf("work");
        if boundaryi == 0
            boundaryi = i;
        endif
    endif

endfor

i = boundaryi;

newimg = img(round(height/2)-i*radiusmultiplier:round(height/2)+i*radiusmultiplier,round(width/2)-i*radiusmultiplier:round(width/2)+i*radiusmultiplier,:);
imshow(newimg);


radius = boundaryi*radiusmultiplier/2;



for theta = 1:360
    x = round(radius*cos(theta));
    y = round(radius*sin(theta));
    
    
    xposition = x + round(width/2);
    yposition = y + round(height/2);
    
    intensity(theta,1) = sum(img(yposition,xposition,:));

endfor

[intsortvalue, intsortindex] = sort(intensity,'descend');
%plot(intensity);

firstset = intsortindex(1:topn,1);
firstset = sort(firstset)

diff = shift(firstset,-1) - firstset
diff = diff(1:topn-1)
%diff = sort(diff(1:topn-1));
%diff = diff(2:size(diff,1)-1)


stddev = std(diff)







end