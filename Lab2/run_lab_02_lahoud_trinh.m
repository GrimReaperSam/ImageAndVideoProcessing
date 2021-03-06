clc
clear all
close all

% Lab 02 - Fayez LAHOUD, Christophe TRINH - 12th October 2016

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

display('MSE for lena - fixed')
display(compute_mse(lena, lena_t))
display('MSE for wool - fixed')
display(compute_mse(wool, wool_t))

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

display('MSE for lena - random')
display(compute_mse(lena, lena_t))
display('MSE for wool - random')
display(compute_mse(wool, wool_t))

%% Exercise 3 - Ordered threshold method
thresh_mat = [34 29 17 21 30 35;...
              28 14 9 16 20 31;...
              13 8 4 5 15 19;...
              12 3 0 1 10 18;...
              27 7 2 6 23 24;...
              33 26 11 22 25 32];
            
lena = imread('Images/lena-y.png');
lena_quant = quantize(lena, 37);
lena_t = threshold_fct(lena_quant, thresh_mat);
 
figure('Name','Ordered threshold method - Lena');
subplot(1,2,1)
imshow(lena,[])
title('Lena original')
subplot(1,2,2)
imshow(lena_t,[])
title('Lena threshold')

wool = imread('Images/wool.png');
wool_quant = quantize(wool, 37);
wool_t = threshold_fct(wool_quant, thresh_mat);
 
figure('Name','Ordered threshold method - Wool');
subplot(1,2,1)
imshow(wool,[])
title('Wool original')
subplot(1,2,2)
imshow(wool_t,[])
title('Wool threshold')

display('MSE for lena - ordered')
display(compute_mse(lena, lena_t))
display('MSE for wool - ordered')
display(compute_mse(wool, wool_t))

%% Exercise 4 - Ordered matrix with centered points
thresh_mat_C6 = [34 25 21 17 29 33;
                30 13 9 5 12 24;
                18 6 1 0 8 20;
                22 10 2 3 4 16;
                26 14 7 11 15 28;
                35 31 19 23 27 32];
            
thresh_mat_E6 = [30 22 16 21 33 35;
                    24 11 7 9 26 28;
                    13 5 0 2 14 19;
                    15 3 1 4 12 18;
                    27 8 6 10 25 29;
                    32 30 17 23 31 34];

lena = imread('Images/lena-y.png');
lena_quant = quantize(lena, 37);
lena_t_C6 = threshold_fct(lena_quant, thresh_mat_C6);
lena_t_E6 = threshold_fct(lena_quant, thresh_mat_E6);

wool = imread('Images/wool.png');
wool_quant = quantize(wool, 37);
wool_t_C6 = threshold_fct(wool_quant, thresh_mat_C6);
wool_t_E6 = threshold_fct(wool_quant, thresh_mat_E6);

figure('Name','Ordered threshold method with centered points - Lena');
subplot(1,3,1)
imshow(lena,[])
title('Lena original')
subplot(1,3,2)
imshow(lena_t_C6,[])
title('Lena dithered with C6')
subplot(1,3,3)
imshow(lena_t_E6,[])
title('Lena dithered with E6')

figure('Name','Ordered threshold method with centered points - Wool');
subplot(1,3,1)
imshow(wool,[])
title('Wool original')
subplot(1,3,2)
imshow(wool_t_C6,[])
title('Wool dithered with C6')
subplot(1,3,3)
imshow(wool_t_E6,[])
title('Wool dithered with E6')

display('MSE for lena C6 - ordered centered')
display(compute_mse(lena, lena_t_C6))
display('MSE for lena E6 - ordered centered')
display(compute_mse(lena, lena_t_E6))

display('MSE for wool C6 - ordered centered')
display(compute_mse(wool, wool_t_C6))
display('MSE for wool E6 - ordered centered')
display(compute_mse(wool, wool_t_E6))

%% Exercise 5 Diagonal ordered matrix with balanced centered points
O_8_1 = [13 9 5 12;
           6 1 0 8;
           10 2 3 4;
           14 7 11 15];
O_8_2 = [18 22 26 19;
        25 30 31 23;
        21 29 28 27;
        17 24 20 16];
thresh_mat_O8 = [O_8_1 O_8_2;
        O_8_2 O_8_1];

lena = imread('Images/lena-y.png');
lena_quant = quantize(lena, 33);
lena_t_O8 = threshold_fct(lena_quant, thresh_mat_O8);

wool = imread('Images/wool.png');
wool_quant = quantize(wool, 33);
wool_t_O8 = threshold_fct(wool_quant, thresh_mat_O8);

figure('Name','Diagonal ordered matrix with balanced centered points')
subplot(2,2,1)
imshow(lena,[])
title('Lena original')
subplot(2,2,2)
imshow(lena_t_O8)
title('Lena dithered with O8')

subplot(2,2,3)
imshow(wool,[])
title('Wool original')
subplot(2,2,4)
imshow(wool_t_O8)
title('Wool dithered with O8')

display('MSE for lena O8 - diagonal')
display(compute_mse(lena, lena_t_O8))
display('MSE for wool O8 - diagonal')
display(compute_mse(wool, wool_t_O8))

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

display('MSE for lena - dispersed')
display(compute_mse(lena, lena_t))
display('MSE for wool - dispersed')
display(compute_mse(wool, wool_t))

%% Exercise 7 - Error diffusion method
lena = imread('Images/lena-y.png');
lena_f = floyd_ed(lena);
lena_s = stucki_ed(lena);

figure('name', 'Error diffusion method - Lena')
subplot(1, 2, 1)
imshow(lena_f, [])
title('Lena with floyd error diffusion')
subplot(1, 2, 2)
imshow(lena_s, [])
title('Lena with stucki error diffusion')

wool = imread('Images/wool.png');
wool_f = floyd_ed(wool);
wool_s = stucki_ed(wool);

figure('name', 'Error diffusion method - Wool')
subplot(1, 2, 1)
imshow(wool_f, [])
title('Wool with floyd error diffusion')
subplot(1, 2, 2)
imshow(wool_s, [])
title('Wool with stucki error diffusion')

display('MSE for lena with floyd')
display(compute_mse(lena, lena_f))
display('MSE for lena with stucki')
display(compute_mse(lena, lena_s))
display('MSE for wool with floyd')
display(compute_mse(wool, wool_f))
display('MSE for wool with stucki')
display(compute_mse(wool, wool_s))
