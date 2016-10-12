function dithered = random_threshold(image, noise_level)
    dithered = zeros(size(image));
    noise = double(image) + unidrnd(noise_level, size(image));
    min_v = min(noise(:));
    max_v = max(noise(:));
    threshold = (min_v + max_v) / 2;
    dithered(noise > threshold) = 1;
end