function quantized = quantize(image, N)
    image = double(image);
    min_v = min(min(image));
    max_v = max(max(image));
    levels = linspace(min_v, max_v, N);
    quantized = zeros(size(image)); 
    for i = 1:N
        quantized = quantized + (image > levels(i));
    end
end