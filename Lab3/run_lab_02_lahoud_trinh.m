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

figure(1);
for index =1:8
    img_compassed =compass_operator(lena,index-1);
    subplot(2,4,index)
    imshow(img_compassed)
    title((['angle= ' int2str(45*(index-1))]))
end



%% Exercise 3 - Laplace operator

%% Exercise 4 - Frei-Chen method
