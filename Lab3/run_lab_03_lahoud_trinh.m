clc
clear all
close all

% Lab 03 - Fayez LAHOUD, Christophe TRINH - 9th November 2016

%% Exercise 1 - Template method
lena = imread('Images/lena.png');
rice = imread('Images/rice.png');
road = imread('Images/road.png');

demo_template_edge(lena, 'Lena');
demo_template_edge(rice, 'Rice');
demo_template_edge(road, 'Road');

%% Exercise 2 - Compass operator
lena = imread('Images/lena.png');
rice = imread('Images/rice.png');
road = imread('Images/road.png');


lena_compassed = compass_operator(lena, 0.7);
rice_compassed = compass_operator(rice, 0.7);
road_compassed = compass_operator(road, 0.7);

figure('name', 'Compass Operator');
subplot(1,3,1)
imshow(lena_compassed, [])
title('Lena')

subplot(1,3,2)
imshow(rice_compassed, [])
title('Rice')

subplot(1,3,3)
imshow(road_compassed, [])
title('Road')



%% Exercise 3 - Laplace operator
lena = imread('Images/lena.png');
rice = imread('Images/rice.png');
road = imread('Images/road.png');

lena_grad = laplacian_edge(lena, 3, 0.2);
rice_grad = laplacian_edge(rice, 3, 0.2);
road_grad = laplacian_edge(road, 3, 0.2);

figure('name', 'Laplace operator')
subplot(1, 3, 1)
imshow(lena_grad)
title('Lena')

subplot(1, 3, 2)
imshow(rice_grad)
title('Rice')

subplot(1, 3, 3)
imshow(road_grad)
title('Road')


%% Exercise 4 - Frei-Chen method
lena = imread('Images/lena.png');
rice = imread('Images/rice.png');
road = imread('Images/road.png');

lena_grad = frei_chen_edge(lena, 0.9);
rice_grad = frei_chen_edge(rice, 0.9);
road_grad = frei_chen_edge(road, 0.9);

figure('name', 'Laplace operator')
subplot(1, 3, 1)
imshow(lena_grad)
title('Lena')

subplot(1, 3, 2)
imshow(rice_grad)
title('Rice')

subplot(1, 3, 3)
imshow(road_grad)
title('Road')


%% Exercice 5 - Evaluation

lena = imread('Images/lena.png');
lena= im2double(lena);
lena_noisy_5 = imnoise(lena,'gaussian',0,(5/255)^2); 
lena_noisy_11 = imnoise(lena,'gaussian',0,(11/255)^2);
lena_noisy_25 = imnoise(lena,'gaussian',0,(25/255)^2);

figure('name', 'lena noisy');
subplot(1,3,1)
imshow(lena_noisy_5,[])
title('std = 5')
subplot(1,3,2)
imshow(lena_noisy_11,[])
title('std = 11')
subplot(1,3,3)
imshow(lena_noisy_5,[])
title('std = 5')

    
lena_noisy_5_sobel_l2   = template_edge(lena_noisy_5, 'Sobel', 0.2, 'L2');
lena_noisy_5_sobel_l1   = template_edge(lena_noisy_5, 'Sobel', 0.2, 'L1');
lena_noisy_11_sobel_l2   = template_edge(lena_noisy_11, 'Sobel', 0.2, 'L2');
lena_noisy_11_sobel_l1   = template_edge(lena_noisy_11, 'Sobel', 0.2, 'L1');
lena_noisy_25_sobel_l2   = template_edge(lena_noisy_11, 'Sobel', 0.2, 'L2');
lena_noisy_25_sobel_l1   = template_edge(lena_noisy_11, 'Sobel', 0.2, 'L1');

figure('name', 'lena noisy, Sobel');
subplot(2, 3, 1)
imshow(lena_noisy_5_sobel_l2,[])
title('std=5 - Sobel L2')
subplot(2, 3, 2)
imshow(lena_noisy_5_sobel_l1,[])
title('std=5 - Sobel L1')

subplot(2, 3, 3)
imshow(lena_noisy_11_sobel_l2,[])
title('std=11 - Sobel L2')
subplot(2, 3, 4)
imshow(lena_noisy_11_sobel_l1,[])
title('std=11 - Sobel L1')

subplot(2, 3, 5)
imshow(lena_noisy_25_sobel_l2,[])
title('std=25 - Sobel L2')
subplot(2, 3, 6)
imshow(lena_noisy_25_sobel_l1,[])
title('std=25 - Sobel L1')


lena_noisy_5_prewitt_l2   = template_edge(lena_noisy_5, 'Prewitt', 0.2, 'L2');
lena_noisy_5_prewitt_l1   = template_edge(lena_noisy_5, 'Prewitt', 0.2, 'L1');
lena_noisy_11_prewitt_l2   = template_edge(lena_noisy_11, 'Prewitt', 0.2, 'L2');
lena_noisy_11_prewitt_l1   = template_edge(lena_noisy_11, 'Prewitt', 0.2, 'L1');
lena_noisy_25_prewitt_l2   = template_edge(lena_noisy_11, 'Prewitt', 0.2, 'L2');
lena_noisy_25_prewitt_l1   = template_edge(lena_noisy_11, 'Prewitt', 0.2, 'L1');

figure('name', 'lena noisy, Prewitt');
subplot(2, 3, 1)
imshow(lena_noisy_5_prewitt_l2,[])
title('std=5 - Prewitt L2')
subplot(2, 3, 2)
imshow(lena_noisy_5_prewitt_l1,[])
title('std=5 - Prewitt L1')

subplot(2, 3, 3)
imshow(lena_noisy_11_prewitt_l2,[])
title('std=11 - Prewitt L2')
subplot(2, 3, 4)
imshow(lena_noisy_11_prewitt_l1,[])
title('std=11 - Prewitt L1')

subplot(2, 3, 5)
imshow(lena_noisy_25_prewitt_l2,[])
title('std=25 - Prewitt L2')
subplot(2, 3, 6)
imshow(lena_noisy_25_prewitt_l1,[])
title('std=25 - Prewitt L1')


lena_noisy_5_roberts_l2   = template_edge(lena_noisy_5, 'Roberts', 0.3, 'L2');
lena_noisy_5_roberts_l1   = template_edge(lena_noisy_5, 'Roberts', 0.3, 'L1');
lena_noisy_11_roberts_l2   = template_edge(lena_noisy_11, 'Roberts', 0.3, 'L2');
lena_noisy_11_roberts_l1   = template_edge(lena_noisy_11, 'Roberts', 0.3, 'L1');
lena_noisy_25_roberts_l2   = template_edge(lena_noisy_11, 'Roberts', 0.3, 'L2');
lena_noisy_25_roberts_l1   = template_edge(lena_noisy_11, 'Roberts', 0.3, 'L1');

figure('name', 'lena noisy, Roberts');
subplot(2, 3, 1)
imshow(lena_noisy_5_roberts_l2,[])
title('std=5 - Roberts L2')
subplot(2, 3, 2)
imshow(lena_noisy_5_roberts_l1,[])
title('std=5 - Roberts L1')

subplot(2, 3, 3)
imshow(lena_noisy_11_roberts_l2,[])
title('std=11 - Roberts L2')
subplot(2, 3, 4)
imshow(lena_noisy_11_roberts_l1,[])
title('std=11 - Roberts L1')

subplot(2, 3, 5)
imshow(lena_noisy_25_roberts_l2,[])
title('std=25 - Roberts L2')
subplot(2, 3, 6)
imshow(lena_noisy_25_roberts_l1,[])
title('std=25 - Roberts L1')


lena_noisy_5_compassed = compass_operator(lena_noisy_5,0.7);
lena_noisy_11_compassed = compass_operator(lena_noisy_11,0.7);
lena_noisy_25_compassed = compass_operator(lena_noisy_25,0.7);

figure('name', 'lena noisy, Compass operator');
subplot(1,3,1)
imshow(lena_noisy_5_compassed,[])
title('Lena noisy std = 5')
subplot(1, 3, 2)
imshow(lena_noisy_11_compassed,[])
title('Lena noisy std = 11')
subplot(1, 3, 3)
imshow(lena_noisy_25_compassed,[])
title('Lena noisy std = 25')


lena = imread('Images/lena.png');
lena_noisy_5 = imnoise(lena,'gaussian',0,(5/255)^2); 
lena_noisy_11 = imnoise(lena,'gaussian',0,(11/255)^2);
lena_noisy_25 = imnoise(lena,'gaussian',0,(25/255)^2);
lena_noisy_5_laplacian = laplacian_edge(lena_noisy_5, 3, 0.3);
lena_noisy_11_laplacian = laplacian_edge(lena_noisy_11, 3, 0.3);
lena_noisy_25_laplacian = laplacian_edge(lena_noisy_25, 3, 0.3);

figure('name', 'lena noisy, Laplace operator');
subplot(1,3,1)
imshow(lena_noisy_5_laplacian)
title('Lena noisy std = 5')
subplot(1, 3, 2)
imshow(lena_noisy_11_laplacian,[])
title('Lena noisy std = 11')
subplot(1, 3, 3)
imshow(lena_noisy_25_laplacian,[])
title('Lena noisy std = 25')

lena = imread('Images/lena.png');
lena_noisy_5 = imnoise(lena,'gaussian',0,(5/255)^2); 
lena_noisy_11 = imnoise(lena,'gaussian',0,(11/255)^2);
lena_noisy_25 = imnoise(lena,'gaussian',0,(25/255)^2);
lena_noisy_5_frei_chen = frei_chen_edge(lena_noisy_5, 0.9);
lena_noisy_11_frei_chen = frei_chen_edge(lena_noisy_11, 0.9);
lena_noisy_25_frei_chen = frei_chen_edge(lena_noisy_25, 0.9);

figure('name', 'lena noisy, Frei Chen operator');
subplot(1,3,1)
imshow(lena_noisy_5_frei_chen,[])
title('Lena noisy std = 5')
subplot(1, 3, 2)
imshow(lena_noisy_11_frei_chen,[])
title('Lena noisy std = 11')
subplot(1, 3, 3)
imshow(lena_noisy_25_frei_chen,[])
title('Lena noisy std = 25')


