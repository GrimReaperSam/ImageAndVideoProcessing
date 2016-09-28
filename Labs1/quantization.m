function [ image_quantized ] = quantization( image, quanti_step )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    image_quantized =  floor(image./quanti_step) .* quanti_step+ quanti_step/2;

end

