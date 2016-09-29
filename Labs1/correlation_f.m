function [ results ] = correlation_f( a,b )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    a=double(a)-128;
    b=double(b)-128;
    [a_sx a_sy] = size(a);
    [b_sx b_sy] = size(b);
    corr_length_x = a_sx+b_sx-1;
    corr_length_y = a_sy+b_sy-1;
    results = ifft2(fft2(a,corr_length_x,corr_length_y).*conj(fft2(b,corr_length_x,corr_length_y)));
end

