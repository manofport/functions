function [cleanimg] = applyClearMatrix(img,clearmatrix,windowwidth)

width = size(img,2);
height = size(img,1);
colordepth = size(img,3);


[cleari,clearj] = find(clearmatrix >0);
%test;

a = clearmatrix;
a1 = a;


for i = 1:windowwidth-1
    a1 = a1 + shift(a,i,2);
endfor

a3 = a1;
for i = 1:windowwidth-1
    a3 = a3 + shift(a1,i,1);
endfor

newclear = a3 >= 1;


zeromatrix = repmat((newclear == 0),[1,1,3]);
cleanimg = zeromatrix.*img;

end