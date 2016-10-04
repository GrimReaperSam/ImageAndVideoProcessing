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
%%-->  it adds contrast in the image, the utility of  the gamma correction is to enhance the contrast of the image


%%2.1.4
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

% %% 2.2 Image quantization
lena_orig=(imread('Images/lena-y.png'));

figure('Name', 'Image quantization');
subplot(2,4,1)
imshow(lena_orig)
title('Original image')
for index=1:7
    lena_quant = quantization(lena_orig, 2^index);
    subplot(2,4,index+1)
    imshow(lena_quant)
    title((['quantstep= ' int2str(2^index)]))
end
%false contour appears with quant_step = 16

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


%% Correlation
gold_text = imread('Images/gold-text.png');
g_letter = imread('Images/g-letter.png');
%with im2double there is a offset

%CORRELATION COMPUTE IN THE SPATIAL DOMAIN    
corr1=correlation_t(gold_text, g_letter);
[xval yval] = find(corr1==max(max(corr1)));
figure('Name','Correlation in spatial domain')
imshow(gold_text)
hold on
plot(yval,xval,'go','MarkerSize',30)

[shiftx,shifty] = size(g_letter)
%CORRELATION COMPUTE IN THE FREQUENCY DOMAIN
corr2=correlation_f(gold_text,g_letter);
[xval yval] = find(corr2==max(max(corr2))); 
figure('Name', 'Correlation in frequency domain')
imshow(gold_text)
hold on
plot(yval+shifty/2,xval+shiftx/2,'go','MarkerSize',30)

%NOISY IMAGES

gold_text = imread('Images/gold-text.png');
g_letter = imread('Images/g-letter.png');

gold_text_noisy_5 = noise_image(gold_text, 5);
corr_noisy_5 = correlation_t(gold_text_noisy_5,g_letter);
[xval yval] = find(corr_noisy_5==max(max(corr_noisy_5)));
figure('Name','gold_text with a 5-std noise')
imshow(gold_text_noisy_5)
hold on
plot(yval,xval,'go','MarkerSize',30)

gold_text_noisy_10 = noise_image(gold_text, 10);
corr_noisy_10 = correlation_t(gold_text_noisy_10,g_letter);
[xval yval] = find(corr_noisy_10==max(max(corr_noisy_10)));
figure('Name','gold_text with a 10-std noise')
imshow(gold_text_noisy_10)
hold on
plot(yval,xval,'go','MarkerSize',30)

gold_text_noisy_25 = noise_image(gold_text, 25);
corr_noisy_25= correlation_t(gold_text_noisy_25,g_letter);
[xval yval] = find(corr_noisy_25==max(max(corr_noisy_25)));
figure('Name','gold_text with a 25-std noise')
imshow(gold_text_noisy_25)
hold on
plot(yval,xval,'go','MarkerSize',30)

gold_text_noisy_40 = noise_image(gold_text, 40);
corr_noisy_40= correlation_t(gold_text_noisy_40,g_letter);
[xval yval] = find(corr_noisy_40==max(max(corr_noisy_40)));
figure('Name','gold_text with a 40-std noise')
imshow(gold_text_noisy_40)
hold on
plot(yval,xval,'go','MarkerSize',30)

gold_text_noisy_50 = noise_image(gold_text, 50);
corr_noisy_50 = correlation_t(gold_text_noisy_50,g_letter);
[xval yval] = find(corr_noisy_50==max(max(corr_noisy_50)));
figure('Name','gold_text with a 50-std noise')
imshow(gold_text_noisy_50)
hold on
plot(yval,xval,'go','MarkerSize',30)


corr_noisy_5 = correlation_f(gold_text_noisy_5,g_letter);
[xval yval] = find(corr_noisy_5==max(max(corr_noisy_5)));
figure('Name','gold_text with a 5-std noise (frequency)')
imshow(gold_text_noisy_5)
hold on
plot(yval+shifty/2,xval+shiftx/2,'go','MarkerSize',30)


corr_noisy_10 = correlation_f(gold_text_noisy_10,g_letter);
[xval yval] = find(corr_noisy_10==max(max(corr_noisy_10)));
figure('Name','gold_text with a 10-std noise (frequency)')
imshow(gold_text_noisy_10)
hold on
plot(yval+shifty/2,xval+shiftx/2,'go','MarkerSize',30)


corr_noisy_25 = correlation_f(gold_text_noisy_25,g_letter);
[xval yval] = find(corr_noisy_25==max(max(corr_noisy_25)));
figure('Name','gold_text with a 25-std noise (frequency)')
imshow(gold_text_noisy_25)
hold on
plot(yval+shifty/2,xval+shiftx/2,'go','MarkerSize',30)


corr_noisy_40 = correlation_f(gold_text_noisy_40,g_letter);
[xval yval] = find(corr_noisy_40==max(max(corr_noisy_40)));
figure('Name','gold_text with a 5-std noise (frequency)')
imshow(gold_text_noisy_40)
hold on
plot(yval+shifty/2,xval+shiftx/2,'go','MarkerSize',30)


corr_noisy_50 = correlation_f(gold_text_noisy_50,g_letter);
[xval yval] = find(corr_noisy_50==max(max(corr_noisy_50)));
figure('Name','gold_text with a 50-std noise (frequency)')
imshow(gold_text_noisy_50)
hold on
plot(yval+shifty/2,xval+shiftx/2,'go','MarkerSize',30)
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
imag_lena_invert = real(ifft2(j * imag(lena_y_fft)));
%assert(sum(sum(lena_y)) = lena_y_fft(1,1), 'property of FFT verified')
figure('Name', 'Real and Imaginary parts of FFT')
subplot(1,2,1)
imshow(real(real_lena_invert), [])
title('Real part')
subplot(1,2,2)
imshow(imag_lena_invert, [])
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

L1 = 60;
L2 = 61;
LB = 10;
a=uint8(weber(L1,L2,LB));
figure('Name','Weber experiment')
imshow(a)

