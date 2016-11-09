function demo_template_edge(image, image_name)
    
    image_sobel_l2   = template_edge(image, 'Sobel', 13, 'L2');
    image_sobel_l1   = template_edge(image, 'Sobel', 13, 'L1');
    image_prewitt_l2 = template_edge(image, 'Prewitt', 13, 'L2');
    image_prewitt_l1 = template_edge(image, 'Prewitt', 13, 'L1');
    image_roberts_l2 = template_edge(image, 'Roberts', 13, 'L2');
    image_roberts_l1 = template_edge(image, 'Roberts', 13, 'L1');

    figure('name', strcat('Template method - ', image_name, ' - Sobel'));
    subplot(1, 2, 1)
    imshow(image_sobel_l2, [])
    title('Sobel L2')
    subplot(1, 2, 2)
    imshow(image_sobel_l1, [])
    title('Sobel L1')

    figure('name', strcat('Template method - ', image_name, ' - Prewitt'));
    subplot(1, 2, 1)
    imshow(image_prewitt_l2, [])
    title('Prewitt L2')
    subplot(1, 2, 2)
    imshow(image_prewitt_l1, [])
    title('Prewitt L1')

    figure('name', strcat('Template method - ', image_name, ' - Roberts'));
    subplot(1, 2, 1)
    imshow(image_roberts_l2, [])
    title('Roberts L2')
    subplot(1, 2, 2)
    imshow(image_roberts_l1, [])
    title('Roberts L1')

end

