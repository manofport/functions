function [feature] = convertToSparse(sample)

    [i,j,v] = find(sample(:)); %we want X as a vector
    feature = "";

clock
    for k = 1:size(i,1)
        feature = sprintf("%s %d:%d ",feature,i(k),v(k));
    endfor
clock
    
end