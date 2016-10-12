function [ results ] = threshold_fct( img, thresh_mat )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [nx,ny] = size(img);
    [threshx, threshy] = size(thresh_mat);
    thresh_paved = repmat(thresh_mat, ceil(nx/threshx), ceil(ny/threshy));
    results= zeros(nx,ny);
    for indx=1:nx
        for indy=1:ny
            if img(indx,indy) > thresh_paved(indx,indy)
                results(indx,indy) = 1;
            end
        end
    end
                            
end

