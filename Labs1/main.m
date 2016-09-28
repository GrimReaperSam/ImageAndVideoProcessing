clc 
clear all


% %% 2 EXERCICES
% 
% %% 2.1 Images and color tables

% [trees,trees_color] = imread('Images/trees.tif');
% %% trees is indexed format
% lena = imread('Images/lena.tif');
% %% lena is truecolor

% 2.1.1
% figure(1);
% subplot(1,2,1); 
% imshow(trees,trees_color)
% 
% subplot(1,2,2); 
% imshow(lena)
% 
% figure(5);
% imshow(trees,trees_color)

% 
% 
% %% 2.1.2
% lena = rgb2gray(lena);
% lena_inverted = 255-lena;
% trees_color_gray = colormap('gray');
% trees_color_gray_inverted = colormap(flipud(colormap('gray')));
% 
% figure(2);
% subplot(2,2,1);
% imshow(lena);
% subplot(2,2,2);
% imshow(lena_inverted)
% subplot(2,2,3);
% imshow(trees, trees_color_gray)
% subplot(2,2,4);
% imshow(trees, trees_color_gray_inverted)
% 
% %% with subplot the invert operation is not great 
% figure(3);
% imshow(trees,trees_color_gray)
% figure(4);
% imshow(trees, trees_color_gray_inverted)
% 
% 
%% 2.1.3

% trees_color_modified = rgb_power(trees_color, 2);
% figure(6);
% imshow(trees,trees_color_modified)
% 
% trees_color_modified = rgb_power(trees_color, 0.5);
% figure(7);
% imshow(trees,trees_color_modified)

%%-->  it add contrast in the image, the utility of  the gamma correction is to enhance the contrast of the images


% %%2.1.4
% chessboard_indexed = [ 1 2 ; 2 1];
% chessboard_indexed = repmat(chessboard_indexed, 4,4);
% chess_map = [0,0,1 ; %blue
%              1,1,0] ;%yellow
% figure(8);
% imshow(chessboard_indexed, chess_map, 'InitialMagnification', 'fit')
% truesize
% 
% chessboard_rgb = ind2rgb(chessboard_indexed, chess_map);
% figure(9);
% imshow(chessboard_rgb)
% 
% imwrite(chessboard_indexed,chess_map, 'Images/chessboard.tif')

% chessboard_rgb_v2 = zeros(8,8,3);
% chessboard_rgb_v2(1:2:end,1:2:end,3) = 1; % blue 
% chessboard_rgb_v2(2:2:end,2:2:end,3) = 1; % blue 
% % 
% chessboard_rgb_v2(1:2:end,2:2:end,1) = 1;
% chessboard_rgb_v2(2:2:end,1:2:end,1) = 1;
% chessboard_rgb_v2(1:2:end,2:2:end,2) = 1;
% chessboard_rgb_v2(2:2:end,1:2:end,2) = 1;
% 
% 
% figure(9);
% imshow(chessboard_rgb_v2)

%% 2.2 Image quantization


% lena2=imread('Images/lena-y.png');
% 
% figure(10);
% for i=1:7
% lena_quant = quantization(lena2, 2^i);
% subplot(3,4,i)
% imshow(lena_quant)
% title(strcat(['quantstep= ' int2str(2^i)]))
% end
%% false contour appears with quant_step = 16
%% 


%%% 2.3 Filtering
% filter1D = [0.0357;0.2411;0.4464;0.2411;0.0357] ;
% filter2D = filter1D * filter1D.';
% % 
% % figure(11);
% % freqz2(filter2D)
% 
% gold = imread('Images/gold-text.png');
% % gold_filtered = imfilter(gold, filter2D);
% % 
% % figure(12);
% % subplot(1,2,1);
% % imshow(gold)
% % 
% % 
% % subplot(1,2,2);
% % imshow(gold_filtered)
% 
% filterv1 = 1/6 * [ -1 -4 -1;
%                     -4 26 -4;
%                       -1 -4 -1]
% figure(13)
% freqz2(filterv1)
% gold_filtered = imfilter(gold, filterv1);
% figure(14)
% subplot(1,2,1);
% imshow(gold)
% subplot(1,2,2);
% imshow(gold_filtered)


%% Correlation

%% Resampling 
% sub = imread('Images/sub4.tif');
% sub2 = sampling(sub,2);
% sub4 = sampling(sub,4);
% 
% figure(15)
% subplot(1,3,1)
% imshow(sub)
% subplot(1,3,2)
% imshow(sub2)
% subplot(1,3,3)
% imshow(sub4)

%% Phase and magnitude of 2DFT
lena_y = im2double(imread('Images/lena-y.png'));

lena_y_fft=fft2(lena_y);
real_lena = real(lena_y_fft);
real_lena_invert = ifft2(real_lena);

imag_lena = imag(lena_y_fft);
imag_lena_invert = abs(ifft2(imag_lena));

figure(16)
subplot(1,2,1)
imshow(real_lena_invert)
subplot(1,2,2)
imshow(imag_lena_invert)





