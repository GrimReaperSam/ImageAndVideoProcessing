clc 
close all
clear all


% %% 2 EXERCICES
% 
% %% 2.1 Images and color tables

[trees,trees_color] = imread('Images/trees.tif');
% %% trees is indexed format
lena = imread('Images/lena.tif');
% %% lena is truecolor

% 2.1.1
figure('Name', 'Images and color tables');
subplot(1,2,1); 
imshow(lena)
title('Lena Color Image')

subplot(1,2,2); 
imshow(trees,trees_color)
title('Tree Color Image')
% 
% %% 2.1.2
lena = rgb2gray(lena);
lena_inverted = 255-lena;
trees_color_gray = ind2gray(trees, trees_color);
trees_color_gray_inverted = 255 - trees_color_gray;

figure('Name', 'Grayscale images');
subplot(2,2,1);
imshow(lena);
title('Lena grayscale')

subplot(2,2,2);
imshow(lena_inverted)
title('Lena grayscale inverted')

subplot(2,2,3);
imshow(trees_color_gray)
title('Trees grayscale')

subplot(2,2,4);
imshow(trees_color_gray_inverted)
title('Trees grayscale inverted')
%% 2.1.3

trees_color_modified = rgb_power(trees_color, 2);

figure('Name', 'Trees colors modified');
subplot(1, 2, 1)
subimage(trees,trees_color_modified)
title('Setting gamma to 2')

trees_color_modified = rgb_power(trees_color, 0.5);
subplot(1, 2, 2)
subimage(trees,trees_color_modified)
title('Setting gamme to 0.5')
%%-->  it add contrast in the image, the utility of  the gamma correction is to enhance the contrast of the images


% %%2.1.4
chessboard_indexed = [ 1 2 ; 2 1];
chessboard_indexed = repmat(chessboard_indexed, 4,4);
chess_map = [0,0,1 ; %blue
             1,1,0] ;%yellow

chessboard_rgb = zeros(8,8,3);
% Setting the blue to (0, 0, 1)
chessboard_rgb(1:2:end,1:2:end,3) = 1;
chessboard_rgb(2:2:end,2:2:end,3) = 1;
% Setting the yellow to (1, 1, 0)
chessboard_rgb(1:2:end,2:2:end,1) = 1;
chessboard_rgb(2:2:end,1:2:end,1) = 1;
chessboard_rgb(1:2:end,2:2:end,2) = 1;
chessboard_rgb(2:2:end,1:2:end,2) = 1;

figure('Name', 'Chessboard generation');
subplot(1, 2, 1)
subimage(chessboard_indexed, chess_map)
axis off
title('Using indexed format')
imwrite(chessboard_indexed,chess_map, 'Images/chessboard_indexed.tif')

subplot(1, 2, 2)
imshow(chessboard_rgb)
title('Using true color')
imwrite(chessboard_rgb, 'Images/chessboard_true_color.tif')

%% 2.2 Image quantization
lena2=imread('Images/lena-y.png');

figure('Name', 'Image quantization');
for i=1:7
    lena_quant = quantization(lena2, 2^i);
    subplot(3,4,i)
    imshow(lena_quant)
    title(strcat(['quantstep= ' int2str(2^i)]))
end
% false contour appears with quant_step = 16

%% 2.3 Filtering
filter1D = [0.0357;0.2411;0.4464;0.2411;0.0357] ;
filter2D = filter1D * filter1D.';
gold = imread('Images/gold-text.png');
gold_filtered = imfilter(gold, filter2D);

figure('Name', 'Low pass filter');
subplot(1, 3, 1)
freqz2(filter2D)
title('Frequency response')
subplot(1, 3, 2);
imshow(gold)
title('Original image')
subplot(1, 3, 3);
imshow(gold_filtered)
title('Filtered image')

filterv1 = 1/6 * [ -1 -4 -1;
                   -4 26 -4;
                   -1 -4 -1];
gold_filtered = imfilter(gold, filterv1);

figure('Name', 'High pass filter')
subplot(1, 3, 1)
freqz2(filterv1)
title('Frequency response')
subplot(1, 3, 2);
imshow(gold)
title('Original image')
subplot(1, 3, 3);
imshow(gold_filtered)
title('Filtered image')


% %% Correlation
% gold_text = imread('Images/gold-text.png');
% g_letter = imread('Images/g-letter.png');
% %with im2double there is a offset
% 
%     %CORRELATION COMPUTE IN THE SPATIAL DOMAIN
%     
% corr1=correlation_t(gold_text, g_letter);
% 
% figure(21)
% 
% surf(corr1);shading flat
% 
% [xval yval] = find(corr1==max(max(corr1)));
% 
% figure(19)
% subplot(1,2,1)
% imshow(gold_text)
% subplot(1,2,2)
% imshow(g_letter)
% 
% figure(20)
% imshow(gold_text)
% hold on
% plot(yval,xval,'go','MarkerSize',30)
% 
% 
%     %CORRELATION COMPUTE IN THE FREQUENCY DOMAIN
% corr2=correlation_f(gold_text,g_letter);
% figure(22)
% 
% surf(corr2);shading flat
% 
% [xval yval] = find(corr2==max(max(corr2)));
% figure(24)
% imshow(gold_text)
% hold on
% plot(yval,xval,'go','MarkerSize',30)
% 
% 
% gold_text = imread('Images/gold-text.png');
% g_letter = imread('Images/g-letter.png');
% gold_text_noisy = imnoise(gold_text, 'gaussian',0,5);
% corr_noisy_5 = correlation_f(gold_text_noisy,g_letter);
% [xval yval] = find(corr_noisy_5==max(max(corr_noisy_5)));
% figure(25)
% imshow(gold_text_noisy)
% hold on
% plot(yval,xval,'go','MarkerSize',30)


gold_text = imread('Images/gold-text.png');
g_letter = imread('Images/g-letter.png');
gold_text_noisy = imnoise(gold_text, 'gaussian',0,10);
corr_noisy_5 = correlation_f(gold_text_noisy,g_letter);
[xval, yval] = find(corr_noisy_5==max(max(corr_noisy_5)));
figure(26)
imshow(gold_text_noisy)
hold on
plot(yval,xval,'go','MarkerSize',30)

%% Resampling 
sub = imread('Images/sub4.tif');
sub2 = sampling(sub,2);
sub4 = sampling(sub,4);

figure('Name', 'Resampling')
subplot(1,3,1)
imshow(sub)
title('Original size')

subplot(1,3,2)
imshow(sub2)
title('Subsampled by a factor of 2')

subplot(1,3,3)
imshow(sub4)
title('Subsampled by a factor of 4')


%% Phase and magnitude of 2DFT
lena_y = im2double(imread('Images/lena-y.png'));

lena_y_fft=(fft2(lena_y));

real_lena_invert = ifft2(real(lena_y_fft));
imag_lena_invert = real(ifft2(i * imag(lena_y_fft)));

figure('Name', 'Real and Imaginary parts of FFT')
subplot(1,2,1)
imshow(real(real_lena_invert), [])
title('Real part')
subplot(1,2,2)
imshow(real(imag_lena_invert), [])
title('Imaginary part')

magnitude_lena = ifft2(abs(lena_y_fft));
phase_lena = ifft2(lena_y_fft ./ abs(lena_y_fft));

figure('Name', 'Magnitude and phase of FFT')
subplot(1,2,1)
imshow(real(magnitude_lena))
title('Magnitude')
subplot(1,2,2)
imshow(real(phase_lena), [])
title('Phase')


%% Weber law

% L1 = 60;
% L2 = 61;
% LB = 10;
% a=weber(L1,L2,LB);
% figure(18)
% imshow(a)

