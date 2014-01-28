function [cleanimg,boundarywidth] = cleanUsingDensity(img,p_densitythreshold,windowwidth)

width = size(img,2);
height = size(img,1);
colordepth = size(img,3);

p_blackthreshold = 20;
p_centerdensitythreshold =.2;
p_windowsize = windowwidth;

density = calculateDensity(img,p_blackthreshold,p_windowsize);
clearmatrix = density < p_densitythreshold;


fflush(stdout);

cleanimg = applyClearMatrix(img,clearmatrix,p_windowsize);
%boundarywidth = 300;
[cleanimg, boundarywidth] = findCenter(cleanimg,p_blackthreshold,p_centerdensitythreshold);






end