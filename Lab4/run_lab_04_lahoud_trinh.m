clc
clear all
close all

% Lab 04 - Fayez LAHOUD, Christophe TRINH - 23th November 2016

%% Loading the data
load data/Bikes.mat
load data/Fountain.mat
load data/Friends.mat

%% Refocusing of LF Images

%---------------- BIKES ----------------
index=1;
figure('Name','Refocusing on Bikes image')
for slope=-10:5:10
    img = refocus(Bikes_4DLF,slope);
    subplot(2,3,index)
    imshow(img,[])
    title(strcat('Slope = ' , num2str(slope)))
    index = index + 1; 
    
end


%---------------- FOUNTAIN ----------------
index=1;
figure('Name','Refocusing on Fountain image')
for slope=-10:5:10
    img = refocus(Fountain_4DLF,slope);
    subplot(2,3,index)
    imshow(img,[])
    title(strcat('Slope = ' , num2str(slope)))
    index = index + 1; 
    
end


%---------------- FRIENDS ----------------
index=1;
figure('Name','Refocusing on Friends image')
for slope=-10:5:10
    img = refocus(Friends_4DLF,slope);
    subplot(2,3,index)
    imshow(img,[])
    title(strcat('Slope = ' , num2str(slope)))
    index = index + 1; 
    
end

%% Depth of Field of LF Images


%---------------- BIKES ----------------
index=1;
slope = 0;
figure('Name',strcat('Refocusing on Bikes with a slope =  ', num2str(slope)))
for aperture=1:4:15
    img = dof_refocus(Bikes_4DLF,slope,aperture);
    subplot(2,2,index)
    imshow(img,[])
    title(strcat('Aperture of the scene = ' , num2str(aperture)))
    index = index + 1; 
end


%---------------- FRIENDS ----------------
index=1;
slope = 0;
figure('Name',strcat('Refocusing on Friends with a slope =  ', num2str(slope)))
for aperture=1:4:15
    img = dof_refocus(Friends_4DLF,slope,aperture);
    subplot(2,2,index)
    imshow(img,[])
    title(strcat('Aperture of the scene = ' , num2str(aperture)))
    index = index + 1; 
end


%---------------- FOUNTAIN ----------------
index=1;
slope = 0;
figure('Name',strcat('Refocusing on Foutain with a slope =  ', num2str(slope)))
for aperture=1:4:15
    img = dof_refocus(Fountain_4DLF,slope,aperture);
    subplot(2,2,index)
    imshow(img,[])
    title(strcat('Aperture of the scene = ' , num2str(aperture)))
    index = index + 1; 
end

%% Depth of Field Measurement


%---------------- FRIENDS ----------------
display('Processing the FRIENDS image')

slope = -4;
blur_vect = [];
for aperture=3:2:13
    img = dof_refocus(Friends_4DLF,slope,aperture);
    YCRCB = rgb2ycbcr(img);
    [blur_ver,blur_hor] = NR_blur(YCRCB(:,:,1));
    new_blur = (blur_ver+blur_hor)/2;
    blur_vect = [blur_vect new_blur];
    display(strcat('Friends - slope = -4, Aperture =',num2str(aperture),' blurindex = ', num2str(new_blur)))
end

figure('Name','Plot on the Friends image')
scatter(3:2:13,blur_vect,'filled'), xlim([1 15])
xlabel('Aperture size')
ylabel('blur index')
xlabel('Aperture size')

%measure of stats for the linear regression
fitlm(3:2:13,blur_vect)



%---------------- BIKES ----------------

display('----------------------------')
display('Processing the Bikes image')

slope = 5;
blur_vect = [];
for aperture=3:2:13
    img = dof_refocus(Bikes_4DLF,slope,aperture);
    YCRCB = rgb2ycbcr(img);
    [blur_ver,blur_hor] = NR_blur(YCRCB(:,:,1));
    new_blur = (blur_ver+blur_hor)/2;
    blur_vect = [blur_vect new_blur];
    display(strcat('Bikes - slope = 5, Aperture =',num2str(aperture),' blurindex = ', num2str(new_blur)))
end

figure('Name','Plot on the Bikes image')
scatter(3:2:13,blur_vect,'filled'), xlim([1 15])
xlabel('Aperture size')
ylabel('blur index')
xlabel('Aperture size')


fitlm(3:2:13,blur_vect)


%---------------- FOUNTAIN ----------------

display('----------------------------')
display('Processing the Fountain image')

slope = 5;
blur_vect = [];
for aperture=3:2:13
    img = dof_refocus(Fountain_4DLF,slope,aperture);
    YCRCB = rgb2ycbcr(img);
    [blur_ver,blur_hor] = NR_blur(YCRCB(:,:,1));
    new_blur = (blur_ver+blur_hor)/2;
    blur_vect = [blur_vect new_blur];
    display(strcat('Fountain - slope = -4, Aperture =',num2str(aperture),' blurindex = ', num2str(new_blur)))
end

figure('Name','Plot on the Fountain image')
scatter(3:2:13,blur_vect,'filled'), xlim([1 15])
xlabel('Aperture size')
ylabel('blur index')
xlabel('Aperture size')


fitlm(3:2:13,blur_vect)


