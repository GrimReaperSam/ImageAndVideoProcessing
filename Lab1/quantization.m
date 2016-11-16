function [ image_quantized ] = quantization( image, quanti_step )
%Quantization of the image
%   Quantization function outputs the image quantizied with quanti_step
%   bits
    image_quantized =  floor(image./quanti_step) .* quanti_step+ quanti_step/2;

end

