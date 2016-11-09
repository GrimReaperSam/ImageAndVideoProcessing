function [ results ] = compass_operator(img,ind)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    k0 = [ -3 -3 5;
            -3 0 5;
            -3 -3 5];
        
    image = double(img);
    kangle = imrotate(k0,45*ind,'crop');
    
    results = conv2(image,kangle,'same');
    
end

