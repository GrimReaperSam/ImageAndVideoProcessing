clc
clear all
close all

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


