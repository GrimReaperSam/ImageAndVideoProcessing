function gradient = template_edge(image, template, threshold, magnitude)

    if strcmp(template, 'Sobel')
        g1 = 1/4 * [1 0 -1; 2 0 -2; 1 0 -1];
        g2 = 1/4 * [-1 -2 -1; 0 0 0; 1 2 1];
    elseif strcmp(template, 'Prewitt')
        g1 = 1/3 * [1 0 -1; 1 0 -1; 1 0 -1];
        g2 = 1/3 * [-1 -1 -1; 0 0 0; 1 1 1];
    elseif strcmp(template, 'Roberts')
        g1 = [0 0 -1; 0 1 0; 0 0 0];
        g2 = [-1 0 0; 0 1 0; 0 0 0];
    else
        error('Please specify one of [Sobel, Prewitt, Roberts] for the template.')
    end
    
    image = double(image);
    Dx = conv2(image, g1, 'same');
    Dy = conv2(image, g2, 'same');
    
    if strcmp(magnitude, 'L2')
       gradient = sqrt(Dx.*Dx + Dy.*Dy); 
    elseif strcmp(magnitude, 'L1')
       gradient = abs(Dx) + abs(Dy);
    else
        error('Please specify one of [L2, L1] for template magnitude.')
    end
    gradient = uint8(gradient > threshold);

end

