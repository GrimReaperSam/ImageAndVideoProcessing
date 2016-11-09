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

figure('name', 'Compass operator');
for index =1:8
    img_compassed =compass_operator(lena,index-1);
    subplot(2,4,index)
    imshow(img_compassed)
    title((['angle= ' int2str(45*(index-1))]))
end



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
