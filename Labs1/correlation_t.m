function [ corr ] = correlation_t( a,b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    %Nomaliztion
    a=double(a)-128;
    b=double(b)-128;
%     corr = fliplr(flipud(conv2(fliplr(flipud(a)),b, 'same')));
    corr =flip(flip(conv2(flip(flip(a,1),2),b,'same'),1),2);
    
end

