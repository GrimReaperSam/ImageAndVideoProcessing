function dithered = fixed_threshold(image, threshold)
    dithered = zeros(size(image));
    dithered(image > threshold) = 1;
end

