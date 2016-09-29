function [ results ] = weber( l1, l2,lb )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    results = ones(600,600)*lb;
    offset = (600-160)/2;
    results(offset:offset+161,offset+1:offset+80)=l1;
    results(offset:offset+161,offset+81:offset+160)=l2;
end

