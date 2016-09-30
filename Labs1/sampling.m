function [ result ] = sampling( image, factor )
%Sample the image
    result = image(1:factor:end, 1:factor:end,:);
end

