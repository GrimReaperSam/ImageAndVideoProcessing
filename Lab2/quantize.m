function quantized = quantize(image, N)
    image = double(image);
    min_v = min(min(image));
    max_v = max(max(image));
    levels = linspace(min_v, max_v, N);
    quantized = imquantize(image, levels);
end

