function dithered = fixed_threshold(image)
    min_v = min(image(:));
    max_v = max(image(:));
    threshold = (min_v + max_v) / 2;
    dithered = zeros(size(image));
    dithered(image > threshold) = 1;
end

