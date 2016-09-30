function [ results ] = weber( l1, l2,lb )
%Weber experiment
%   weber function outputs an 600x600 image with 2 squares. Background
%   luminance = lb, and luminances of each square: l1, l2
    results = ones(600,600)*lb;
    offset = (600-160)/2;
    results(offset:offset+161,offset+1:offset+80)=l1;
    results(offset:offset+161,offset+81:offset+160)=l2;
end

