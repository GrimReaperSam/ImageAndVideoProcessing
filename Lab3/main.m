clc
clear all
close all

% Lab 03 - Fayez LAHOUD, Christophe TRINH - 9 November 2016

%% Exercise 1 - Template method
lena = imread('Images/lena.png');
rice = imread('Images/rice.png');
road = imread('Images/road.png');

demo_template_edge(lena, 'Lena');
demo_template_edge(rice, 'Rice');
demo_template_edge(road, 'Road');
