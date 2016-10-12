function MSE = compute_mse(original, dithered)
    [M, N] = size(original);
    error = double(original) - double(dithered);
    MSE = sum(sum(error .* error)) / (M * N);
end

