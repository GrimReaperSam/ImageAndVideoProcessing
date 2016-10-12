function dithered = random_threshold(image, threshold, noise_level)
    dithered = zeros(size(image));
    noise = double(image) + unidrnd(noise_level, size(image));
    dithered(noise > threshold) = 1;
end