function [ result ] = sampling( image, factor )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    result = image(1:factor:end, 1:factor:end,:);
end

