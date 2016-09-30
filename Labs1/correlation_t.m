function [ corr ] = correlation_t( a,b )
%Correlation in the spatial domain
%   Centered the gray scale of the image between [-128 127] and compute the
%   correlation in the spatial domain
    %Nomaliztion
    a=double(a)-128;
    b=double(b)-128;
%     corr = fliplr(flipud(conv2(fliplr(flipud(a)),b, 'same')));
    corr =flip(flip(conv2(flip(flip(a,1),2),b,'same'),1),2);
    
end

