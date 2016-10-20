function MSE = compute_mse(original, dithered)
    [M, N] = size(original);
    error = im2double(original) - im2double(dithered);
    MSE = sum(sum(error .* error)) / (M * N);
end

