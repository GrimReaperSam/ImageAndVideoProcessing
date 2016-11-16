function [ results ] = noise_image( image,std )
%Noise an image
%   noise_image returns a noisy image with a noise following a normal
%   distribution with a mean of 0
    image = double(image);
    results=image+std*randn(size(image));
end

