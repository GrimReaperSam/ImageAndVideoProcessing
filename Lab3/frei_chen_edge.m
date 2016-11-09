function grad = frei_chen_edge(image, threshold)
    
    f0 = 1 / (2*sqrt(2)) * [1  sqrt(2) 1; 0 0 0; -1 -sqrt(2) -1];
    f1 = f0';
    f2 = 1 / (2*sqrt(2)) * [0 -1 sqrt(2); 1 0 -1; -sqrt(2) 1 0];
    f3 = flipud(f2');
    f4 = 1 / 2 * [0 1 0; -1 0 -1; 0 1 0];
    f5 = imrotate(f4, -45, 'crop');
    f6 = 1 / 6 * [1 -2 1; -2 4 -2; 1 -2 1];
    f7 = imrotate(f6, -45, 'crop');
    f8 = 1 / 3 * ones(3, 3);
    
    ff = cat(3, f0, f1, f2, f3, f4, f5, f6, f7, f8);
    
    [M, N] = size(image);
    image = double(image);
    yy = zeros(M, N, 3);
    for i=1:8
        yy(:, :, i) = conv2(image, ff(:, :, i), 'same');
    end
    
    yy2 = yy.^2;
    m = yy2(:, :, 1) + yy2(:, :, 2);
    s = sum(yy2, 3);
    
    angle = sqrt(m ./ s);
    grad = angle > threshold;
end

