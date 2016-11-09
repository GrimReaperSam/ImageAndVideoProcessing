function [ results ] = compass_operator(img)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    k0 = [ -3 -3 5;
            -3 0 5;
            -3 -3 5];
        
    image = im2double(img);
    
    for index =1:8
        kangle = imrotate(k0,45*(index-1),'crop');
        if index == 1
            img_compassed =conv2(image,kangle,'same');
        else
            img_compassed = cat(3, conv2(image,kangle,'same'),img_compassed);
        end
    
    results = max(img_compassed,[],3);
    
end

