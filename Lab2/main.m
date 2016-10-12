clc
clear all
close all

%% Exercise 1 - Fixed threshold method
lena = imread('Images/lena-y.png');
wool = imread('Images/wool.png');

lena_t = fixed_threshold(lena);
wool_t = fixed_threshold(wool);

figure('name', 'Fixed Threshold');
subplot(2, 2, 1)
imshow(lena)
title('Lena original')
subplot(2, 2, 2)
imshow(lena_t)
title('Lena threshold')

subplot(2, 2, 3)
imshow(wool)
title('Wool original')
subplot(2, 2, 4)
imshow(wool_t)
title('Wool threshold')

%% Exercise 2 - Random threshold method
lena = imread('Images/lena-y.png');
wool = imread('Images/wool.png');

lena_t = random_threshold(lena, 40);
wool_t = random_threshold(wool, 40);

figure('name', 'Random Threshold');
subplot(2, 2, 1)
imshow(lena)
title('Lena original')
subplot(2, 2, 2)
imshow(lena_t)
title('Lena threshold')

subplot(2, 2, 3)
imshow(wool)
title('Wool original')
subplot(2, 2, 4)
imshow(wool_t)
title('Wool threshold')

%% Exercise 3 - Ordered threshold method

lena = imread('Images/lena-y.png');

lena_quant = quantize(lena,37);


thresh_mat = [34 29 17 21 30 35;
                28 14 9 16 20 31;
                13 8 4 5 15 19;
                12 3 0 1 10 18;
                27 7 2 6 23 24;
                33 26 11 22 25 32];
   
 [nx, ny] = size(lena);
 
 img_dith_ord = threshold_fct(lena_quant, thresh_mat);
 
figure('Name','Ordered threshold method');
subplot(1,2,1)
imshow(lena_quant,[])
title('Original image')
subplot(1,2,2)
imshow(img_dith_ord,[])
title('Image dithered with a ordered threshold method')

%% Exercise 4 - Ordered matrix with centered points
lena = imread('Images/lena-y.png');



%% Exercise 6 - Ordered matrix with dispersed dots
D3 = [8 4 5;...
      3 0 1;...
      7 2 6];
D3_4 = 4 * D3;
U3 = ones(3, 3);

D6 = zeros(6 , 6);
D6(1:3, 1:3) = D3_4;
D6(1:3, 4:6) = D3_4 + 2 * U3;
D6(4:6, 1:3) = D3_4 + 3 * U3;
D6(4:6, 4:6) = D3_4 + U3;

lena = imread('Images/lena-y.png');
lena_quant = quantize(lena, 37);
wool = imread('Images/wool.png');
wool_quant = quantize(wool, 37);

lena_t = threshold_fct(lena_quant, D6);
wool_t = threshold_fct(wool_quant, D6);
 
figure('Name', 'Ordered matrix with dispersed dots - Lena');
subplot(1, 2, 1)
imshow(lena_quant,[])
title('Lena original')
subplot(1, 2, 2)
imshow(lena_t,[])
title('Lena threshold')

figure('name', 'Ordered matrix with dispersed dots - Wool');
subplot(1, 2, 1)
imshow(wool_quant,[])
title('Wool original')
subplot(1, 2, 2)
imshow(wool_t,[])
title('Wool threshold')
