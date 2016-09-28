function [ corr ] = correlation( A,B )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    corr = conv2(A,flipud(fliplr(B)))

end

