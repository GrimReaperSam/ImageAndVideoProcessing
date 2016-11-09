function grad = laplacian_edge(image, sigma, threshold)
    
    [M, N] = size(image);
    grad = zeros(M, N);

    g_size = 2 * ceil(3 * sigma) + 1;
    g = fspecial('log', g_size, sigma);
    
    image = double(image);
    icg = conv2(image, g, 'same');
    if isempty(threshold)
        threshold = 0.75 * mean(abs(icg(:)));
    end
    
    rr = 2:M-1; cc=2:N-1;
    % Look for the zero crossings in all 4 directions
    [rows, cols] = find(icg(rr,cc) .* icg(rr,cc+1) < 0 & abs(icg(rr,cc) - icg(rr,cc+1)) > threshold);   %x-direction
    grad(rows + cols*M) = 1;
    [rows, cols] = find(icg(rr,cc) .* icg(rr+1,cc) < 0 & abs(icg(rr,cc) - icg(rr+1,cc)) > threshold);   %y-direction
    grad(rows + cols*M) = 1;
end

